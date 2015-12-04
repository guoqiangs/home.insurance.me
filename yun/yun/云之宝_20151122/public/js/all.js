$(function(){
    $(".js-tab li").click(function(){
        $(this).addClass('current').siblings().removeClass("current");
        var index = $(this).index();
        $(".f-tabContent").hide();
        $(".f-tabContent").eq(index).show()
    });
});