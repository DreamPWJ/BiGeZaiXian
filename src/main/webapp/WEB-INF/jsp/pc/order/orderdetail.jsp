<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>订单详细页 - 比格在线</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/orderdetail.css'/>" rel="stylesheet" type="text/css">

</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>

<!-- content ----------- begin -->
<div class="content">
    <div class="container_25">
        <div class="grid_25">
            <!-- ordershow ----------- begin -->
            <div class="ordershow">
                <div class="orshow-head">
                    <a class="btnyfl btnorg" href="<c:url value='/order/toorderCenter'/>">返回</a>
                                <span class="ornmb">订单流水号&nbsp;&nbsp;<b>${orderdetail.ORDERNO}</b>
								<font class="tyfont">状态&nbsp;&nbsp;<span
                                        style="color:#1CAAEB">已下单</span></font>
								<font class="tyfont">付款方式&nbsp;&nbsp;<span style="color: rgb(252, 131, 34);"></span></font>
                                </span>
                </div>
                <div class="orshow-con" style="padding-bottom: 0px;">
                </div>
            </div>
            <div class="order-sertype" id="orderItemsLoad">
                <div class="order-sertype-head">
                    <div class="serhead-type">商品信息</div>
                </div>
                <div class="order-sertype-con">
                    <div class="zl-base">
                        <table class="table table-striped table-bordered table-hover"
                               id="data-table">
                            <thead>
                            <tr class="bordertb">
                                <th>供应商</th>
                                <th>牌号</th>
                                <th>品种</th>
                                <th>成交价</th>
                                <th>数量</th>
                                <th>总金额</th>
                            </tr>
                            </thead>

                            <tbody>
                            <tr>
                                <td>${orderdetail.PRODUCER}</td>
                                <td>${orderdetail.MARK}</td>
                                <td>${orderdetail.GOODKINDNAME}</td>
                                <td>¥<fmt:formatNumber value="${orderdetail.PRICEHASTAX}"
                                                       pattern="#,#00.00"/></td>
                                <td><fmt:formatNumber value="${orderdetail.INITNUM}" pattern="0.000"/></td>
                                <td>¥<fmt:formatNumber value="${orderdetail.FINALMONEY}"
                                                        pattern="#,#00.00"/></td>
                            </tr>
                            </tbody>

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- content ----------- end -->

<%-- 底部公共div--%>

<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
