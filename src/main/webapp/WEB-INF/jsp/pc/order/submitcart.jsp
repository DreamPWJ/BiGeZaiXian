<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>比格在线-提交订单</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/submitcart.css'/>" rel="stylesheet" type="text/css">
</head>
<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>

<!-- content ----------- begin -->
<div class="content">
    <div class="content-cart">
        <div class="content-title">
            <span>请核对订单信息</span>
        </div>
        <div class="content-nav">
            <div class="content-nav-tab">
                <table class="table table-striped"
                       id="data-table">
                    <thead>
                    <tr class="bordertb">
                        <th>供应商</th>
                        <th>牌号/品种</th>
                        <th>成交单价</th>
                        <th>数量</th>
                        <th>总成交金额</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>${orderDetail.PRODUCER}</td>
                        <td>${orderDetail.MARK}/${orderDetail.GOODKINDNAME}</td>
                        <td class="moneystyle">￥<fmt:formatNumber
                                value="${orderDetail.PRICEHASTAX}"
                                pattern="#,#00.00"></fmt:formatNumber></td>
                        <td>${quantity}${orderDetail.MEACODENAME}</td>
                        <td class="moneystyle">￥<fmt:formatNumber
                                value="${buyMoney}"
                                pattern="#,#00.00"></fmt:formatNumber></td>
                    </tr>
                    </tbody>

                </table>
            </div>

            <div class="content-nav-text" >
                <span style="width: 20%">
                    共&nbsp;<b class='orderAmount'>1</b>&nbsp;件商品，合计:
                </span>
                <span class='orderAmount' style="text-align: center">￥<fmt:formatNumber value="${buyMoney}" pattern="#,#00.00"></fmt:formatNumber></span>
            </div>
        </div>


        <form action="<c:url value="/order/submitOrder"/>" method="post">
            <input type="hidden" name="srccode" value="002"/> <%--订单来源--%>
            <input type="hidden" name="stockcode" value="004"/> <%--库存类型--%>
            <input type="hidden" name="goodid" value="${orderDetail.GOODID}"/>
            <input type="hidden" name="storageid" value="${orderDetail.STORAGEID}"/>
            <input type="hidden" name="rate" value="${orderDetail.RATE}"/>
            <input type="hidden" name="pricehastax" value="${orderDetail.PRICEHASTAX}"/>
            <input type="hidden" name="initnum" value="${quantity}"/>
            <input type="hidden" name="finalmoney" value="${buyMoney}"/>
            <input type="hidden" name="companyid" value="${orderDetail.COMPANYID}"/> <%--卖家公司id--%>


            <div class="content-tj">


                <div class="content-tj-xd">
                    <span style="padding-right: 85px">
                    <strong>总金额(含税)：</strong>
                    </span>
                    <strong class='orderAmount'>￥<fmt:formatNumber
                        value="${buyMoney}"
                        pattern="#,#00.00"></fmt:formatNumber></strong>
                </div>
            </div>
            <div class="content-tj-xd">
                <input  type="submit" class="btn btn-danger pull-right" id="sumbitOrder" <c:if test="${buyMoney==null}">disabled</c:if> value="提交订单"/>
                <p>*提交订单将生成订单生效</p>
            </div>
        </form>
        <div id="orderresult" style="display: none"></div>

    </div>
</div>
<!-- content ----------- end -->

<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>

<!--js文件-->
<script src="<c:url value='/js/pc/scripts/jquery-1.11.1.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/pc/A_public/bootstrap.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/commonUtil.js'/>" type="text/javascript"></script>


