// 初始化完成
$(function () {

    //主页大图轮播效果
    var picTotal = $("#naviSlider li").length;//有几个图片按钮
    var toDisplayPicNumber = 0;//点击那个图片切换按钮
    //点击事件
    $("#naviSlider li").on('click',
        function () {
            var currentIndex = $(this).index();//当前按钮位置
            var pic = $("#slider");//图片父容器ul
            if ($(pic).children("li").eq(currentIndex).is(":hidden")) {
                $(this).siblings().removeClass("on");//删除同级样式
                $(this).addClass("on");//添加点击按钮样式
                $(pic).children("li:not(:eq(+currentIndex+))").slideUp();//全部隐藏
                $(pic).children("li").eq(currentIndex).slideDown(300); //当前显示
            }

        });


    function picNumClick() {//图片数量点击事件
        $("#naviSlider li").eq(toDisplayPicNumber).trigger("click");//触发点击事件
        toDisplayPicNumber = (toDisplayPicNumber + 1) % picTotal;
    }

    setTimeout(picNumClick, 3000);//调用点击事件
    setInterval(picNumClick, 3000);//循环


    /**
     * 首页今日油价 网络爬虫异步获取数据
     */
    getTodayOilPrices();
    function getTodayOilPrices() {
        var todayOilData = sessionStorage.getItem("todayOil");
        if (todayOilData != null) {
            $("#todayoilprice").html("<tbody>" + todayOilData + "</tbody>");
            $("#todayoilprice tbody td").find("a").attr("href", "#");
        } else {
            $.ajax({
                type: "get",
                url: "/BiGeZaiXian/index/getTodayOilPrices",
                dataType: "text",
                success: function (data) {
                    if (data != "") {
                        $("#todayoilprice").html("<tbody>" + data + "</tbody>");
                        $("#todayoilprice tbody td").find("a").attr("href", "#");
                        sessionStorage.setItem("todayOil", data);
                    }
                }
            })
        }
    }


    $('#pvc').vTicker({
        height: 0,
        showItems: 11,
        pause: 3000,
        speed: 500,
        animation: "fade",
        mousePause: true,
        direction: "up",
    });


    $('#pp').vTicker({
        height: 0,
        showItems: 11,
        pause: 3000,
        speed: 500,
        animation: "fade",
        mousePause: true,
        direction: "up",
    });

    $('#pe').vTicker({
        height: 0,
        showItems: 11,
        pause: 3000,
        speed: 500,
        animation: "fade",
        mousePause: true,
        direction: "up",
    });


    /**
     * 帮你找货保存
     */
    $("#findgood-btn").click(function () {
        var content = $("#findgood-content").val();
        var phone = $("#findgood-phone").val();
        if (content == "") {
            alert("请填写找货内容，方便我们帮你找货！");
            return;
        }
        var phonereg=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
        if (!phonereg.test(phone)) {
            alert("请填写正确联系方式，方便我们联系您！");
            return;
        }
        $.ajax({
            type: "get",
            url: "/BiGeZaiXian/mall/saveFindGood",
            data: {
                content: content,
                phone: phone
            },
            dataType: "text",
            success: function (data) {
                alert(data);
                $("#findgood-content").val("");
                $("#findgood-phone").val("")
            },
            error: function () {
                alert("您的找货信息录入失败！");
            }
        })
    });

    /**
     * 返回顶部
     */
    $("#side-info-top").click(function(e){
         e.preventDefault();
        $('html,body').animate({scrollTop: 0}, 500);

    })
});