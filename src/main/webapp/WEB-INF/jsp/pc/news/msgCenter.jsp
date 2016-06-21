<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>信息中心 - 比格在线</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/msgCenter.css'/>" rel="stylesheet" type="text/css">
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
                    <h1 class="titbase" style="text-align:left;">消息中心</h1>
                </div>
                <div class="uibox-order">
                    <div class="formsendcon-f" id="con">

                        <!-- 我的信息 -->
                        <div class="uibox-con">

                            <table class="table table-striped table-bordered table-hover"
                                   id="data-table">
                                <thead>
                                <tr>
                                    <th>类别</th>
                                    <th>消息标题</th>
                                    <th>时间</th>
                                    <th>发件人</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>通知</td>
                                    <td>想了解一下比格在线 那就去<a href="<c:url value="/index/touserGuides"/> ">新手指南</a>看看吧</td>
                                    <td><fmt:formatDate value="${now}" type="both" dateStyle="long"
                                                        pattern="yyyy-MM-dd"/></td>
                                    <td>系统消息</td>
                                </tr>
                                <c:if test="${sessionScope.get('companyID')==0||sessionScope.get('companyID')==null}">
                                    <tr>
                                        <td>通知</td>
                                        <td>您的账号还没有审核绑定公司,等待审核</td>
                                        <td><fmt:formatDate value="${now}" type="both" dateStyle="long"
                                                            pattern="yyyy-MM-dd"/></td>
                                        <td>系统消息</td>
                                    </tr>
                                </c:if>
                                <c:if test="${!flagmap.isUploadCredentials}">
                                    <tr>
                                        <td>通知</td>
                                        <td>您的账号还没有上传三证审核 <a href="<c:url value="/account/toattachment"/> ">请去上传</a>
                                        </td>
                                        <td><fmt:formatDate value="${now}" type="both" dateStyle="long"
                                                            pattern="yyyy-MM-dd"/></td>
                                        <td>系统消息</td>
                                    </tr>
                                </c:if>
                                <c:if test="${flagmap.isSuccessCredentials}">
                                    <tr>
                                        <td>通知</td>
                                        <td>您的账号上传三证成功 等待审核</td>
                                        <td><fmt:formatDate value="${now}" type="both" dateStyle="long"
                                                            pattern="yyyy-MM-dd"/></td>
                                        <td>系统消息</td>
                                    </tr>
                                </c:if>

                                <c:if test="${flagmap.isCheckCredentials}">
                                    <tr>
                                        <td>通知</td>
                                        <td>恭喜您 您的账号上传的三证审核通过</td>
                                        <td><fmt:formatDate value="${now}" type="both" dateStyle="long"
                                                            pattern="yyyy-MM-dd"/></td>
                                        <td>系统消息</td>
                                    </tr>
                                </c:if>

                                </tbody>
                            </table>
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
