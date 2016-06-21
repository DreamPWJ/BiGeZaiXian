<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>商品上下架 - 比格在线</title>
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
                    <c:set var="typename"><c:if test='${type=="003"}'>上架</c:if>
                        <c:if test='${type=="004"}'>下架</c:if></c:set>
                    <h1 class="titbase displine">商品${typename} </h1>

                    <div class="toptext">
                        <a href="<c:url value='/good/tomyProducts'/>">
                            <button class="btn btn-primary btn-xs">返回列表</button>
                        </a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <form action="<c:url value='/stock/addPrice'/>"
                          class="form-horizontal" method="Post">
                        <input type="hidden" name="stockid" value="${onSheleInfo.STOCKID}"/>

                        <div class="form-body">
                            <div class="row">
                                <!--/span-->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">品名</label>

                                        <div class="col-md-4">
                                            <input class="form-control placeholder-no-fix"
                                                   value="${onSheleInfo.MARK}/${onSheleInfo.GOODKINDNAME}" readonly/>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                                <!--/span-->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">牌号</label>

                                        <div class="col-md-4">
                                            <input class="form-control placeholder-no-fix" value="${onSheleInfo.MARK}"
                                                   readonly/>
                                        </div>
                                    </div>
                                </div>

                                <!--/span-->
                                <!--/span-->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">单位</label>

                                        <div class="col-md-4">
                                            <input class="form-control placeholder-no-fix"
                                                   value="${onSheleInfo.MEACODENAME}" readonly/>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">所在仓库</label>

                                        <div class="col-md-4">
                                            <input class="form-control placeholder-no-fix"
                                                   value="${onSheleInfo.ADDRESS}" readonly/>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                                <!--/span-->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">库存类型</label>

                                        <div class="col-md-4">
                                            <select id="stockcode" name="stockcode" class="chosen-select form-control "
                                                    readonly>
                                                <c:forEach items="${stockTypes}" var="item">
                                                    <option
                                                            <c:if test="${type==item.LEVELCODE}">selected</c:if>
                                                            value="${item.LEVELCODE}">${item.NAME}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                                <!--/span-->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3"> ${typename}数量</label>

                                        <div class="col-md-4">
                                            <input id="num" name="num"
                                                   class="form-control placeholder-no-fix"
                                                   check-type="required number" <c:if
                                                    test="${typename =='下架'}"> value="${onSheleInfo.NUM}" </c:if>  />
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                                <!--/span-->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">未税单价</label>

                                        <div class="col-md-4">
                                            <input id="pricenotax" name="pricenotax"
                                                   class="form-control placeholder-no-fix"
                                                   check-type="required number" <c:if
                                                    test="${typename =='下架'}"> value="${onSheleInfo.PRICENOTAX}" readonly </c:if>/>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->

                                <!--/span-->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">含税单价</label>

                                        <div class="col-md-4">
                                            <input id="pricehastax" name="pricehastax"
                                                   class="form-control placeholder-no-fix"
                                                   check-type="required number" <c:if
                                                    test="${typename =='下架'}"> value="${onSheleInfo.PRICEHASTAX}" readonly </c:if>/>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->

                            </div>
                        </div>
                        <div class="col-md-10" style="text-align: center">
                            <button id="storageSave" type="submit" class="btn btn-success">
                                ${typename}
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
<script type="text/javascript" src="<c:url value='/js/commonUtil.js'/>"></script>
<script type="text/javascript">

</script>
