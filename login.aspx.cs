using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Unnamed3_Click(object sender, EventArgs e)
    {
        String name = txtUser.Text.Trim(), pwd = txtPwd.Text.Trim();
        if (name.Equals("") || pwd.Equals("")||name.Equals("UserID")||pwd.Equals("Password")) 
        {
            Response.Write("<script>alert('用户名或密码不能为空！')</script>");
            return;
        }
        DataSet dt = SqlHelper.ExecuteDataset(CommandType.Text,"SELECT * FROM [FileShare].[dbo].[Admin] WHERE [User]='"+name+"'AND Pwd='"+pwd+"'");
        if (dt.Tables[0].Rows.Count <= 0)
        {
            Response.Write("<script>alert('用户名或密码错误！')</script>");
            return;
        }
        else
        {
            Session["name"] = name;
            if (dt.Tables[0].Rows[0]["Type"].Equals("Student")) 
            {
                Response.Redirect("person-stu.aspx");
            }
            else if (dt.Tables[0].Rows[0]["Type"].Equals("Teacher"))
            {
                Response.Redirect("person.aspx");
            }
            else 
            {
                Response.Write("<script>alert('登录参数错误，请核对账号密码或联系管理员。')</script>");
                return;
            }
            
        }
    }
}