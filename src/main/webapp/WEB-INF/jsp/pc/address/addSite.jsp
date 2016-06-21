<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>新增地址 - 比格在线</title>
    <!--js-->
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/addSite.css'/>" rel="stylesheet" type="text/css">
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
            <div class="uibox">
                <div class="uibox-head">
                    <h1 class="titbase displine">新增地址</h1>

                    <div class="toptext">
                        <a href="<c:url value='/address/tomanageSite'/>">
                            <button class="btn btn-primary btn-xs">返回列表</button>
                        </a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <form action="<c:url value='/address/addSite'/>"
                          class="form-horizontal" method="Post">

                        <div class="form-body">
                            <div class="row">
                                <!--/span-->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">仓库名称</label>

                                        <div class="col-md-6">
                                            <input id="name" name="name"
                                                   class="form-control placeholder-no-fix"
                                                   placeholder="xx仓库" check-type="required"/>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">所在省市/直辖市/街道</label>

                                        <div class="col-md-3">
                                            <select id="provcode" name="provcode" class="chosen-select form-control ">
                                                <option selected="selected">省份/自治区</option>
                                                <c:forEach items="${provinces}" var="item">
                                                    <option value="${item.ID}">${item.NAME}</option>
                                                </c:forEach>
                                            </select>

                                        </div>
                                        <div class="col-md-3">

                                            <select id="citycode" name="citycode" class="chosen-select form-control ">
                                                <option selected="selected">城市/地区/自治州</option>

                                            </select>

                                        </div>
                                        <div class="col-md-2">

                                            <select id="countycode" name="countycode"
                                                    class="chosen-select form-control ">
                                                <option selected="selected">区/县</option>

                                            </select>
                                        </div>

                                    </div>
                                </div>
                                <!--/span-->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">详细地址</label>

                                        <div class="col-md-7">
                                            <input id="address" name="address"
                                                   class="form-control placeholder-no-fix" check-type="required"/>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->

                                <!--/span-->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">邮政编码</label>

                                        <div class="col-md-6">
                                            <input id="postal" name="postal"
                                                   class="form-control placeholder-no-fix" check-type="number"/>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->

                                <!--/span-->
                                <!--/span-->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">联系人姓名</label>

                                        <div class="col-md-6">
                                            <input id="linkman" name="linkman"
                                                   class="form-control placeholder-no-fix" check-type="required"/>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->


                                <!--/span-->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">手机</label>

                                        <div class="col-md-6">
                                            <input id="mobphone" name="mobphone"
                                                   class="form-control placeholder-no-fix" check-type="phone"
                                                    />
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                                <!--/span-->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">固话</label>

                                        <div class="col-md-6">
                                            <input id="phone" name="phone"
                                                   class="form-control placeholder-no-fix"
                                                   placeholder="区号后加“  -  ”如：021-52750558" check-type="tel"/>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                            </div>
                        </div>
                        <div class="col-md-12" style="text-align: center;margin-bottom: 20px;">
                            <button id="storageSave" type="submit" class="btn btn-success">
                                保存
                            </button>

                        </div>
                    </form>
                    <!-- END FORM-->
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
<!--js文件-->
<script src="<c:url value='/js/pc/A_public/bootstrap.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/commonUtil.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/pc/address/addSite.js'/>" type="text/javascript"></script>

