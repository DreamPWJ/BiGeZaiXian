<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>商品详情 - 比格在线</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/plugins/JqueryPagination/jquery.pagination.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/prodetail.css'/>" rel="stylesheet" type="text/css">


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
            <!-- ordershow ------------ begin -->
            <div class="ordershow">
                <div class="orshow-head">
                    <span class="ornmb">品名：<b id="markGoodkind">${goodinfo.MARK}/${goodinfo.GOODKINDNAME}</b></span>&nbsp;
                    <a href="<c:url value='/good/tomyProducts'/>" id="goBackPrePage">
                        <button class="btn btn-color btn-xs pull-right">返回列表</button>
                    </a>
                    <input id="rqsid" type="hidden" value=""/>
                </div>
                <div class="orshow-con">
                    <table class="table gooddettable">
                        <tbody>
                        <tr>
                            <td align="right">
                                <label>品&nbsp;种：</label>
                            </td>
                            <td>${goodinfo.GOODKINDNAME}</td>
                            <td align="right">
                                <label>牌&nbsp;号：</label>
                            </td>
                            <td>${goodinfo.MARK}</td>
                            <td align="right">
                                <label>用途级别：</label>
                            </td>
                            <td>${goodinfo.USEDNAME}</td>
                        </tr>

                        <tr>
                            <td align="right">
                                <label>产地&nbsp;：</label>
                            </td>
                            <td>${goodinfo.PRODUCINGAREA}</td>
                            <td align="right">
                                <label>生产商：</label>
                            </td>
                            <td>${goodinfo.PRODUCER}</td>
                        </tr>

                        <tr>
                            <td align="right">
                                <label>包装类型：</label>
                            </td>
                            <td>${goodinfo.PACKTYPENAME}</td>
                            <td align="right">
                                <label>包装说明：</label>
                            </td>
                            <td>${goodinfo.PACKCONTENTNAME}</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <label>计量单位：</label>
                            </td>
                            <td id="meaname">${goodinfo.MEANAME}</td>
                          <%--  <td align="right">
                                <label>包装单位：</label>
                            </td>
                            <td>${goodinfo.PACKAGENAME}</td>
                            <td align="right">
                                <label>换算关系：</label>
                            </td>
                            <td>${goodinfo.CONVERTNUM}</td>--%>
                        </tr>
                        </tbody>
                    </table>
                </div>


            </div>
            <!-- ordershow ----------- end -->

            <!-- form -->
            <div class="order-sertypet10" id="con">
                <div flag="tabdisline">
                    <div class="uibox-conb3">
                        <div class="form-find">
                            <div class="leinpu">
                                <form action="" method="post" class="form-horizontal">
                                    <div class="row">
                                        <div class="col-md-7">
                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <input name="" class="form-control placeholder-no-fix"
                                                           placeholder="仓库名称"
                                                           value=""/>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="col-md-5">
                                            <input type="submit" class="btn btn-color btn-sm" value="搜索">
                                            <input type="reset" class="btn btn-primary btn-sm" value="重置">
                                        </div>

                                    </div>
                                </form>
                            </div>


                            <input type="hidden" id="goodId" value="${goodinfo.GOODID}"/>
                            <input type="hidden" id="rate" value="${goodinfo.RATE}"/>

                            <div id="stocdetinfo" class="listover">
                                <table class="table table-striped table-bordered table-hover"
                                       id="data-table">
                                    <thead>
                                    <tr>
                                        <th>仓库名称</th>
                                        <th>仓库地址</th>
                                        <th>入库累计</th>
                                        <th>入库确认</th>
                                        <th>现有库存</th>
                                        <th>在售</th>
                                        <th>售出</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="${stocks}" var="item">
                                        <tr>
                                            <td class="storageName"><a
                                                    href="<c:url value='/stock/tostoragedetail?goodid=${goodinfo.GOODID}&storageid=${item.STORAGEID}'/>">${item.NAME}</a>
                                            </td>
                                            <td>${item.ADDRESS}</td>
                                            <td>${item.INITNUM}</td>
                                            <td>${item.AFFIRMNUM}</td>
                                            <td class="surplusnum">${item.SURPLUSNUM}</td>
                                            <td class="sellsurplusnum">${item.SELLSURPLUSNUM}</td>
                                            <td>${item.SELLOUTNUM}</td>
                                            <td>
                                                <input type="hidden" class="storageId" value="${item.STORAGEID}"/>
                                                <a type="addStock" data-toggle="modal"
                                                   data-target="#myModaladdStock">
                                                    <button class="btn btn-color btn-xs">添加库存</button>
                                                </a><a type="stockDetail"
                                                       data-toggle="modal"
                                                       data-target="#myModalStockDetail">
                                                <button class="btn btn-color btn-xs">入库明细</button>
                                            </a>
                                                <c:if test="${item.AFFIRMNUM!=null}">
                                                    <a type="putaway" data-toggle="modal"
                                                       data-target="#myModalputaway">
                                                        <button class="btn btn-color btn-xs">上架</button>
                                                    </a><a type="putawayDetail"
                                                           data-toggle="modal"
                                                           data-target="#myModalStockDetail">
                                                    <button class="btn btn-color btn-xs">上架明细</button>
                                                </a></c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                                <!--分页-->
                                <%--        <div id="page" class="m-pagination pull-right"></div>
                                           <input type="hidden" id="totalcount" value="${totalcount}"/>
                                           <input type="hidden" id="pageSize" value="${pageSize}"/>
                                           <input type="hidden" id="urlpage" value="/BiGeZaiXian/good/toprodetail"/>--%>
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
<%--公共部分提取复用--%>
<c:set var="commonDiv" value='<tr>
                        <td align="right">
                            <label>品&nbsp;种：</label>
                        </td>
                        <td>${goodinfo.GOODKINDNAME}</td>
                        <td align="right">
                            <label>牌&nbsp;号：</label>
                        </td>
                        <td>${goodinfo.MARK}</td>
                        <td align="right">
                            <label>用途级别：</label>
                        </td>
                        <td>${goodinfo.USEDNAME}</td>
                    </tr>

                    <tr>
                        <td align="right">
                            <label>产地&nbsp;：</label>
                        </td>
                        <td>${goodinfo.PRODUCINGAREA}</td>
                        <td align="right">
                            <label>生产商：</label>
                        </td>
                        <td>${goodinfo.PRODUCER}</td>
                    </tr>

                    <tr>
                        <td align="right">
                            <label>包装类型：</label>
                        </td>
                        <td>${goodinfo.PACKTYPENAME}</td>
                        <td align="right">
                            <label>包装说明：</label>
                        </td>
                        <td>${goodinfo.PACKCONTENTNAME}</td>
                    </tr>
                    <tr>
                        <td align="right">
                            <label>计量单位：</label>
                        </td>
                        <td>${goodinfo.MEANAME}</td>

                    </tr>'/>
<!-- Modal  -->
<%--添加库存modal--%>
<div class="modal fade" id="myModaladdStock" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"></button>
                <h2 class="modal-title" id="myModalLabel" style="font-size: 20px;">添加库存</h2>
            </div>
            <div class="modal-body">
                <table class="table gooddettable">
                    <tbody>
                    ${commonDiv}
                    <tr>
                        <td align="right">
                            <label>仓库名称：</label>
                            <input type="hidden" id="storageId"/>
                        </td>

                        <td id="storageName"></td>
                    </tr>

                    </tbody>
                </table>

                <form class="form-horizontal">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label col-md-4">入库数量</label>

                                    <div class="col-md-5">
                                        <input id="initnum"
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
                    <button id="saveStock" type="button" class="btn btn-primary">保存</button>
                    <button id="closeSaveStock" type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--END Modal -->

<!-- Modal  -->
<%--库存上架明细modal--%>
<div class="modal fade" id="myModalStockDetail" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"></button>
                <h2 class="modal-title" id="detailname" style="font-size: 20px;"></h2>
            </div>
            <div class="modal-body">
                <table class="table gooddettable">
                    <tbody>
                    ${commonDiv}
                    <tr>
                        <td align="right">
                            <label>仓库名称：</label>
                        </td>
                        <td id="storageNameDetail"></td>
                    </tr>
                    </tbody>
                </table>
                <table class="table table-striped table-bordered table-hover"
                       id="stockDetail">
                    <thead>
                    <tr>
                        <th>日期</th>
                        <th>编号</th>
                        <th>单价</th>
                        <th>数量</th>
                        <th>确认数量</th>
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
<!-- Modal -->
<%--  上架--%>
<div class="modal fade" id="myModalputaway" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"></button>
                <h2 class="modal-title" style="font-size: 20px;">商品上架</h2>
            </div>
            <div class="modal-body">
                <table class="table gooddettable">
                    <tbody>
                    ${commonDiv}
                    <tr>
                        <td align="right">
                            <label>仓库名称：</label>
                            <input type="hidden" id="putawaystorageId"/>
                        </td>
                        <td id="putawaystorageName"></td>

                        <td align="right">
                            <label>现有库存：</label>
                        </td>
                        <td id="surplusnum"></td>

                    </tr>

                    </tbody>
                </table>

                <form class="form-horizontal">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label col-md-4">上架数量</label>

                                    <div class="col-md-5">
                                        <input id="putawayInitNum" placeholder=""
                                               class="form-control placeholder-no-fix"
                                               check-type="required number"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label col-md-4">价格</label>

                                    <div class="col-md-5">
                                        <input id="pricehastax" placeholder="含税单价"
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
                    <button id="savePutaway" type="button" class="btn btn-primary ">保存</button>
                    <button id="closePutaway" type="button" class="btn btn-default" data-dismiss="modal">关闭
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

<script src="<c:url value='/js/pc/A_public/bootstrap.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/commonUtil.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/pc/prodetail/prodetail.js'/>" type="text/javascript"></script>

