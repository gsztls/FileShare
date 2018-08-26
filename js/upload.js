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