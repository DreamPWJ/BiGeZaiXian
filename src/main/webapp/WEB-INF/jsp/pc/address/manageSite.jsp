<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>地址管理 - 比格在线</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/plugins/JqueryPagination/jquery.pagination.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/manageSite.css'/>" rel="stylesheet" type="text/css">
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
                    <h1 class="titbase" style="text-align:left;">地址管理</h1>
                </div>
                <div class="uibox-order">
                    <div class="formsendcon-f">
                        <div class="uibox-con">
                            <div class="form-cue-titpl">
                                <form action="" method="post" class="form-horizontal">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3"></label>

                                                <div class="col-md-8">
                                                    <input name="" class="form-control placeholder-no-fix"
                                                           placeholder="地址/联系人/联系方式"
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

                                        <span class="form-edit">
                                            <a href="<c:url value='/address/toaddSite' />">
                                                <button class="btn btn-color btn-sm">新增地址</button>
                                            </a>
                                        </span>
                            </div>
                            <table class="table table-striped table-bordered table-hover"
                                   id="data-table">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>仓库名称</th>
                                    <th>联系人</th>
                                    <th>联系电话</th>
                                    <th>邮编</th>
                                    <th>详细地址</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${storagesModel}" var="item">
                                    <tr>
                                        <td>${item.CODENO}</td>
                                        <td>${item.NAME}</td>
                                        <td>${item.LINKMAN}</td>
                                        <td>${item.PHONE}</td>
                                        <td>${item.POSTAL}</td>
                                        <td>${item.ADDRESS}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>

                            </table>

                            <!--分页-->
                            <div id="page" class="m-pagination pull-right"></div>
                            <input type="hidden" id="totalcount" value="${totalcount}"/>
                            <input type="hidden" id="pageSize" value="${pageSize}"/>
                            <input type="hidden" id="urlpage" value="/BiGeZaiXian/address/tomanageSite"/>
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
<script src="<c:url value='/js/pc/A_public/jquery-1.11.1.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/pc/A_public/bootstrap.min.js'/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/js/commonUtil.js'/>"></script>