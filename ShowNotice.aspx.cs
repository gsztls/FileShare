using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ShowNotice : System.Web.UI.Page
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
            DataSet dt = SqlHelper.ExecuteDataset(CommandType.Text, "SELECT * FROM [FileShare].[dbo].[Notice] WHERE [ID] = '" + ID + "'");
            if (dt.Tables[0].Rows.Count > 0)
            {
                labTitle.Text = dt.Tables[0].Rows[0]["Title"].ToString();
                labTime.Text = dt.Tables[0].Rows[0]["Time"].ToString();
                labContent.Text = dt.Tables[0].Rows[0]["Content"].ToString();
            }
            else
            {
                Response.Redirect("homepage-stu.aspx");
            }
        }
    }
}