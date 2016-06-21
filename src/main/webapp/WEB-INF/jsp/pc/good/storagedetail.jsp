<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>仓库库存详细页 - 比格在线</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/plugins/JqueryPagination/jquery.pagination.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/storagedetail.css'/>" rel="stylesheet" type="text/css">
</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>

<!-- content ----------- begin -->
<div class="content">

    <div class="row">
        <!-- ordershow ----------- begin -->

        <div class="order-sertype" id="orderItemsLoad">
            <div class="order-sertype-head">
                <div class="col-xs-6 serhead-type">仓库上架信息</div>
                <c:set var="goodId" value="${stocksdetailModel[0].GOODID}"/>
                <c:set var="storageId" value="${stocksdetailModel[0].STORAGEID}"/>
                <div class="col-xs-6   back-button"><a href="<c:url value='/good/toprodetail?goodId=${goodId}'/>">
                    <button class="btn btn-success btn-xs pull-right">返回</button>
                </a></div>
            </div>
            <div class="order-sertype-con">
                <div class="zl-base">
                    <table class="table table-striped table-bordered table-hover"
                           id="data-table">
                        <thead>
                        <tr>
                            <th>仓库名称</th>
                            <th>供应商</th>
                            <th>牌号</th>
                            <th>品种</th>
                            <th>上架单价</th>
                            <th>在售数量</th>
                            <th>售出数量</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="item" items="${stocksdetailModel}">
                            <tr>
                                <td class="storagename">${item.NAME}</td>
                                <td class="producer">${item.PRODUCER}</td>
                                <td class="mark">${item.MARK}</td>
                                <td class="goodkindname">${item.GOODKINDNAME}</td>
                                <td class="pricehastax">¥<fmt:formatNumber value="${item.PRICEHASTAX}"
                                                       pattern="#,#00.00"/></td>
                                <td class="sellsurplusnum"><fmt:formatNumber value="${item.SELLSURPLUSNUM}" pattern="0.000"/></td>
                                <td><fmt:formatNumber value="${item.SELLOUTNUM}" pattern="0.000"/></td>

                                <td>
                                    <button<c:if
                                            test="${item.SELLSURPLUSNUM ==null || item.SELLSURPLUSNUM <=0}"> disabled</c:if>
                                            class="btn btn-success btn-xs" type="outofStock" data-toggle="modal"
                                            data-target="#myModaloutofStock">下架
                                    </button>
                                    <button class="btn btn-success btn-xs" type="outofStockDetail" data-toggle="modal"
                                        data-target="#myModalStockDetail">下架明细
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>

                    <!--分页-->
                    <div id="page" class="m-pagination pull-right"></div>
                    <input type="hidden" id="totalcount" value="${totalcount}"/>
                    <input type="hidden" id="pageSize" value="${pageSize}"/>
                    <input type="hidden" id="urlpage"
                              value="/BiGeZaiXian/stock/tostoragedetail?goodid=${goodId}&storageid=${storageId}"/>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- content ----------- end -->

<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>

<!-- Modal -->
<%--  下架--%>
<div class="modal fade" id="myModaloutofStock" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"></button>
                <h2 class="modal-title title">商品下架</h2>
            </div>
            <div class="modal-body">
                <table class="table  outofstockpage">
                    <tbody>
                    <tr>
                        <td>
                            牌号：
                            <input type="hidden" id="goodId" value="${goodId}" >
                        </td>
                        <td class="mark"></td>

                        <td>
                            品种：
                        </td>
                        <td class="goodkindname"></td>
                        <td>
                            供应商：
                        </td>
                        <td class="producer"></td>

                    </tr>
                    <tr>
                        <td>
                            仓库名称：
                            <input type="hidden" id="outofStockstorageId" value="${storageId}"/>
                        </td>
                        <td id="outofStockstorageName" class="storagename"></td>

                        <td>
                            在售数量：
                        </td>
                        <td id="outofStocksurplusnum" class="sellsurplusnum"></td>

                        <td>
                            在售价格：
                            <input type="hidden" id="pricehastax" />
                        </td>
                        <td  class="pricehastax"></td>


                    </tr>
                    </tbody>
                </table>

                <form class="form-horizontal">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label col-md-4">下架数量</label>

                                    <div class="col-md-5">
                                        <input id="outofStockInitNum" placeholder=""
                                               class="form-control placeholder-no-fix"
                                               check-type="required number"/>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <div class="col-md-7">
                    <button id="saveoutofStock" type="button" class="btn btn-primary ">保存</button>
                    <button id="closeoutofStock" type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--END Modal -->

<!-- Modal  -->
<%--下架明细modal--%>
<div class="modal fade" id="myModalStockDetail" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"></button>
                <h2 class="modal-title" id="detailname" >下架明细</h2>
            </div>
            <div class="modal-body">
                <table class="table table-striped table-bordered table-hover"
                       id="stockDetail">
                    <thead>
                    <tr>
                        <th>日期</th>
                        <th>编号</th>
                        <th>下架单价</th>
                        <th>下架数量</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <div class="col-md-7">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--END Modal -->
</body>
</html>

<!--js文件-->
<script src="<c:url value='/js/pc/A_public/jquery-1.11.1.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/pc/A_public/bootstrap.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/commonUtil.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/pc/prodetail/prodetail.js'/>" type="text/javascript"></script>

