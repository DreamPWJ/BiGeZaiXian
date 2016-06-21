$(function(){
    //url获取type   tab标签页类型
    var type= getQueryString("type");
    if(type=='market'){
         $("#markettab").click();
    }else if(type=='industry'){
        $("#industrytab").click();
    }

    try {
        $.getScript("/BiGeZaiXian/plugins/JqueryPagination/jquery.pagination-1.2.7.min.js").complete(function(){
            JHWNewspage1();
            JHWNewspage2();
        });
    } catch (e) {
        console.error("聚化网jsp没有引入jquery.pagination-1.2.7.min.js文件!");
    }

    function JHWNewspage1() {
        var urlpage = $("#urlpage1").val(); //获取请求url
        var pagepoint = "#" + $("#urlpage1").attr("pagepoint") || "";//翻页定位锚点
        $("#page1").page({
            total: $("#totalcount1").val(),//获取总条数
            pageSize: $("#pageSize1").val(),//每页显示数据条数
            firstBtnText: '首页',
            lastBtnText: '尾页',
            prevBtnText: '上一页',
            nextBtnText: '下一页',
            showInfo: true,
            infoFormat: '共{total}条'
        });
        $("#page1").on("pageClicked", function (event, pageIndex) {//点击分页条查询
            var flag = urlpage.indexOf("?") == -1 ? "?" : "&";
            window.location.href = urlpage + flag + "pageIndex=" + (pageIndex + 1) + pagepoint;
        })
        //获取url链接 ?参数变量的值(截取等号后面的部分)
        var loc =getQueryString("pageIndex");
        //分页刷新后重新标记分页条的当前页数
        $("#page1 .m-pagination-page li").each(function (index) {
            if ($(this).children("a").text() == loc) {
                $(this).siblings().removeClass("active").end().addClass("active");
                return;
            }
        })



    }

    function JHWNewspage2() {
        var urlpage = $("#urlpage2").val(); //获取请求url
        var pagepoint = "#" + $("#urlpage2").attr("pagepoint") || "";//翻页定位锚点
        $("#page2").page({
            total: $("#totalcount2").val(),//获取总条数
            pageSize: $("#pageSize2").val(),//每页显示数据条数
            firstBtnText: '首页',
            lastBtnText: '尾页',
            prevBtnText: '上一页',
            nextBtnText: '下一页',
            showInfo: true,
            infoFormat: '共{total}条'
        });
        $("#page2").on("pageClicked", function (event, pageIndex) {//点击分页条查询
            var flag = urlpage.indexOf("?") == -1 ? "?" : "&";
            window.location.href = urlpage + flag + "pageIndex=" + (pageIndex + 1) + pagepoint;
        })
        //获取url链接 ?参数变量的值(截取等号后面的部分)
        var loc =getQueryString("pageIndex");
        //分页刷新后重新标记分页条的当前页数
        $("#page2 .m-pagination-page li").each(function (index) {
            if ($(this).children("a").text() == loc) {
                $(this).siblings().removeClass("active").end().addClass("active");
                return;
            }
        })



    }

    /*点击更多*/
    $(".pthd .pthd-z .pingtai").click(function(){
        toggle();
        $("#platform").addClass("active");

    });
    $(".pthd .pthd-z .hangye").click(function(){
        toggle();
        $("#market").addClass("active");

    });
    $(".pthd .pthd-z .shichang").click(function(){
        toggle();
        $("#industry").addClass("active");

    });
    function toggle(){
        $(".flat").slideUp();
        $(".tab-content .tab-pane").removeClass("active");
    }

     /*返回资讯中心*/
    $(".newMain").on("click",function(){
        $("#platform").removeClass("active");
        $("#market").removeClass("active");
        $("#industry").removeClass("active");
        $(".flat").slideDown();
    });

})