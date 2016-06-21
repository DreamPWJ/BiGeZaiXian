<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>投诉建议</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/complaintsSuggestions.css'/>" rel="stylesheet" type="text/css">

</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<!-- content ----------- begin -->
<div class="content">
    <div class="BT"></div>
    <div class="L">
        <div class="L-1">新手指南</div>
        <div class="L-2"><a href="<c:url value='/index/toprotocol'/>">比格服务协议</a></div>
        <div class="L-1">购物指南</div>
        <div class="L-2"><a href="javascript:void(0);">购物流程</a></div>
        <div class="L-1">支付与配送</div>
        <div class="L-2"><a href="<c:url value='/index/toonlinePay'/>">在线支付</a></div>
        <div class="L-2"><a href="javascript:void(0);">订单查询</a></div>
        <div class="L-1">售后服务</div>
        <div class="current">投诉建议</div>
        <div class="L-2"><a href="<c:url value='/index/todeliveryInstructions'/>">提货说明</a></div>
        <div class="L-2"><a href="<c:url value='/index/toinvoiceShows'/>">发票说明</a></div>
        <div class="L-2"><a href="<c:url value='/index/toreturnProcess'/>">货品退换</a></div>
    </div>

    <div class="R">
        <div class="R-1">投诉建议</div>
        <div class="miaosu">
            <div class="detailcon-conbase">
                <p>衷心地感谢您在百忙之中，通过投诉建议对我们的服务和产品提出宝贵的意见和建议。</p>

                <p>您的支持和鼓励是我们不断前进的动力，为了给您提供更加优质的服务, 完善我们的工作,请您通过以下方式提交您的意见和建议。</p>

                <p>您的宝贵意见我们会认真采纳，并将在3个工作日内，给您明确的回复！因此而给您带来的不便，敬请谅解。</p>
            </div>
            <div class="detailcon-conbase">
                <p><b>服务热线：</b><span class="color-orange">400-818-1234</span></p>
                <p><b>邮箱：</b><span class="color-orange">bgds@bigeonline.com</span></p>
            </div>
        </div>
    </div>
</div>
<div style="clear: both"></div>
<!-- content ----------- end -->
<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
