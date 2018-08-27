<%@ Page Language="C#" AutoEventWireup="true" CodeFile="homepage-tea.aspx.cs" Inherits="homepage_stu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta charset="UTF-8"/>
	<script src="js/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/index-tea.css"/>
</head>
<body ondragstart="return false">
	<img src="image/logo.png" alt="logo" id="logo"/>
    <form runat="server">
	<div id="main">
		<img src="image/share.png" alt="share" id="share"/>
		<div style="display: flex;align-items: center;">
			<asp:TextBox id="txtSelect" runat="server" class="input" name="search" style="margin-top: 26px;width: 650px;"></asp:TextBox>
			<asp:Button runat="server" text="搜索" class="button" style="width: 125px;" onclick="butSelect_Click"/>		
		</div>

		<div id="part1">
			<div id="gg" style="margin-left:88px">
				<img src="image/gg.png" alt="gg" id="gongg"/>
                <asp:DataList ID="dataNotice" runat="server" DataSourceID="SqlDataSource1" 
                    DataKeyField="ID" onitemcommand="dataNotice_ItemCommand" 
                    onitemdatabound="dataNotice_ItemDataBound">
                    <FooterTemplate>
                        <table style="width: 470px; height: 20px; margin-left: 20px; margin-right: 20px;  font-family: 微软雅黑; font-size: 10px; color: #A3C1DB;">
                        <td style="width: 40px; height: 20px; margin-left: 20px; font-family: 微软雅黑; font-size: 10px; color: #A3C1DB;"><asp:Label ID="LabCurrentPage" runat="server"  ForeColor="#A3C1DB" Font-Bold="True" Font-Size="10px" Font-Underline="False"  Text="Label"></asp:Label></td><td>/</td>
                        <td style="width:40px;"><asp:Label ID="LabPageCount" runat="server" ForeColor="#A3C1DB" Font-Bold="True" Font-Size="10px" Font-Underline="False" Text="Label"></asp:Label></td>
                        <td style="width:60px;"> <asp:LinkButton ID="LnkbtnFirst" runat="server"  ForeColor="#A3C1DB" Font-Bold="True" Font-Size="10px" Font-Underline="False"  CommandName="first">首页</asp:LinkButton></td>
                        <td style="width:80px;"><asp:LinkButton ID="LnkbtnFront" runat="server"  ForeColor="#A3C1DB" Font-Bold="True" Font-Size="10px" Font-Underline="False"  CommandName="pre">上一页</asp:LinkButton></td>
                        <td style="width:80px;"><asp:LinkButton ID="LnkbtnNext" runat="server" ForeColor="#A3C1DB" Font-Bold="True" Font-Size="10px" Font-Underline="False"  CommandName="next">下一页</asp:LinkButton></td>
                        <td style="width:60px;"><asp:LinkButton ID="LnkbtnLast" runat="server"  ForeColor="#A3C1DB" Font-Bold="True" Font-Size="10px" Font-Underline="False"  CommandName="last">尾页</asp:LinkButton></td>
                        <td style="width:100px;"> 跳转至：<asp:TextBox class="input" ID="txtPage" runat="server" Height="10px" Width="30px" Font-Size="10px"></asp:TextBox></td>
                        <td style="width: 50px; height: 20px; margin-left: 20px; font-family: 微软雅黑; font-size: 8px; color: #A3C1DB;"><asp:linkButton ID="Button1" runat="server" ForeColor="#A3C1DB" Font-Bold="True" Font-Size="10px" Font-Underline="False"   Text="GO" CommandName="search" Height="13px" Width="20px" /></td></tr>
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
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Time") %>' ForeColor="#A3C1DB" Font-Size="10px"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
			    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FileShareConnectionString %>" 
                    SelectCommand="SELECT * FROM [Notice] ORDER BY [Time] DESC">
                </asp:SqlDataSource>
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
				<a style="text-decoration:none;" href="homepage-tea.aspx">
                    <div id="bb">教师文件</div>
                </a>
				<a style="text-decoration:none;" href="homepage-stu.aspx">
                <div id="bbb">学生文件</div></a>
			</div>
			<div id="rank">
				<img src="image/more.png" alt="more" id="more"/>
                 <asp:DataList ID="dataFile" runat="server" DataSourceID="SqlDataSource2" 
                    DataKeyField="ID" onitemcommand="dataFile_ItemCommand" 
                    onitemdatabound="dataFile_ItemDataBound">
                    <FooterTemplate>
                        <table style="width: 884px; height: 40px; margin-left: 40px; margin-right: 40px;  font-family: 微软雅黑; font-size: 17px; color: #A3C1DB;">
                        <td style="width: 50px; height: 40px; margin-left: 20px; font-family: 微软雅黑; font-size: 17px; color: #A3C1DB;"><asp:Label ID="LabCurrentPage" runat="server"  ForeColor="#A3C1DB" Font-Bold="True" Font-Size="17px" Font-Underline="False"  Text="Label"></asp:Label></td><td>/</td>
                        <td style="width:80px;"><asp:Label ID="LabPageCount" runat="server" ForeColor="#A3C1DB" Font-Bold="True" Font-Size="17px" Font-Underline="False" Text="Label"></asp:Label></td>
                        <td style="width:120px;"> <asp:LinkButton ID="LnkbtnFirst" runat="server"  ForeColor="#A3C1DB" Font-Bold="True" Font-Size="17px" Font-Underline="False"  CommandName="first">首页</asp:LinkButton></td>
                        <td style="width:160px;"><asp:LinkButton ID="LnkbtnFront" runat="server"  ForeColor="#A3C1DB" Font-Bold="True" Font-Size="17px" Font-Underline="False"  CommandName="pre">上一页</asp:LinkButton></td>
                        <td style="width:160px;"><asp:LinkButton ID="LnkbtnNext" runat="server" ForeColor="#A3C1DB" Font-Bold="True" Font-Size="17px" Font-Underline="False"  CommandName="next">下一页</asp:LinkButton></td>
                        <td style="width:60px;"><asp:LinkButton ID="LnkbtnLast" runat="server"  ForeColor="#A3C1DB" Font-Bold="True" Font-Size="17px" Font-Underline="False"  CommandName="last">尾页</asp:LinkButton></td>
                        <td style="width:200px;"> 跳转至：<asp:TextBox class="input" ID="txtPage" runat="server" Height="20px" Width="60px" Font-Size="17px"></asp:TextBox></td>
                        <td style="width: 100px; height: 20px; margin-left: 20px; font-family: 微软雅黑; font-size: 17px; color: #A3C1DB;"><asp:linkButton ID="Button1" runat="server" ForeColor="#A3C1DB" Font-Bold="True" Font-Size="17px" Font-Underline="False"   Text="GO" CommandName="search"/></td></tr>
                        </table>
                    </FooterTemplate>
                    <ItemTemplate>
                        <table style="width: 1000px; height: 40px; margin-left: 50px; font-family: 微软雅黑; font-size: 20px;">
                            <tr>
                                <td style="width: 680px; height: 40px; text-align: left;">
                                    <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("fileName") %>' 
                                        ForeColor="#A3C1DB" Font-Bold="True" Font-Size="20px" Font-Underline="False" 
                                        CommandName="Select"></asp:LinkButton>
                                </td>
                                <td style="width: 300px; height: 40px">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Time") %>' ForeColor="#A3C1DB" Font-Size="20px"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
			    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FileShareConnectionString %>" 
                    SelectCommand="SELECT * FROM [FileAttributes] WHERE [UploaderType] = 'Teacher' ORDER BY [Time] DESC ">
                </asp:SqlDataSource>
			</div>
			</div>
		</div>
    </form>
</body>
<script type="text/javascript" src="js/index-tea.js"></script>
</html>
