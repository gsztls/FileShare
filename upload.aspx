<%@ Page Language="C#" AutoEventWireup="true" CodeFile="upload.aspx.cs" Inherits="upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat = "server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="format-detection" content="telephone=no">
	<meta charset="UTF-8">
	<script src="js/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/upload.css">
</head>
<body ondragstart="return false">
<form id="chose1" runat="server">
	<div id="main">
		<div>   
            <asp:FileUpload ID="fudFile" runat="server" />
            <asp:Label ID="lblMessage" runat="server"></asp:Label><br />
			<label style="font-weight: bold;" for="username">文件名：<input type="text" class="input" name="fileName"/><br /><br />
			<label style="font-weight: bold;" for="username">文件类型：</label>
			<input type="text" class="input" name="fileType"></br></br>
			
		    <label style="font-weight: bold;" for="vis_authority">可见权限:</label>
			<input type="radio" name="vis_authority" value="all" >全部人可见
			<input type="radio" name="vis_authority" value="part1" >部分人可见
			<input type="radio" name="vis_authority" value="none1" >不可见<br />
			
            
			<div id="select1" style="display:none;">
                    <asp:DropDownList ID="drpSchool" runat="server" onselectedindexchanged="drpSchool_SelectedIndexChanged">
                    </asp:DropDownList>
					<asp:DropDownList ID="drpCollege" runat="server" onselectedindexchanged="drpCollege_SelectedIndexChanged" >
                    </asp:DropDownList>
					<asp:DropDownList ID="drpClass" runat="server"  >
                    </asp:DropDownList>
			</div>
				<label style="font-weight: bold;" for="down_authority">下载权限:</label>
			<input type="radio" name="down_authority" value="all2" id="chose2">全部人可见
			<input type="radio" name="down_authority" value="part2" id="chose2">部分人可见
			<input type="radio" name="down_authority" value="none2" id="chose2">不可见</br>
			
			<div id="select2" style="display:none;">
				  <asp:DropDownList ID="drpSchool2" runat="server" onselectedindexchanged="drpSchool_SelectedIndexChanged">
                    </asp:DropDownList>
					<asp:DropDownList ID="drpCollege2" runat="server" onselectedindexchanged="drpCollege_SelectedIndexChanged" >
                    </asp:DropDownList>
					<asp:DropDownList ID="drpClass2" runat="server"  >
                    </asp:DropDownList>
			</div>
            
		
			<label style="font-weight: bold;" for="fileintro">文件介绍：</label>
			<textarea name="fileDescription" cols="30" rows="50" class="input" style="vertical-align:top;height: 120px;"></textarea><br />
			<asp:button runat="server" ID="btnUpload" runat="server" Text="上传" OnClick="btnUpload_Click" class="button"/>
            <div class="upload-file-stateWrap">
        <span class="upload-file-result"></span>            
        <div class="progress hidden">
            <div class="progress-bar" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                <span class="progress-bar-status">0%</span>
            </div>
        </div>
    </div>
		</div>
	</div>
    </form>
</body>
<script src="js/upload.js"></script>
</html>
