using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Collections;

public partial class person : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckLogin();
        gridviewDataBind();
    }

    protected void labDataBind()
    {
        String user = (String)Session["name"];
        DataSet dt = SqlHelper.ExecuteDataset(CommandType.Text,"SELECT * FROM [FileShare].[dbo].[AdminInfo] WHERE [User]='"+user+"'");
        labUser.Text = dt.Tables[0].Rows[0]["User"].ToString();
        labName.Text=dt.Tables[0].Rows[0]["Name"].ToString();
        labSchool.Text = dt.Tables[0].Rows[0]["School"].ToString();
        labCollege.Text = dt.Tables[0].Rows[0]["College"].ToString();
        labClass.Text = dt.Tables[0].Rows[0]["Class"].ToString();
        griFile.PageIndex = 0;
    }

    protected void CheckLogin() //以下代码检测用户登录参数是否正确
    {

        String user = (string)Session["name"];
        DataSet dt = SqlHelper.ExecuteDataset(CommandType.Text, "SELECT * FROM [FileShare].[dbo].[AdminInfo] WHERE [User] ='" + user + "'");
        if (dt.Tables[0].Rows.Count <= 0)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            labDataBind();
        }
    }

    public String getUploader()
    {
        String user = (string)Session["name"];
        DataSet dt = SqlHelper.ExecuteDataset(CommandType.Text, "SELECT * FROM [FileShare].[dbo].[AdminInfo] WHERE [User] ='" + user + "'");
        String strUploader = dt.Tables[0].Rows[0]["Name"].ToString();
        return strUploader;
    }

    protected void gridviewDataBind()
    {
        DataSet dt = SqlHelper.ExecuteDataset(CommandType.Text, "SELECT * FROM [FileShare].[dbo].[FileAttributes] WHERE [Uploader] ='" + getUploader() + "'");
        griFile.DataSource = dt.Tables[0];
        griFile.DataSourceID = null;
        griFile.DataKeyNames = new string[]{ "ID"};
        griFile.DataBind();
    }

    protected void LogOut_Click(object sender, EventArgs e)
    {
        Session["name"] = null;
        Response.Redirect("login.aspx");
    }
    protected void griFile_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        griFile.PageIndex = e.NewPageIndex;
        gridviewDataBind();
    }


    protected void griFile_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string UrlID = griFile.DataKeys[e.RowIndex].Value.ToString();
        Response.Redirect("ShowFile.aspx?UrlID=" + System.Web.HttpContext.Current.Server.HtmlEncode(UrlID) + "");
    }
    protected void griFile_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = int.Parse(griFile.DataKeys[e.RowIndex].Value.ToString());
        int JudgeNum = SqlHelper.ExecuteNonQuery(CommandType.Text, "DELETE FROM [FileShare].[dbo].[FileAttribute] WHERE ID ='" + ID + "'");
        griFile.EditIndex = -1;
        gridviewDataBind();
        if (JudgeNum > 0)
        {
            Response.Write("<script>alert('删除成功！')</script>");
        }
        else
        {
            Response.Write("<script>alert('删除失败！')</script>");
            return;
        }
    }
    protected void ChkAll_CheckedChanged(object sender, EventArgs e)
    {
       
        for (int i = griFile.PageIndex*griFile.Rows.Count ; i < griFile.PageIndex*griFile.Rows.Count+griFile.Rows.Count; i++)
        {
            
            CheckBox chk = (CheckBox)griFile.Rows[i].FindControl("chkFile");
            if (ChkAll.Checked == true)
            {
                chk.Checked = true;
                ChkAll.Text = "全不选";
            }
            if (ChkAll.Checked == false)
            {
                chk.Checked = false;
                ChkAll.Text = "全选";
            }

        }
    }
}