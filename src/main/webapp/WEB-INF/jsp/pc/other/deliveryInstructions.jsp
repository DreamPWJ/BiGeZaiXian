<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>提货说明</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/deliveryInstructions.css'/>" rel="stylesheet" type="text/css">

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
        <div class="L-2"><a href="<c:url value='/index/tocomplaintsSuggestions'/>">投诉建议</a></div>
        <div class="current">提货说明</div>
        <div class="L-2"><a href="<c:url value='/index/toinvoiceShows'/>">发票说明</a></div>
        <div class="L-2"><a href="<c:url value='/index/toreturnProcess'/>">货品退换</a></div>
    </div>

    <div class="R">
        <div class="R-1">提货说明</div>
        <div class="miaosu">
            <div class="detailcon-conbase">
                <p>1、部分仓库（保税区仓库）需在当天完成提货，否则第2天将取消提货车号，</p>

                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;具体情况请咨询物流客服：400-818-1234</p>

                <p>2、提货时如发现破包/少量等问题，请当天与物流客服联系，否则后果将自行承担，感谢配合。</p>

                <p>3、客户自提函需盖购买公司对应公章，如不一致将无法提货，请知悉。</p>
            </div>
        </div>
    </div>
</div>
<!-- content ----------- end -->
<div style="clear: both"></div>
<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
