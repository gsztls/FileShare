<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowNotice.aspx.cs" Inherits="ShowNotice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="format-detection" content="telephone=no">
	<meta charset="UTF-8">
	<script src="js/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/gg.css">
</head>
<form runat="server">
<body ondragstart="return false">
	<img src="image/logo.png" alt="logo" id="logo">
	<div id="main">
		<div id="head">
			<p id="h"><asp:Label ID="labTitle" runat="server" Text="Label"></asp:Label></p>
			<p id="time">发布时间：<asp:Label ID="labTime" runat="server" Text="Label"></asp:Label></p>
            
		</div>
		<div id="content">
            <asp:Label ID="labContent" runat="server" Text="Label"></asp:Label>
        </div>
	</div>
</body>
</form>
<script src="js/index.js"></script>
</html>
