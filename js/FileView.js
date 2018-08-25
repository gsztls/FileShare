ViewLink="https://view.officeapps.live.com/op/view.aspx?src="+"www.forfunfunfun.cn/LINQ.docx"/*文件路径*/;
document.write("<div class=\"iframe-container\"><iframe src="+ViewLink+" frameborder=0 allowfullscreen></iframe></div>");

$(".button1").click(function(){
	$(".iframe-container iframe").animate({width:"100%",height:"100%",left:"0px"});
	$(".iframe-container").animate({top:"430px"});
})