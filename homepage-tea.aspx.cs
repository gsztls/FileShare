using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class homepage_stu : System.Web.UI.Page
{
    protected static PagedDataSource pdsNotice = new PagedDataSource();
    protected static PagedDataSource pdsFile = new PagedDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckLogin();
        dataNoticeBind(0);
        dataFileBind(0);
    } 

    protected void dataNoticeBind(int currentpage )
    {
        pdsNotice.AllowPaging = true;
        pdsNotice.PageSize = 4;
        pdsNotice.CurrentPageIndex = currentpage;
        DataSet dt = SqlHelper.ExecuteDataset(CommandType.Text, "SELECT * FROM [FileShare].[dbo].[Notice] ORDER BY [Time] DESC");
        pdsNotice.DataSource = dt.Tables[0].DefaultView;
        dataNotice.DataSource = pdsNotice;
        dataNotice.DataSourceID = null;
        dataNotice.DataBind();
    }

    protected void dataFileBind(int currentpage)
    {
        pdsFile.AllowPaging = true;
        pdsFile.PageSize = 12;
        pdsFile.CurrentPageIndex = currentpage;
        DataSet dt1 = SqlHelper.ExecuteDataset(CommandType.Text, "SELECT * FROM [FileShare].[dbo].[FileAttributes] WHERE [UploaderType]='Teacher' ORDER BY [Time] DESC");
        pdsFile.DataSource = dt1.Tables[0].DefaultView;
        dataFile.DataSource = pdsFile;
        dataFile.DataSourceID = null;
        dataFile.DataBind();
    }
    public void CheckLogin() //以下代码检测用户登录参数是否正确
    {

        String user = (string)Session["name"];
        DataSet dt = SqlHelper.ExecuteDataset(CommandType.Text, "SELECT * FROM [FileShare].[dbo].[AdminInfo] WHERE User ='" + user + "'");
        if (dt.Tables[0].Rows.Count > 0)
        {
            Response.Redirect("homepage-tea-ok.aspx");
        }
    }


    protected void Unnamed5_Click(object sender, EventArgs e)
    {
        String name = txtUser.Text.Trim(), pwd = txtPwd.Text.Trim();
        if (name.Equals("") || pwd.Equals("") || name.Equals("UserID") || pwd.Equals("Password"))
        {
            Response.Write("<script>alert('用户名或密码不能为空！');location.href='homepage-stu.aspx'</script>");
            return;
        }
        DataSet dt = SqlHelper.ExecuteDataset(CommandType.Text, "SELECT * FROM [FileShare].[dbo].[Admin] WHERE [User]='" + name + "'AND Pwd='" + pwd + "'");
        if (dt.Tables[0].Rows.Count <= 0)
        {
            Response.Write("<script>alert('用户名或密码错误！');location.href='homepage-stu.aspx'</script>");
            return;
        }
        else
        {
            Session["name"] = name;
            Response.Redirect("homepage-tea-ok.aspx");
        }
    }
    protected void dataNotice_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName.Equals("Select"))
        {
            String ID = dataNotice.DataKeys[e.Item.ItemIndex].ToString();
            Response.Redirect("ShowNotice?UrlID='"+System.Web.HttpContext.Current.Server.HtmlEncode(ID)+"'");
        }
        switch (e.CommandName) 
        {
            case "first":
                pdsNotice.CurrentPageIndex = 0;
                dataNoticeBind(pdsNotice.CurrentPageIndex);
                break;
            case "pre":
                pdsNotice.CurrentPageIndex = pdsNotice.CurrentPageIndex - 1;
                dataNoticeBind(pdsNotice.CurrentPageIndex);
                break;
            case "next":
                pdsNotice.CurrentPageIndex = pdsNotice.CurrentPageIndex + 1;
                dataNoticeBind(pdsNotice.CurrentPageIndex);
                break;
            case "last":
                pdsNotice.CurrentPageIndex = pdsNotice.PageCount - 1;
                dataNoticeBind(pdsNotice.CurrentPageIndex);
                break;
            case "search":
                if (e.Item.ItemType == ListItemType.Footer)
                {
                    int PageCount = int.Parse(pdsNotice.PageCount.ToString());
                    TextBox txtPage = e.Item.FindControl("txtPage") as TextBox;
                    int MyPageNum = 0;
                    if (!txtPage.Text.Equals(""))
                        MyPageNum = Convert.ToInt32(txtPage.Text.ToString());
                    if (MyPageNum <= 0 || MyPageNum > PageCount)
                        Response.Write("<script>alert('请输入页数并确认没有超出总页数！</script>");
                    else
                        dataNoticeBind(MyPageNum - 1);
                }
                break;
        }
    }
    protected void dataNotice_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Footer)
        {
            Label CurrentPage = e.Item.FindControl("LabCurrentPage") as Label;
            Label PageCount = e.Item.FindControl("LabPageCount") as Label;
            LinkButton FirstPage = e.Item.FindControl("LnkbtnFirst") as LinkButton;
            LinkButton PrePage = e.Item.FindControl("LnkbtnFront") as LinkButton;
            LinkButton NextPage = e.Item.FindControl("LnkbtnNext") as LinkButton;
            LinkButton LastPage = e.Item.FindControl("LnkbtnLast") as LinkButton;
            CurrentPage.Text = Convert.ToString(pdsNotice.CurrentPageIndex + 1);
            PageCount.Text = pdsNotice.PageCount.ToString();
            if (pdsNotice.IsFirstPage)
            {
                FirstPage.Enabled = false;
                PrePage.Enabled = false;
            }
            if (pdsNotice.IsLastPage)
            {
                NextPage.Enabled = false;
                LastPage.Enabled = false;
            }
        }
    }
    protected void dataFile_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName.Equals("Select"))
        {
            String ID = dataFile.DataKeys[e.Item.ItemIndex].ToString();
            Response.Redirect("ShowFile?UrlID='" + System.Web.HttpContext.Current.Server.HtmlEncode(ID) + "'");
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