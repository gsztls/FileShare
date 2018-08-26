using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class person : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
    }

    public void CheckLogin() //以下代码检测用户登录参数是否正确
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

    protected void LogOut_Click(object sender, EventArgs e)
    {
        Session["name"] = null;
        Response.Redirect("login.aspx");
    }
}