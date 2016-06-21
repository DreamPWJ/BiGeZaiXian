<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>我的服务 - 比格在线</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/services.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">

</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>

<div class="content">
    <div class="container_25">
        <div class="grid_5">
            <%@ include file="../A_public/accountSideMenu.jsp" %>
        </div>
        <div class="grid_20">
            <div class="rightcon">
                <div class="uibox-head-order">
                    <h1 class="titbase" style="text-align:left;">账号管理</h1>
                </div>
                <div class="uibox-order">
                    <div class="formsendcon-f">
                        <%@ include file="tabPages.jsp" %>
                        <div class="uibox-con">
                            <table class="text-cen">
                                <thead>
                                <tr class="bordertb">
                                    <th style="font-weight:bold;" width="163px">服务名称</th>
                                    <th style="font-weight:bold;" width="244px">服务描述</th>
                                    <th style="font-weight:bold;" width="244px">备注</th>
                                    <th style="font-weight:bold;" width="163px">状态</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>商品贸易</td>
                                    <td class="textle"></td>
                                    <td></td>
                                    <td>
                                        <a class="btnysm btnorg" data-id="1009" name="apply">我要申请</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>物流服务</td>
                                    <td class="textle"></td>
                                    <td></td>
                                    <td>
                                        <a class="btnysm btnorg" data-id="1010" name="apply">我要申请</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>聚融宝</td>
                                    <td class="textle"></td>
                                    <td></td>
                                    <td>
                                        <a class="btnysm btnorg" data-id="1011" name="apply">我要申请</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div id="result" style="display:none"></div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<div style="display: none;" id="overtime"></div>

<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>

