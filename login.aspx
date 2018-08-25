<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<meta name="format-detection" content="telephone=no" />
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/index.css" />
</head>
<body ondragstart="return false">
	<img src="image/logo.png" alt="logo" id="logo" />
	<div id="main">
		<img src="image/share.png" alt="share" id="share"/>
		<form id="login1" style="display: flex;flex-direction: column;align-items: center;" runat="server">
			<asp:TextBox class="input" value="User ID" name="User ID" style="margin-top: 10px;" onfocus="javascript:this.style.color='#000000';if(this.value=='User ID')this.value='';" onblur="javascript:if(this.value==''){this.value='User ID';this.style.color='#CCCCCC';}" runat="server"></asp:TextBox></br>
		    <asp:TextBox class="input" value="Password" name="Password" onfocus="javascript:this.style.color='#000000';if(this.value=='Password')this.value='';" onblur="javascript:if(this.value==''){this.value='Password';this.style.color='#CCCCCC';}" runat="server"></asp:TextBox>
			<div style="align-items: center;flex-wrap: nowrap;">
				<asp:Button text="登录" class="button" runat="server"/>
				<asp:Button text="注册" class="button" disabled="disabled" style="cursor: no-drop;" runat="server" />
				<asp:Button text="忘记密码" class="button" disabled="disabled" style="cursor: no-drop;" runat="server"/>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript" src="js/index.js"></script>
</html>
