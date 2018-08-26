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
<form runat="server">
	<div id="main">
		<div>
            <asp:FileUpload ID="fudFile" runat="server" />
            <asp:Label ID="lblMessage" runat="server"></asp:Label><br />
			<label style="font-weight: bold;" for="username">文件名：<input type="text" class="input" name="fileName"/><br /><br />
			<label style="font-weight: bold;" for="username">文件类型：</label>
			<input type="text" class="input" name="fileType"></br></br>
			<form id="chose1">
				<label style="font-weight: bold;" for="vis_authority">可见权限:</label>
			<input type="radio" name="vis_authority" value="all1" >全部人可见
			<input type="radio" name="vis_authority" value="part1" >部分人可见
			<input type="radio" name="vis_authority" value="none1" >不可见</br>
			
            
			<div id="select1" style="display:none;">
				<select name="part_info" id="school">
					<option selected="selected">请选择学校</option>
				</select>
				<select name="part_info" id="college">
					<option selected="selected">请选择学院</option>
				</select>
				<select name="part_info" id="profession">
					<option selected="selected">请选择专业</option>
				</select>
				<select name="part_info" id="class">
					<option selected="selected">请选择班级</option>
				</select>
			</div>
				<label style="font-weight: bold;" for="down_authority">下载权限:</label>
			<input type="radio" name="down_authority" value="all2" id="chose2">全部人可见
			<input type="radio" name="down_authority" value="part2" id="chose2">部分人可见
			<input type="radio" name="down_authority" value="none2" id="chose2">不可见</br>
			
			<div id="select2" style="display:none;">
				<select name="part_info" id="Select2">
					<option selected="selected">请选择学校</option>
				</select>
				<select name="part_info" id="Select3">
					<option selected="selected">请选择学院</option>
				</select>
				<select name="part_info" id="Select4">
					<option selected="selected">请选择专业</option>
				</select>
				<select name="part_info" id="Select5">
					<option selected="selected">请选择班级</option>
				</select>
			</div>
            </form>
		
			<label style="font-weight: bold;" for="fileintro">文件介绍：</label>
			<textarea name="fileDescription" cols="30" rows="50" class="input" style="vertical-align:top;height: 120px;"></textarea><br />
			<asp:button runat="server" ID="btnUpload" runat="server" Text="上传" OnClick="btnUpload_Click" class="button"/>
		</div>
	</div>
</body>
</form>
<script src="js/upload.js"></script>
</html>
