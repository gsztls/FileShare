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

    }
  
    protected void btnUpload_Click(object sender, EventArgs e)
    {
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
                int judNum = SqlHelper.ExecuteNonQuery(CommandType.Text, "INSERT INTO [FileShare].[dbo].[FileAttributes]([fileName],[Path],[Time],[downLoadCount],[fileSize],[Description],[Type],[Uploader],[UploaderType]) VALUES ('" + System.IO.Path.GetFileName(fudFile.FileName) + "','" + savePath + "/" + System.IO.Path.GetFileName(fudFile.FileName) + "','" + Time + "','0','" + fudFile.PostedFile.ContentLength / 1024 / 1024 + "MB','"+descrition+"','" + fileType + "','" + dt.Tables[0].Rows[0]["Type"].ToString() + "','" + dt.Tables[0].Rows[0]["Name"].ToString() + "')");
               
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
}