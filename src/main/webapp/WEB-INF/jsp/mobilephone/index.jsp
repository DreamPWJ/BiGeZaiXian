<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
    <jsp:include page="top.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/js/commonUtil.js"/>"></script>
    <script src="<c:url value="/js/unslider.js"/>"></script>
</head>
<body>
<style type="text/css">
    .banner { position: relative; overflow: auto; }
    .banner li { list-style: none; }
    .banner ul li { float: left; }
</style>
<script type="text/javascript">
    $(function () {
        $("#cart").click(function(){
            var msg_seller = $("#msg_seller").val();
            if(msg_seller==('该用户为卖家')){
                $("#a_cart").attr("href","");
                alert("该功能暂时不对卖家开放！");
            }
        });
        // 轮播
        $('.banner').unslider({
            speed: 500,               //  滚动速度
            delay: 3000,              //  动画延迟
            complete: function() {},  //  动画完成的回调函数
            keys: true,               //  启动键盘导航
            dots: true,               //  显示点导航
            fluid: true              //  支持响应式设计
        });

        $("#mon1").html((new Date()).Format("MM").substring(0,1));
        $("#mon2").html((new Date()).Format("MM").substring(1,2));
        $("#day1").html((new Date()).Format("dd").substring(0,1));
        $("#day2").html((new Date()).Format("dd").substring(1,2));

        $("#future").click(function(){
            alert("暂未开放，敬请稍后...");
        });

        //搜索
        $("#search").click(function(){
            var mark = $("#mark").val();
            $("#search_a").attr("href","/BiGeZaiXian/good/searchGoodByMark?mark="+mark);
        });

        changeView();
        //根据设备尺寸改变链接   PC端和手机端切换
        function changeView(){
            if($(window).width()>800) {//浏览器当前窗口可视区域宽度
                window.location.href="/BiGeZaiXian/index/pcindex";
            }

            /*var isMobile = {//是否是移动设备
                Android: function () {
                    return navigator.userAgent.match(/Android/i) ? true : false;
                },
                BlackBerry: function () {
                    return navigator.userAgent.match(/BlackBerry/i) ? true : false;
                },
                iOS: function () {
                    return navigator.userAgent.match(/iPhone|iPad|iPod/i) ? true : false;
                },
                Windows: function () {
                    return navigator.userAgent.match(/IEMobile/i) ? true : false;
                },
                any: function () {
                    return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Windows());
                }
            };
            if (!isMobile.any()) {//不是移动设备
                window.location.href = "/BiGeZaiXian/index/pcindex";
            }*/

        }
        //窗口改变事件 方便 PC端和手机端切换调试
        $(window).resize(function(){
            changeView();
        });
    });

</script>
<script type="text/javascript">
    $(document).ready(function () {
        var title = "聚化网-日照首家塑料化工自营电商网上商城";
        var link = "http://m.sumibuy.com/";
        var imgUrl = "http://m.sumibuy.com/favicon.jpg";
        var desc = "聚化网-日照首家塑料自营电商网上商城";
        var type = "link";
        var dataUrl = "";
    });
</script>

<a name="top"></a>
<!--header stop-->
<header class="header">

    <article class="slider">
        <!--scroll-->
        <div class="scroll relative">
            <div class="banner">
                <ul>
                    <c:forEach items="${adList}" var="item">
                        <li><img alt="这是一张图片" src="<c:url value="${item.PICURL}"/>" width="100%" height="159px"/></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <!--scroll-->
    </article>
    <div class="logo"><img src="<c:url value="/images/mobilephone/index/logo.png"/>"/></div>
    <div class="search">
        <input class="search-text" placeholder="输入商品牌号" type="text" id="mark">
        <a href="" id="search_a">
            <input class="search-btn" type="button" value="" id="search">
        </a>
    </div>
</header>
<!--header end-->
<nav class="category">
    <ul>
        <li>
            <a href="/BiGeZaiXian/good/toClassify">
                <span class="menu1-icon micon"><i></i></span>
                <span class="cate-name">分类</span>
            </a>
        </li>

        <li>
            <a href="/BiGeZaiXian/good/toClassify">
                <span class="menu2-icon micon"><i></i></span>
                <span class="cate-name">现货</span>
            </a>
        </li>

        <li>
            <div id="future">
            <a>
                <span class="menu3-icon micon"><i></i></span>
                <span class="cate-name">期货</span>
            </a>
            </div>
        </li>

        <li class="w28">
            <a href="/BiGeZaiXian/jurongbao/toJuRongBao">
                <span class="menu4-icon micon"><i></i></span>
                <span class="cate-name">聚融宝</span>
            </a>
        </li>

        <li>
            <a href="/BiGeZaiXian/user/toMyCenter">
                <span class="menu5-icon micon"><i></i></span>
                <span class="cate-name">
                    <c:choose>
                        <c:when test="${user != null}">
                            <span style="color:#C81623">${user.login}</span>
                        </c:when>
                        <c:otherwise>
                            我的
                        </c:otherwise>
                    </c:choose>
                </span>
            </a>
        </li>

        <li>
            <a href="/BiGeZaiXian/user/toReg">
                <span class="menu7-icon micon"><i></i></span>
                <span class="cate-name">注册</span>
            </a>
        </li>

        <li>
            <a href="/BiGeZaiXian/user/toLogin">
                <span class="menu8-icon micon"><i></i></span>
                <span class="cate-name">登录</span>
            </a>
        </li>
        <input type="hidden" value="${msg_seller}" id="msg_seller"/>
        <li class="w28" id="cart">
            <a href="/BiGeZaiXian/user/toCart" id="a_cart">
                <span class="menu6-icon micon"><i></i></span>
                <span class="cate-name">购物车</span>
            </a>
        </li>
    </ul>
</nav>

<section class="hot-predict">
    <div class="hot-predict-l">
        <%--<a href="/BiGeZaiXian/good/toTodayQuote">--%>
        <a>
            <span class="sp1">今日牌价</span>
            <span class="t1" id="mon1">0</span><span class="t1" id="mon2">6</span>
            <span class="t2">-</span><span class="t1" id="day1">2</span><span class="t1" id="day2">9</span>
            <span class="sp2">塑料原料供应</span>
        </a>
    </div>
    <div class="hot-predict-r">
        <%--<a href="/BiGeZaiXian/user/toPurchaseBid">--%>
        <a>
            <span class="sp1">发布求购</span>
            <span class="sp2">要采购 要竞价</span>
        </a>
    </div>
</section>

<section class="area-category">
    <a href="/BiGeZaiXian/good/toClassifyList?type=001">
        <h3 class="ac-f">
            <span class="mp1"></span>
            聚乙烯 (PE)
        </h3>
    </a>
    <div class="hot-commodity-pic hotcp">
        <ul>
            <c:forEach items="${markPicList_PE}" var="item">
            <li>
                <div class="fl">
                    <div style="color: #C81623;font-size: 18px">热门牌号</div>
                    <div style="font-size: 16px">${item.MARK}</div>
                </div>
                <p class="fr">
                    <a href="/BiGeZaiXian/good/toGoodList?mark=${item.MARK}">
                        <img alt="这是一张图片" src="<c:url value="${item.PICURL}"/>" width="78px" height="78px">
                    </a>
                </p>
            </li>
            </c:forEach>
        </ul>
    </div>

    <section class="ac-pr">
        <ul>
            <c:forEach items="${markList_PE}" var="item">
                <li><a href="/BiGeZaiXian/good/toGoodList?mark=${item.MARK}">${item.MARK}</a></li>
            </c:forEach>
        </ul>
    </section>

</section>

<section class="area-category">
    <a href="/BiGeZaiXian/good/toClassifyList?type=002">
        <h3 class="ac-f">
            <span class="mp2"></span>
            聚丙烯 (PP)
        </h3>
    </a>
    <div class="hot-commodity-pic hotcp">
        <ul>
            <c:forEach items="${markPicList_PP}" var="item">
                <li>
                    <div class="fl">
                        <div style="color: #C81623;font-size: 18px">平台爆款</div>
                        <div style="font-size: 16px">${item.MARK}</div>
                    </div>
                    <p class="fr">
                        <a href="/BiGeZaiXian/good/toGoodList?mark=${item.MARK}">
                            <img alt="这是一张图片" src="<c:url value="${item.PICURL}"/>" width="78px" height="78px">
                        </a>
                    </p>
                </li>
            </c:forEach>
        </ul>
    </div>

    <section class="ac-pr">
        <ul>
            <c:forEach items="${markList_PP}" var="item">
                <li><a href="/BiGeZaiXian/good/toGoodList?mark=${item.MARK}">${item.MARK}</a></li>
            </c:forEach>
        </ul>
    </section>

</section>

<section class="area-category">
    <a href="/BiGeZaiXian/good/toClassifyList?type=003">
        <h3 class="ac-f">
            <span class="mp3"></span>
            聚氯乙烯 (PVC)
        </h3>
    </a>
    <div class="hot-commodity-pic hotcp">
        <ul>
            <c:forEach items="${markPicList_PVC}" var="item">
                <li>
                    <div class="fl">
                        <div style="color: #C81623;font-size: 18px">平台爆款</div>
                        <div style="font-size: 16px">${item.MARK}</div>
                    </div>
                    <p class="fr">
                        <a href="/BiGeZaiXian/good/toGoodList?mark=${item.MARK}">
                            <img alt="这是一张图片" src="<c:url value="${item.PICURL}"/>" width="78px" height="78px">
                        </a>
                    </p>
                </li>
            </c:forEach>
        </ul>
    </div>

    <section class="ac-pr">
        <ul>
            <c:forEach items="${markList_PVC}" var="item">
                <li><a href="/BiGeZaiXian/good/toGoodList?mark=${item.MARK}">${item.MARK}</a></li>
            </c:forEach>
        </ul>
    </section>

</section>
<!--footer stop-->
<jsp:include page="foot_index.jsp"></jsp:include>
</section>

</body>
</html>
