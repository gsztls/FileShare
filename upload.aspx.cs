using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DroDataBind();
        }
    }
  
    protected void DroDataBind()
    {
         DataSet dt = SqlHelper.ExecuteDataset(CommandType.Text, "SELECT DISTINCT [School] FROM [FileShare].[dbo].[ClassInfo]");
         drpSchool.DataSource = dt.Tables[0];
         
         drpSchool.DataTextField = "School";
         drpSchool.DataValueField = "School";
         drpSchool.DataBind();
         drpCollegeDataBind();
         drpClassDataBind();
         drpSchool.Items.Insert(0, "请选择学校");
         drpCollege.Items.Insert(0, "请选择学院");
         drpClass.Items.Insert(0, "请选择专业班级");

         drpSchool2.DataSource = dt.Tables[0];

         drpSchool2.DataTextField = "School";
         drpSchool2.DataValueField = "School";
         drpSchool2.DataBind();
         drpSchool2.Items.Insert(0, "请选择学校");
         drpCollege2.Items.Insert(0, "请选择学院");
         drpClass2.Items.Insert(0, "请选择专业班级"); 
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        //string viewPeople = Request["vis_authority"].ToString();
        //if(viewPeople.Equals("part1"))
        //{
        //    viewPeople = Request["vis_authority"].ToString();
        //}
        string fileName = Request["fileName"].ToString();
        string fileType = Request["fileType"].ToString();
        string descrition = Request["fileDescription"].ToString();
        //定义保存路径
        string savePath = "file";
        string ID = Session["name"].ToString();
        DataSet dt = SqlHelper.ExecuteDataset(CommandType.Text,"SELECT * FROM [FileShare].[dbo].[AdminInfo] WHERE [User]='"+ID+"'");
        string Time = DateTime.Now.ToShortDateString();
        //是否存在目录
        if (!System.IO.Directory.Exists(Server.MapPath(savePath)))
        {
            //不存在创建文件夹
            System.IO.Directory.CreateDirectory(Server.MapPath(savePath) );
        }
        //上传文件
        if (fudFile.HasFile)
        {
            try
            {
                string sql = "INSERT INTO [FileShare].[dbo].[FileAttributes]([fileName],[Path],[Time],[downLoadCount],[fileSize],[Description],[Type],[Uploader],[UploaderType]) VALUES ('" + fileName + "','" + savePath + "/" + System.IO.Path.GetFileName(fudFile.FileName) + "','" + Time + "','0','" + fudFile.PostedFile.ContentLength / 1024 + "MB','" + fileType + "','" + dt.Tables[0].Rows[0]["Type"].ToString() + "','" + dt.Tables[0].Rows[0]["Name"].ToString() + "')";
                int judNum = SqlHelper.ExecuteNonQuery(CommandType.Text, "INSERT INTO [FileShare].[dbo].[FileAttributes]([fileName],[Path],[Time],[downLoadCount],[fileSize],[Description],[Type],[Uploader],[UploaderType]) VALUES ('" + System.IO.Path.GetFileName(fudFile.FileName) + "','" + savePath + "/" + System.IO.Path.GetFileName(fudFile.FileName) + "','" + Time + "','0','" + fudFile.PostedFile.ContentLength / 1024 / 1024 + "MB','"+descrition+"','" + fileType + "','" + dt.Tables[0].Rows[0]["Name"].ToString() + "','" + dt.Tables[0].Rows[0]["Type"].ToString() + "')");
               
                if (judNum > 0)
                {
                    fudFile.SaveAs(Server.MapPath(savePath) + "\\" + fudFile.FileName);
                    Response.Write("<script>alert('上传成功！');window.close()</script>");
                }
                else 
                {

                    Response.Write("<script>alert('上传失败！');window.close()</script>");
                }
                //lblMessage.Text = lblMessage.Text + "客户端路径：" + fudFile.PostedFile.FileName + "<br>" +
                //              "文件名：" + System.IO.Path.GetFileName(fudFile.FileName) + "<br>" +
                //              "文件扩展名：" + System.IO.Path.GetExtension(fudFile.FileName) + "<br>" +
                //              "文件大小：" + fudFile.PostedFile.ContentLength + " KB<br>" +
                //              "文件MIME类型：" + fudFile.PostedFile.ContentType + "<br>" +
                //              "保存路径：" + Server.MapPath(savePath) + "\\" + fudFile.FileName +
                //              "<hr>";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "发生错误：" ;                
            }
        }
        else
        {
            lblMessage.Text = "没有选择要上传的文件！";
        }
    }
    protected void drpSchool_SelectedIndexChanged(object sender, EventArgs e)
    {

        drpCollegeDataBind();
    }

    public string getFilename()
    {
       return System.IO.Path.GetFileName(fudFile.FileName);
    }
    protected void drpCollegeDataBind()
    {
        DataSet dt = SqlHelper.ExecuteDataset(CommandType.Text, "SELECT DISTINCT [College] FROM [FileShare].[dbo].[ClassInfo]");
        drpCollege.DataSource = dt.Tables[0];
        drpCollege.DataTextField = "College";
        drpCollege.DataValueField = "College";
        drpCollege.DataBind();

        drpCollege2.DataSource = dt.Tables[0];
        drpCollege2.DataTextField = "College";
        drpCollege2.DataValueField = "College";
        drpCollege2.DataBind();
    }
    protected void drpCollege_SelectedIndexChanged(object sender, EventArgs e)
    {
        drpClassDataBind();
    }

    protected void drpClassDataBind()
    {
        DataSet dt = SqlHelper.ExecuteDataset(CommandType.Text, "SELECT DISTINCT [Class] FROM [FileShare].[dbo].[ClassInfo]");
        drpClass.DataSource = dt.Tables[0];
        drpClass.DataTextField = "Class";
        drpClass.DataValueField = "Class";
        drpClass.DataBind();

        drpClass2.DataSource = dt.Tables[0];
        drpClass2.DataTextField = "Class";
        drpClass2.DataValueField = "Class";
        drpClass2.DataBind();
    }
}