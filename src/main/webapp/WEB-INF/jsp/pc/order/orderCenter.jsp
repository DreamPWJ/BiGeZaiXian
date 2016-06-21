<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>订单管理 - 比格在线</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/plugins/JqueryPagination/jquery.pagination.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/orderCenter.css'/>" rel="stylesheet" type="text/css">

</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<!-- content ----------- begin -->
<div class="content">
    <div class="container_25">
        <div class="grid_5">
            <%@ include file="../A_public/accountSideMenu.jsp" %>
        </div>
        <div class="grid_20">
            <div class="rightcon">
                <div class="uibox-head-order">
                    <h1 class="titbase" style="text-align:left;">订单中心</h1>
                </div>
                <div class="uibox-order">
                    <div class="formsendcon-f">

                        <div class="uibox-con">
                            <div class="uibox">
                                <div class="type-search">
                                    <div class="searchnav">
                                        </div>
                                        <div class="type-search">
                                            <form action="" method="post" class="form-horizonta">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"></label>
                                                            <div class="col-md-8">
                                                                <input name="" class="form-control placeholder-no-fix"
                                                                       placeholder="订单流水号"
                                                                       value=""/>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <input type="submit" class="btn btn-color btn-sm" value="搜索">
                                                        <input type="reset" class="btn btn-primary btn-sm" value="重置">
                                                    </div>

                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="tabshow1">
                                    <table class="table table-striped table-bordered table-hover"
                                           id="data-table">
                                        <thead>
                                        <tr>
                                            <th>序号</th>
                                            <th>订单流水号</th>
                                            <th>下单时间</th>
                                            <th>数量</th>
                                            <th>金额</th>
                                            <th>状态</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach items="${ordersModel}" var="item">
                                            <tr>
                                                <td>${item.RN}</td>
                                                <td>
                                                    <a href="<c:url value="/order/toorderdetail?orderId=${item.ORDERID}"/>">${item.ORDERNO}</a>
                                                </td>
                                                <td>${item.CREATETIME}</td>
                                                <td><fmt:formatNumber value="${item.INITNUM}" pattern="0.000"/></td>
                                                <td>¥<fmt:formatNumber value="${item.FINALMONEY}"
                                                                       pattern="#,#00.00"/></td>
                                                <td>已下单</td>
                                                <td>
                                                    <div class="operation">
                                                        <div class="oper-itme">
                                                            <a href="<c:url value="/order/toorderdetail?orderId=${item.ORDERID}"/> "
                                                                    >详情</a> &nbsp;&nbsp;
                                                     <%--       <c:if test="${sessionScope.get('frontUser').guestcode=='001'}">
                                                                <a href="<c:url value="/order/toorderpay?orderId=${item.ORDERID}"/> ">支付</a>
                                                            </c:if>--%>
                                                        </div>

                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>

                                    <!--分页-->
                                    <div id="page" class="m-pagination pull-right"></div>
                                    <input type="hidden" id="totalcount" value="${totalcount}"/>
                                    <input type="hidden" id="pageSize" value="${pageSize}"/>
                                    <input type="hidden" id="urlpage" value="/BiGeZaiXian/order/toorderCenter"/>
                                </div>
                                <!--分页-->
                            </div>
                        </div>
                    </div>
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


<script src="<c:url value='/js/pc/A_public/bootstrap.min.js'/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/js/commonUtil.js'/>"></script>
