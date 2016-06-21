<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>商品管理 - 比格在线</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/plugins/JqueryPagination/jquery.pagination.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/myProducts.css'/>" rel="stylesheet" type="text/css">


</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>

<!-- content ----------- begin -->
<div class="content">
    <div class="container_25">
        <div class="grid_25"></div>
        <div class="grid_5">
            <%@ include file="../A_public/accountSideMenu.jsp" %>
        </div>
        <div class="grid_20">
            <div class="rightcon">
                <div class="uibox">
                    <div class="uibox-head">
                        <h1 class="titbase displine">商品管理</h1>

                        <div class="toptext">
                            <a href="<c:url value='/good/topublishProduct'/>">
                                <button class="btn btn-color btn-sm" >发布商品</button>
                            </a>
                        </div>
                    </div>

                    <div class="type-search">
                        <form action="" method="post" class="form-horizontal">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-3"></label>

                                        <div class="col-md-8">
                                            <input name="" class="form-control placeholder-no-fix" placeholder="品名"
                                                   value=""/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-3"></label>

                                        <div class="col-md-8">
                                            <input name="" class="form-control placeholder-no-fix" placeholder="牌号"
                                                   value=""/>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <input type="submit" class="btn  btn-color btn-sm" value="搜索">
                                    <input type="reset" class="btn btn-primary btn-sm" value="重置">
                                </div>

                            </div>
                        </form>
                    </div>
                    <div>
                        <table class="table table-striped table-bordered table-hover"
                               id="data-table">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>品种/牌号</th>
                                <th>生产商</th>
                                <th>产地</th>
                                <th>包装类型</th>
                                <th>包装说明</th>
                                <th>入库</th>
                                <th>入库确认</th>
                                <th>现有库存</th>
                                <th>在售</th>
                                <th>售出</th>
                                <%--        <th>发布时间</th>--%>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${productsModel}" var="item">
                                <tr>
                                    <td>${item.RN}</td>
                                    <td>${item.GOODKINDNAME}/${item.MARK}</td>
                                    <td>${item.PRODUCER}</td>
                                    <td>${item.PRODUCINGAREA}</td>
                                    <td>${item.PACKTYPENAME}</td>
                                    <td>${item.PACKCONTENTNAME}</td>
                                    <td><fmt:formatNumber value="${item.INITNUM}" pattern="0.000"/></td>
                                    <td><fmt:formatNumber value="${item.AFFIRMNUM}" pattern="0.000"/></td>
                                    <td><fmt:formatNumber value="${item.SURPLUSNUM}" pattern="0.000"/></td>
                                    <td><fmt:formatNumber value="${item.SELLSURPLUSNUM}" pattern="0.000"/></td>
                                    <td><fmt:formatNumber value="${item.SELLOUTNUM}" pattern="0.000"/></td>
                                    <%--            <td><fmt:formatDate value="${item.CREATETIME}" pattern="yyyy-MM-dd"/></td>--%>
                                    <td>
                                        <a href="<c:url value='/good/toprodetail?goodId=${item.GOODID}'/>"
                                                >详情</a>
                                    </td>

                                </tr>
                            </c:forEach>

                            </tbody>

                        </table>

                        <!--分页-->
                        <div id="page" class="m-pagination pull-right"></div>
                        <input type="hidden" id="totalcount" value="${totalcount}"/>
                        <input type="hidden" id="pageSize" value="${pageSize}"/>
                        <input type="hidden" id="urlpage" value="/BiGeZaiXian/good/tomyProducts"/>
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
<%--js文件--%>
<script src="<c:url value='/js/pc/A_public/bootstrap.min.js'/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/js/commonUtil.js'/>"></script>