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
				<asp:button text="上传文件" id="Upload" runat="server" class="buttonn" style="margin-top: 5px;" />
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
			<p id="th"><br /></p>
			
			<div id="list">
                <asp:GridView ID="griFile" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="550px" 
                    AllowPaging="True" HorizontalAlign="Center" 
                    onpageindexchanging="griFile_PageIndexChanging" DataKeyNames="ID" 
                    onrowdeleting="griFile_RowDeleting" onrowupdating="griFile_RowUpdating" >
                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkFile" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="fileName" HeaderText="文件名" 
                            SortExpression="fileName" />
                        <asp:BoundField DataField="fileSize" HeaderText="文件大小" 
                            SortExpression="fileSize" />
                        <asp:BoundField DataField="downloadCount" HeaderText="下载次数" 
                            SortExpression="downloadCount" />
                        <asp:BoundField DataField="Time" HeaderText="时间" SortExpression="Time" />
                        
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Update"  >查看</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Delete" OnClientClick="{if(confirm('确定删除？')){return true;}return false;}">删除</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField></asp:TemplateField>
                        
                    </Columns>

                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#A3C1DB" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#A3C1DB" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#A3C1DB"  HorizontalAlign="Center" />
                    <RowStyle BackColor="#E7EEF5" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#A3C1DB" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </div>
            <div>
                <asp:CheckBox Text="全选" style="margin-left:27px;" ID="ChkAll" runat="server" 
                    oncheckedchanged="ChkAll_CheckedChanged" AutoPostBack="True" />
			<asp:button runat="server" Text="批量删除" class="button" style="margin-left:466px;margin-top: -20px;width:85px;" OnClientClick="{if(confirm('确定删除选中内容？')){return true;}return false;}"/></div></div>
    </form>
</body>
<script type="text/javascript" src="js/private.js"></script>
</html>
