<%@ Page Language="C#" AutoEventWireup="true" CodeFile="homepage-stu.aspx.cs" Inherits="homepage_stu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta charset="UTF-8"/>
	<script src="js/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/index-stu.css"/>
</head>
<body ondragstart="return false">
	<img src="image/logo1.png" alt="logo" id="logo"/>
    <form runat="server">
	<div id="main">
		<img src="image/share.png" alt="share" id="share"/>
		<div style="display: flex;align-items: center;">
			<asp:TextBox id="txtSelect" runat="server" class="input" name="search" style="margin-top: 26px;width: 650px;"></asp:TextBox>
			<asp:Button runat="server" text="搜索" class="button" style="width: 125px;"/>		
		</div>

		<div id="part1">
			<div id="gg">
				<img src="image/gg.png" alt="gg" id="gongg"/>
                <asp:DataList ID="dataNotice" runat="server" DataSourceID="SqlDataSource1" 
                    DataKeyField="ID" onitemcommand="dataNotice_ItemCommand">
                    <FooterTemplate>
                        <table style="width: 540px; height: 20px; margin-left: 20px; font-family: 微软雅黑; font-size: 10px;">
                           <asp:Label ID="LabCurrentPage" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                        <asp:Label ID="LabPageCount" runat="server" ForeColor="Black" Text="Label"></asp:Label></td>
                        <td> <asp:LinkButton ID="LnkbtnFirst" runat="server" CommandName="first">首页</asp:LinkButton></td><td><asp:LinkButton ID="LnkbtnFront" runat="server" CommandName="pre">上一页</asp:LinkButton></td>
                        <td><asp:LinkButton ID="LnkbtnNext" runat="server" ForeColor="Black" 
                                CommandName="next">下一页</asp:LinkButton></td>
                        <td><asp:LinkButton ID="LnkbtnLast" runat="server" ForeColor="Black" 
                                CommandName="last">尾页</asp:LinkButton></td><td> 跳转至：<asp:TextBox 
                            ID="txtPage" runat="server" Height="19px" Width="140px"></asp:TextBox></td><td><asp:Button ID="Button1" runat="server" Text="GO" CommandName="search" 
/></td></tr>
                        </table>
                    </FooterTemplate>
                    <ItemTemplate>
                        <table style="width: 540px; height: 20px; margin-left: 20px; font-family: 微软雅黑; font-size: 10px;">
                            <tr>
                                <td style="width: 380px; height: 20px; text-align: left;">
                                    <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("Title") %>' 
                                        ForeColor="#A3C1DB" Font-Bold="True" Font-Size="10px" Font-Underline="False" 
                                        CommandName="Select"></asp:LinkButton>
                                </td>
                                <td style="width: 150px; height: 20px">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Time") %>' ForeColor="#A3C1DB" Font-Size="10"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
			    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FileShareConnectionString %>" 
                    SelectCommand="SELECT [Title], [Time] FROM [Notice]"></asp:SqlDataSource>
			</div>
			<div id="login">
				<asp:TextBox id="txtUser" runat="server" class="input" value="User ID" name="User ID" style="margin-top: 10px;width: 316px;" onfocus="javascript:this.style.color='#000000';if(this.value=='User ID')this.value='';" onblur="javascript:if(this.value==''){this.value='User ID';this.style.color='#CCCCCC';}"></asp:TextBox><br/>
		    	<asp:TextBox id="txtPwd" runat="server" type="text" class="input" value="Password" name="Password" style="width: 316px;" onfocus="javascript:this.style.color='#000000';if(this.value=='Password')this.value='';" onblur="javascript:if(this.value==''){this.value='Password';this.style.color='#CCCCCC';}"></asp:TextBox> 
				<div style="align-items: center;flex-wrap: nowrap;">
					<asp:Button text="登录" class="button1" runat="server" onclick="Unnamed5_Click"/>
					<asp:Button text="注册" class="button1" disabled="disabled" style="cursor: no-drop;" runat="server"/>
					<asp:Button Text="忘记密码" class="button1" disabled="disabled" style="cursor: no-drop;" runat="server"/>
				</div>
			</div>
		</div>

		<div id="part2">
			<div id="b">
				<div id="bbb">
					教师文件
				</div>
				<div id="bb">
					学生文件
				</div>
			</div>
			<div id="rank">
				<img src="image/more.png" alt="more" id="more"/>
                 
			</div>
		</div>
	</div>
    </form>
</body>
<script type="text/javascript" src="js/index-stu.js"></script>
</html>
