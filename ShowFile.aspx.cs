using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ShowFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        labDataBind();
    }

    protected void labDataBind()
    {
        string ID = "";
        try
        {
            ID = System.Text.RegularExpressions.Regex.Replace(System.Web.HttpContext.Current.Server.HtmlDecode(Request.QueryString["UrlID"].ToString()), "'", "");
        }
        catch (NullReferenceException e)
        {
            Response.Redirect("homepage-stu.aspx");
        }
        finally
        {
            DataSet dt = SqlHelper.ExecuteDataset(CommandType.Text, "SELECT * FROM [FileShare].[dbo].[FileAttributes] WHERE [ID] = '" + ID + "'");
            if (dt.Tables[0].Rows.Count > 0)
            {
                labTitle.Text = dt.Tables[0].Rows[0]["fileName"].ToString();
                labUploader.Text = dt.Tables[0].Rows[0]["Uploader"].ToString();
                labFileSize.Text = dt.Tables[0].Rows[0]["fileSize"].ToString();
                labType.Text = dt.Tables[0].Rows[0]["Type"].ToString();
                labDownloadCount.Text = dt.Tables[0].Rows[0]["downloadCount"].ToString();
                labTime.Text = dt.Tables[0].Rows[0]["time"].ToString();
                labDescription.Text = dt.Tables[0].Rows[0]["Description"].ToString();
                string Url = dt.Tables[0].Rows[0]["Path"].ToString();
              //  Response.Write(" <script language='javascript'>var jsUrl=" + Url + "</script>");
            }
            else
            {
                Response.Redirect("homepage-stu.aspx");
            }
        }
    }

    public string getUrl()
    {
        string Url = "";
        string ID = "";
        try
        {
            ID = System.Text.RegularExpressions.Regex.Replace(System.Web.HttpContext.Current.Server.HtmlDecode(Request.QueryString["UrlID"].ToString()), "'", "");
        }
        catch (NullReferenceException e)
        {
            Response.Redirect("homepage-stu.aspx");
        }
        finally
        {
            DataSet dt = SqlHelper.ExecuteDataset(CommandType.Text, "SELECT * FROM [FileShare].[dbo].[FileAttributes] WHERE [ID] = '" + ID + "'");
            if (dt.Tables[0].Rows.Count > 0)
            {
                Url = dt.Tables[0].Rows[0]["Path"].ToString();
                //  Response.Write(" <script language='javascript'>var jsUrl=" + Url + "</script>");
            }
            else
            {
                Response.Redirect("homepage-stu.aspx");
            }
        }
        return Url;

    }

    public bool CheckLogin() //以下代码检测用户登录参数是否正确
    {

        String user = (string)Session["name"];
        DataSet dt = SqlHelper.ExecuteDataset(CommandType.Text, "SELECT * FROM [FileShare].[dbo].[AdminInfo] WHERE [User] ='" + user + "'");
        if (dt.Tables[0].Rows.Count <= 0)
        {
            return false;
        }
        else
        {
            return true;
        }
    }


    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        if (CheckLogin())
        {
            string ID = "";
            try
            {
                ID = System.Text.RegularExpressions.Regex.Replace(System.Web.HttpContext.Current.Server.HtmlDecode(Request.QueryString["UrlID"].ToString()), "'", "");
            }
            catch (NullReferenceException e1)
            {
                Response.Redirect("homepage-stu.aspx");
            }
            finally
            {
                DataSet dt = SqlHelper.ExecuteDataset(CommandType.Text, "SELECT * FROM [FileShare].[dbo].[FileAttributes] WHERE [ID] = '" + ID + "'");
                if (dt.Tables[0].Rows.Count > 0)
                {
                    String Url = dt.Tables[0].Rows[0]["Path"].ToString();
                    Response.Redirect(Url);
                }
                else
                {
                    Response.Write("<script>alert('您尚未登录，请登录后再尝试下载。');location.href='login.aspx'</script>");
                }
            }
        
        }
        else
        {
            Response.Write("<script>alert('您尚未登录，请登录后再尝试下载。');location.href='login.aspx'</script>");
        }
    }
}