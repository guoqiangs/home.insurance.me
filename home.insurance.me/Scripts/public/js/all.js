$(function(){
    $(".js-tab li").click(function(){
        $(this).addClass('current').siblings().removeClass("current");
        var index = $(this).index();
        var _index = $(this).attr("data-flag") - 1;
		var num = index + _index * 5;
        $(".f-tabContent").hide();
	   	$(".f-tabContent").eq(num).show();
    });
});


