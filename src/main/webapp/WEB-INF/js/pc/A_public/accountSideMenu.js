/*个人中心左侧菜单栏*/
$(function () {

    var menupath = location.pathname;//当前请求路径
    $(".one").click(function () {
        $(".menu-items").slideUp(500);
        $(".one").removeClass("menu-click-color");
        $(this).addClass("menu-click-color").next(".menu-items").slideDown(1000);
    })

    $(".account-leftmenu .one  a").click(function () {
        $(".account-leftmenu .one a").css({"color": "#585858"});
        $(this).css({"color": "#1caaeb"});
    })

    $(".account-leftmenu .menu-items a").click(function () {
        $(".account-leftmenu .menu-items a").css({"color": "#585858"});
        $(this).css({"color": "#1caaeb"});
        $(this).parents(".menu-items").prev(".one").addClass("menu-click-color");
    })
    /**
     * 根据url修改菜单显示
     */
    $(".account-leftmenu a").each(function () {
        var href = $(this).attr("href");
        if (href == menupath) {//路径匹配
            $(this).css({"color": "#1caaeb"})
            if ($(this).parent(".one").length > 0) {
                $(this).parent(".one").next(".menu-items").slideDown(1000);
                $(this).parent(".one").addClass("menu-click-color").css({"color": "#1caaeb"});
            } else {
                $(this).parents(".menu-items").slideDown(1000);
                $(this).parents(".menu-items").prev(".one").addClass("menu-click-color").children("a").css({"color": "#1caaeb"});
            }
        }
    })
})
