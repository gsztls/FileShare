<%@ Page Language="C#" AutoEventWireup="true" CodeFile="result.aspx.cs" Inherits="FileView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <script src="js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/result.css">
</head>
<body ondragstart="return false">
    <form runat="server">
    <img src="image/logo.png" alt="logo" id="logo">
    <div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
        <div style="display: flex; align-items: center; margin-top: 100px; position: absolute;">
            <asp:TextBox ID="txtSelect" runat="server" class="input" name="search" Style="margin-top: 26px;
                width: 650px;"></asp:TextBox>
            <asp:Button ID="butSelect" runat="server" Text="搜索" class="button" Style="width: 125px;"
                OnClick="butSelect_Click" />
        </div>
    </div>
    <div style="display:flex; justify-content: center; width:100%">
    <div id="gg" style="margin-top:178px;">
        <asp:DataList ID="dataFile" runat="server" OnItemCommand="dataFile_ItemCommand" 
            OnItemDataBound="dataFile_ItemDataBound">
            <FooterTemplate>
                <table style="width: 884px; height: 40px; margin-left: 40px; margin-right: 40px;
                    font-family: 微软雅黑; font-size: 17px; color: #A3C1DB;">
                    <td style="width: 50px; height: 40px; margin-left: 20px; font-family: 微软雅黑; font-size: 17px;
                        color: #A3C1DB;">
                        <asp:Label ID="LabCurrentPage" runat="server" ForeColor="#A3C1DB" Font-Bold="True"
                            Font-Size="17px" Font-Underline="False" Text="Label"></asp:Label>
                    </td>
                    <td>
                        /
                    </td>
                    <td style="width: 80px;">
                        <asp:Label ID="LabPageCount" runat="server" ForeColor="#A3C1DB" Font-Bold="True"
                            Font-Size="17px" Font-Underline="False" Text="Label"></asp:Label>
                    </td>
                    <td style="width: 120px;">
                        <asp:LinkButton ID="LnkbtnFirst" runat="server" ForeColor="#A3C1DB" Font-Bold="True"
                            Font-Size="17px" Font-Underline="False" CommandName="first">首页</asp:LinkButton>
                    </td>
                    <td style="width: 160px;">
                        <asp:LinkButton ID="LnkbtnFront" runat="server" ForeColor="#A3C1DB" Font-Bold="True"
                            Font-Size="17px" Font-Underline="False" CommandName="pre">上一页</asp:LinkButton>
                    </td>
                    <td style="width: 160px;">
                        <asp:LinkButton ID="LnkbtnNext" runat="server" ForeColor="#A3C1DB" Font-Bold="True"
                            Font-Size="17px" Font-Underline="False" CommandName="next">下一页</asp:LinkButton>
                    </td>
                    <td style="width: 60px;">
                        <asp:LinkButton ID="LnkbtnLast" runat="server" ForeColor="#A3C1DB" Font-Bold="True"
                            Font-Size="17px" Font-Underline="False" CommandName="last">尾页</asp:LinkButton>
                    </td>
                    <td style="width: 200px;">
                        跳转至：<asp:TextBox class="input" ID="txtPage" runat="server" Height="20px" Width="60px"
                            Font-Size="17px"></asp:TextBox>
                    </td>
                    <td style="width: 100px; height: 20px; margin-left: 20px; font-family: 微软雅黑; font-size: 17px;
                        color: #A3C1DB;">
                        <asp:LinkButton ID="Button1" runat="server" ForeColor="#A3C1DB" Font-Bold="True"
                            Font-Size="17px" Font-Underline="False" Text="GO" CommandName="search" />
                    </td>
                    </tr>
                </table>
            </FooterTemplate>
            <ItemTemplate>
                <table style="width: 1000px; height: 80px; margin-left: 50px; font-family: 微软雅黑;
                    font-size: 20px;">
                    <tr>
                        <td style="height: 40px; text-align: left;">
                            <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("fileName") %>' ForeColor="black"
                                Font-Bold="True" Font-Size="25px" Font-Underline="False" CommandName="Select"></asp:LinkButton>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Time") %>' ForeColor="#A3C1DB"
                                Font-Size="10px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server"  ForeColor="#999999" 
                                Text='<%# Eval("Description") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 500px">
                        </td>
                        <td>
                            <asp:Label ID="Label6" runat="server" ForeColor="#999999" Font-Size="10px" Text="下载次数："></asp:Label><asp:Label
                                ID="Label4" runat="server" ForeColor="#999999" Font-Size="10px" Text='<%# Eval("downloadCount") %>'></asp:Label>
                            <asp:Label ID="Label7" runat="server" Text="上传者：" ForeColor="#999999" Font-Size="10px"></asp:Label><asp:Label
                                ID="Label5" runat="server" ForeColor="#999999" Font-Size="10px" Text='<%# Eval("Uploader") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <hr />
                        </td>
                        <td>
                            <hr />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    </div>
</body>
</form>
<script src="js/result.js"></script>
</html>
