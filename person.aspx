<%@ Page Language="C#" AutoEventWireup="true" CodeFile="person.aspx.cs" Inherits="person" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;"/>
	<meta name="apple-mobile-web-app-capable" content="yes"/>
	<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
	<meta name="format-detection" content="telephone=no"/>
	<script src="js/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/private.css">
</head>
<body ondragstart="return false">
	<img src="image/logo.png" alt="logo" id="logo"/>
    <form runat="Server">
	<div id="main">
		<div id="info">
			<img src="image/portrait.jpg" alt="portrait" id="portrait"/>
			<div id="tb">
				<asp:button id="ReplacePicture" text="更换头像" runat="server" class="button" disabled="disabled" style="cursor: no-drop;"/>
				<asp:button text="上传文件" id="Upload" runat="server" class="button" style="margin-top: 5px;" />
				<asp:button text="登出" id="LogOut" runat="server" class="button" 
                    style="margin-top: 5px;" onclick="LogOut_Click"/>
			</div>
			<table id="detail" cellspacing="15px">
				<tr>
					<th>姓名：<asp:Label ID="labName" runat="server" Text="Label"></asp:Label></th>
				</tr>
				<tr>
					<th>学号：<asp:Label ID="labUser" runat="server" Text="Label"></asp:Label></th>
				</tr>
				<tr>
					<th>学校：<asp:Label ID="labSchool" runat="server" Text="Label"></asp:Label></th>
				</tr>
				<tr>
					<th>学院：<asp:Label ID="labCollege" runat="server" Text="Label"></asp:Label></th>
				</tr>
				<tr>
					<th>专业班级：<asp:Label ID="labClass" runat="server" Text="Label"></asp:Label></th>
				</tr>
			</table>
		</div>
		<div id="upload">
			<img src="image/up.png" alt="upload" id="up">
			<p id="th">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp文件名&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp大小&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp类别&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp上传时间</p>
			
			<div id="list"></div>
			<button class="button" style="margin-left:466px;margin-top: 8px;width:85px;">删除</div>
		</div>
	</div>
    </form>
</body>
<script src="js/private.js"></script>
</html>
