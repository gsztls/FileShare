$(function () {
    $(":radio").click(function () {
        if ($(this).val() == "part1") {
            select1.style.display = '';
        }
        if ($(this).val() == "none1" || $(this).val() == "all1") {
            select1.style.display = 'none';
        }
    });

}
 );

  $(function(){
  $(":radio").click(function(){
    if($(this).val()=="part2")
    	{
    	    select2.style.display = '';
    	}
    	if($(this).val()=="none2"||$(this).val()=="all2")
    	{
    	    select2.style.display = 'none';
    	}
    });
  
}
 );

var progress = $(".progress-bar"),
status = $(".progress-bar-status"),
percentVal = '0%';
//上传步骤 
$("#myupload").ajaxSubmit({
    url: uploadUrl,
    type: "POST",
    dataType: 'json',
    beforeSend: function () {
        $(".progress").removeClass("hidden");
        progress.width(percentVal);
        status.html(percentVal);
    },
    uploadProgress: function (event, position, total, percentComplete) {
        percentVal = percentComplete + '%';
        progress.width(percentVal);
        status.html(percentVal);
        console.log(percentVal, position, total);
    },
    success: function (result) {
        percentVal = '100%';
        progress.width(percentVal);
        status.html(percentVal);
        //获取上传文件信息 
        uploadFileResult.push(result);
        // console.log(uploadFileResult); 
        $(".fudFile").html(result.name);
        var val = "<%=getFlieName()%>";
    },
    error: function (XMLHttpRequest, textStatus, errorThrown) {
        console.log(errorThrown);
        $(".upload-file-result").empty();
    }
});
