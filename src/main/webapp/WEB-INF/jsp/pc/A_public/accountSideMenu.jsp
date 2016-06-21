<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<style>
    .account-leftmenu {

    <c:if test="${flag=='我的比格'}" > animation: searchbutton 0.6s;
        -webkit-animation: searchbutton 0.6s;
    </c:if>
    }

    <c:if test="${flag=='我的比格'}" >
    @keyframes searchbutton {
        0% {
            transform: translate(-3em, 0);
        }
        100% {
            transform: translate(0em, 0);
        }
    }

    @-webkit-keyframes searchbutton {
        0% {
            -webkit-transform: translate(-3em, 0);
        }
        100% {
            -webkit-transform: translate(0em, 0);
        }
    }

    </c:if>
</style>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/pc/A_public/accountSideMenu.css'/> "/>

<!--左边导航-->
<div class="account-leftmenu">

    <ul>
        <li class="one"><a href="<c:url value='/account/touserCenter'/>">我的比格</a></li>
        <div class="menu-items">
            <ul class="two">
                <li><a href="<c:url value='/account/touserCenter'/>">我的比格</a></li>
                <li><a href="<c:url value='/account/torecharge'/>">充值</a></li>
                <li><a href="<c:url value='/account/toextract'/>">提现</a></li>
                <li><a href="<c:url value='/account/topaymentsDetails'/>">收支明细</a></li>
            </ul>
        </div>
    </ul>
    <c:if test="${sessionScope.get('frontUser').guestcode!='001'}">
        <ul>
            <li class="one"><a href="<c:url value='/good/tomyProducts'/>">商品发布</a></li>
            <div class="menu-items">
                <ul class="two">
                    <li><a href="<c:url value='/good/tomyProducts'/>">我的商品</a></li>
                    <li><a href="<c:url value='/good/topublishProduct'/>">新增商品</a></li>
                    <li><a href="#">入库</a></li>
                    <li><a href="#">上架销售</a></li>
                    <li><a href="#">下架</a></li>
                    <li><a href="#">退货</a></li>
                </ul>
            </div>
        </ul>
    </c:if>
    <ul>
        <li class="one"><a href="<c:url value='/order/toorderCenter'/>">订单销售</a></li>
    </ul>
    <ul>
        <li class="one"><a href="#">订单发运</a></li>
    </ul>
    <c:if test="${sessionScope.get('frontUser').guestcode!='001'}">
        <ul>
            <li class="one"><a href="<c:url value='/stock/tostockCenter'/>">库存中心</a></li>
        </ul>
    </c:if>
    <ul>
        <li class="one"><a href="#">进销查询</a></li>
    </ul>
    <ul>
        <li class="one"><a href="#">促销活动</a></li>
    </ul>
    <ul>
        <li class="one"><a href="<c:url value='/account/tobasicInformation'/>">账号管理</a></li>
        <div class="menu-items">
            <ul class="two">
                <li><a href="<c:url value='/account/tobasicInformation'/>">基本资料</a></li>
                <li><a href="<c:url value='/account/tomyIntegral'/>">我的积分</a></li>
                <li><a href="<c:url value='/account/tosecuritySettings'/>">安全设置</a></li>
                <li><a href="<c:url value='/account/toattachment'/>">认证附件</a></li>
                <li><a href="<c:url value='/account/tobankAccount'/>">银行账号</a></li>
            </ul>
        </div>
    </ul>
    <c:if test="${sessionScope.get('frontUser').guestcode!='001'}">
        <ul>
            <li class="one"><a href="<c:url value='/address/tomanageSite'/>">仓库地址</a></li>
        </ul>
    </c:if>
    <ul>
        <li class="one"><a href="<c:url value='/index/tomsgCenter'/>">消息中心</a></li>
    </ul>
</div>
<!--左边导航-->

<!--js文件-->
<script type="text/javascript" src="<c:url value='/js/pc/A_public/jquery-1.11.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/pc/A_public/accountSideMenu.js'/>"></script>
