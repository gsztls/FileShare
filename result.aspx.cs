using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class FileView : System.Web.UI.Page
{
    protected static PagedDataSource pdsFile = new PagedDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
        dataFileBind(0);
    }

    protected void dataFileBind(int currentpage)
    {
        string findText = "";
        try
        {
            findText = System.Text.RegularExpressions.Regex.Replace("%" + System.Web.HttpContext.Current.Server.HtmlDecode(Request.QueryString["UrlID"].ToString()) + "%", "'", ""); 
        }
        catch (NullReferenceException e)
        {
            dataFile.Visible = false;
        }
        finally
        {
            if (findText.Equals(""))
            {
                dataFile.Visible = false;
            }
            else
            {
                String sql = "SELECT * FROM [FileShare].[dbo].[FileAttributes] WHERE [FileName] LIKE '" + findText + "' OR [Type] LIKE '" + findText + "' OR [Uploader] LIKE '" + findText + "' ";
                DataSet dt = SqlHelper.ExecuteDataset(CommandType.Text, "SELECT * FROM [FileShare].[dbo].[FileAttributes] WHERE [FileName] LIKE '" + findText + "' OR [Type] LIKE '" + findText + "' OR [Uploader] LIKE '" + findText + "' ");
                pdsFile.AllowPaging = true;
                pdsFile.PageSize = 12;
                pdsFile.CurrentPageIndex = currentpage;
                pdsFile.DataSource = dt.Tables[0].DefaultView;
                dataFile.DataSource = pdsFile;
                dataFile.DataSourceID = null;
                dataFile.DataBind(); 
                dataFile.DataKeyField = "ID"; 
                dataFile.Visible = true;
            }
        }

    }

    protected void butSelect_Click(object sender, EventArgs e)
    {
        string gindText = txtSelect.Text.Trim();
        Response.Redirect("result.aspx?UrlID='" + System.Web.HttpContext.Current.Server.HtmlEncode(gindText) + "'");
    }
    protected void dataFile_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName.Equals("Select"))
        {
            String ID = dataFile.DataKeys[e.Item.ItemIndex].ToString();
            Response.Redirect("ShowFile.aspx?UrlID='" + System.Web.HttpContext.Current.Server.HtmlEncode(ID) + "'");
        }
        switch (e.CommandName)
        {
            case "first":
                pdsFile.CurrentPageIndex = 0;
                dataFileBind(pdsFile.CurrentPageIndex);
                break;
            case "pre":
                pdsFile.CurrentPageIndex = pdsFile.CurrentPageIndex - 1;
                dataFileBind(pdsFile.CurrentPageIndex);
                break;
            case "next":
                pdsFile.CurrentPageIndex = pdsFile.CurrentPageIndex + 1;
                dataFileBind(pdsFile.CurrentPageIndex);
                break;
            case "last":
                pdsFile.CurrentPageIndex = pdsFile.PageCount - 1;
                dataFileBind(pdsFile.CurrentPageIndex);
                break;
            case "search":
                if (e.Item.ItemType == ListItemType.Footer)
                {
                    int PageCount = int.Parse(pdsFile.PageCount.ToString());
                    TextBox txtPage = e.Item.FindControl("txtPage") as TextBox;
                    int MyPageNum = 0;
                    if (!txtPage.Text.Equals(""))
                        MyPageNum = Convert.ToInt32(txtPage.Text.ToString());
                    if (MyPageNum <= 0 || MyPageNum > PageCount)
                        Response.Write("<script>alert('请输入页数并确认没有超出总页数！</script>");
                    else
                        dataFileBind(MyPageNum - 1);
                }
                break;
        }
    }
    protected void dataFile_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Footer)
        {
            Label CurrentPage = e.Item.FindControl("LabCurrentPage") as Label;
            Label PageCount = e.Item.FindControl("LabPageCount") as Label;
            LinkButton FirstPage = e.Item.FindControl("LnkbtnFirst") as LinkButton;
            LinkButton PrePage = e.Item.FindControl("LnkbtnFront") as LinkButton;
            LinkButton NextPage = e.Item.FindControl("LnkbtnNext") as LinkButton;
            LinkButton LastPage = e.Item.FindControl("LnkbtnLast") as LinkButton;
            CurrentPage.Text = Convert.ToString(pdsFile.CurrentPageIndex + 1);
            PageCount.Text = pdsFile.PageCount.ToString();
            if (pdsFile.IsFirstPage)
            {
                FirstPage.Enabled = false;
                PrePage.Enabled = false;
            }
            if (pdsFile.IsLastPage)
            {
                NextPage.Enabled = false;
                LastPage.Enabled = false;
            }
        }
    }
}