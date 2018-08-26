<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowFile.aspx.cs" Inherits="ShowFile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<script src="js/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/FileView.css">
	<title><% =labTitle.Text %></title>
</head>
<body ondragstart="return false">
<form runat="server">
	<img src="image/logo.png" alt="logo" id="logo">
	
	<div>
		<div id="upper">
			<div id="filename"> <asp:Label ID="labTitle" runat="server" Text="Label"></asp:Label></div>
			<asp:button runat="server" Text="下载" class="button2" onclick="Unnamed1_Click" />
		</div>
		<div id="under_filename">由<asp:Label ID="labUploader" runat="server" Text="Label"></asp:Label>上传&nbsp&nbsp&nbsp&nbsp文件大小：<asp:Label ID="labFileSize" runat="server" Text="Label"></asp:Label>&nbsp&nbsp&nbsp&nbsp文件类型：<asp:Label
            ID="labType" runat="server" Text="Label"></asp:Label>&nbsp&nbsp&nbsp&nbsp下载次数：<asp:Label
                ID="labDownloadCount" runat="server" Text="Label"></asp:Label>&nbsp&nbsp&nbsp&nbsp上传时间：<asp:Label
                    ID="labTime" runat="server" Text="Label"></asp:Label><br/><br /><asp:Label ID="labDescription"
                        runat="server" Text="Label"></asp:Label></div>
			<table id="detail" cellspacing="15px">
				
				<tr>
					<th>文件预览：</th>
				</tr>
			</table>
            <script>
                var jsUrl = "<%=getUrl() %>>";
                ViewLink = "https://view.officeapps.live.com/op/view.aspx?src=" + "http://www.forfunfunfun.cn:83/" + jsUrl/*文件路径*/;
document.write("<div class=\"iframe-container\"><iframe src="+ViewLink+" frameborder=0 allowfullscreen></iframe></div>");
            </script></div>
</body>
</form>
<script src="js/FileView.js"></script>
</html>
