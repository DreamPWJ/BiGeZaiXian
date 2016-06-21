<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>比格在线-提交订单</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/orderSuccess.css'/>" rel="stylesheet" type="text/css">


</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>

<!-- content ----------- begin -->
<div class="content">
    <div class="content-bj">
        <div class="content-bj-1">
            <div class="content-bj-1-1"></div>
        </div>
        <div class="content-bj-2">
            订单已成功提交
        </div>

        <div id="payinfo">
            <p><i class="fa fa-warning"></i>尊敬的客户<span>${orderinfo.username}</span>，您的订单<span>${orderinfo.ordernum}</span>已经成功提交，并且选择线下方式进行支付。</p>

            <p>请您在<span>${orderinfo.lastDate}</span>时之前完成汇款工作，否则，您的订单将会被取消，给您的交易和生产带来不利的影响。</p>

            <p> 当您完成汇款之后，请您及时告知平台客服人员，尽早完成发货和收货工作！</p>
        </div>

        <div class="ac">
            <div class="ac1">
                <div class="ac1-1"><a href="<c:url value='/order/toorderCenter'/>">查看订单</a></div>
            </div>
            <div class="ac2">
                <div class="ac2-1"><a href="<c:url value='/mall/toMall'/>">继续下单</a></div>
            </div>
        </div>
    </div>

    <div class="serve-type">
        <h3>比格为您提供</h3>
        <ul class="serve-type-con">
            <li>
                <div class="item-list">
                    <i class="serve-ico xb"></i>

                    <h3>信保服务</h3>

                    <p>及时了解企业资信</p>
                </div>
            </li>
            <li>
                <div class="item-list">
                    <i class="serve-ico jr"></i>

                    <h3>金融服务</h3>

                    <p>提升资金，高效服务</p>
                </div>
            </li>
            <li>
                <div class="item-list">
                    <i class="serve-ico wl"></i>

                    <h3>物流服务</h3>

                    <p>优质服务，优惠运价</p>
                </div>
            </li>
            <li>
                <div class="item-list last">
                    <i class="serve-ico qt"></i>

                    <h3>其他服务</h3>

                    <p>我们的服务，值得信任</p>
                </div>
            </li>
        </ul>
    </div>
</div>
<!-- content ----------- end -->

<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>

