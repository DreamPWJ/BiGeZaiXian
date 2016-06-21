<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>比格在线-原料商城</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/mall.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/plugins/JqueryPagination/jquery.pagination.css'/>" rel="stylesheet" type="text/css">

</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>

<!-- content ----------- begin -->
<div style="margin-bottom: 10px">
    <img src="<c:url value="/images/pc/mall/selfBanner.jpg"/>" alt="顶部的展示图片" style="width: 100%"/>
</div>
<div class="content">
    <p style="font-size: 16px;font-weight: bold">自营商城</p>
    <div class="box-base">
        <div class="product-type">
            <%--<div class="product-type-title">
                <h3>筛选</h3>
            </div>--%>
            <table id="pro_table" class="product-li">
                <colgroup>
                    <col width="10%"/>
                    <col width="90%"/>
                </colgroup>
                <tbody>
                <tr>
                    <td class="title" align="right"><span>分类</span></td>
                    <td style="text-align: left;">
                        <a class="item current">全部</a>
                        <c:forEach items="${goodKindCode}" var="item">
                            <c:if test="${item.LEVE==1}"> <a class="item " name="manufacturer">
                                ${item.NAME}</a></c:if>
                        </c:forEach>
                    </td>
                </tr>

                <tr>
                    <td class="title" align="right"><span>用途级别</span></td>
                    <td style="text-align: left;">
                        <a class="item current">全部</a>
                        <c:forEach items="${useCode}" var="item" varStatus="status">
                            <a class="item" name="manufacturer"  <c:if
                                    test="${status.index>15}"> style="display: none"</c:if> >${item.NAME}</a>
                        </c:forEach>
                    </td>
                </tr>

                <tr>
                    <td class="title" align="right"><span>品牌/产商</span></td>
                    <td style="text-align: left;">

                        <a class="item current" name="manufacturer" data-id="">全部</a>
                        <a class="item " name="manufacturer" data-id="1">埃克森美孚</a>
                        <a class="item " name="manufacturer" data-id="2">沙特</a>
                        <a class="item " name="manufacturer" data-id="3">泰国PTT</a>
                        <a class="item " name="manufacturer" data-id="4">伊朗石化</a>
                        <a class="item " name="manufacturer" data-id="5">泰国暹罗</a>
                        <a class="item " name="manufacturer" data-id="6">中海壳牌</a>
                        <a class="item " name="manufacturer" data-id="7">扬子石化</a>
                        <a class="item " name="manufacturer" data-id="8">巴西Braskem</a>
                        <a class="item " name="manufacturer" data-id="9">大庆石化</a>

                    </td>
                </tr>
                <tr>
                    <td align="right" class="title"><span>仓库/城市</span></td>
                    <td style="text-align: left;">
                        <a class="item current" name="origin" data-id="">全部</a>
                        <a class="item " name="origin" data-id="2099500">上海</a>
                        <a class="item " name="origin" data-id="2099501">常州</a>
                        <a class="item " name="origin" data-id="2099502">苏州</a>
                        <a class="item " name="origin" data-id="2099503">杭州</a>
                        <a class="item " name="origin" data-id="2099503">日照</a>

                    </td>
                </tr>
                </tbody>
            </table>

        </div>
        <p><a name="pagepoint"></a></p>
        <div class="box-span">
            <form action="<c:url value="/mall/toMall"/> " method="post" class="form-horizontal">
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group" style="margin-bottom: 10px;">
                            <label class="control-label col-md-3">品种</label>

                            <div class="col-md-8">
                                <input name="goodKindName" class="form-control placeholder-no-fix"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group" style="margin-bottom: 10px;">
                            <label class="control-label col-md-3">牌号</label>

                            <div class="col-md-8">
                                <input name="mark" class="form-control placeholder-no-fix"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group" style="margin-bottom: 10px;">
                            <label class="control-label col-md-3">厂商</label>

                            <div class="col-md-8">
                                <input name="producer" class="form-control placeholder-no-fix"/>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <input id="searchmall" type="submit" class="btn btn-primary " value="搜索" style="width: 48%">
                        <input type="reset" class="btn btn-warning " value="重置" style="width: 48%">
                    </div>

                </div>
            </form>
        </div>
    </div>
    <div style="margin-top: 10px">
        <h4 style="color: #f70">自营商城内所有商品报价均已含税，请放心认购！</h4>
    </div>
    <div class="product-list span">
        <div class="tab-base">
            <ul>
                <li><a href="<c:url value='/mall/toMall'/>">全部</a></li>
                <li><a href="<c:url value='/mall/toMall?goodKindName=PE'/>">HDPE</a></li>
                <li><a href="<c:url value='/mall/toMall?goodKindName=PE'/>">LDPE</a></li>
                <li><a href="<c:url value='/mall/toMall?goodKindName=PE'/>">LLDPE</a></li>
                <li><a href="<c:url value='/mall/toMall?goodKindName=PP'/>">PPHM</a></li>
                <li><a href="<c:url value='/mall/toMall?goodKindName=PP'/>">PPCP</a></li>
                <li><a href="<c:url value='/mall/toMall?goodKindName=PVC'/>">PVC</a></li>
            </ul>
        </div>

        <table class="table table-striped table-bordered table-hover"
               id="data-table">
            <thead >
            <tr>
                <th>属性</th>
                <th>产商</th>
                <th>价格</th>
                <th>数量</th>
                <th>仓库</th>
                <th>产地</th>
                <th>公司</th>
                <th>更新时间</th>
                <th>操作</th>
                <%--    <th>选购</th>--%>
            </tr>
            </thead>

            <tbody id="tbodymall" >
            <c:forEach items="${mallsModel}" var="item">
                <tr class="tritems">
                    <%--<td>
                            &lt;%&ndash;     <div class="icostate"></div>&ndash;%&gt;
                            ${item.RN}
                    </td>--%>
                    <td>
                        <div style="background: #1CAAEB;border-radius:10px;padding: 5px; ">
                            <p style="padding-bottom: 10px;color: #333333">${item.GOODKINDNAME}</p>
                            <p>
                                <a style="color: #FFFFFF" href="<c:url value='/good/togoodsdetail?goodId=${item.GOODID}&stockId=${item.STOCKID}&sellsurplusnum=${item.SELLSURPLUSNUM}&companyId=${item.COMPANYID}'/>">
                                    ${item.MARK}
                                </a>
                            </p>
                        </div>
                    </td>
                    <td>${item.PRODUCER}</td>
                    <td><span class="price" style="color:#FF7700 ">￥<fmt:formatNumber value="${item.PRICEHASTAX}"
                                                               pattern="#,#00.00"></fmt:formatNumber></span>
                    </td>
                    <td><fmt:formatNumber value="${item.SELLSURPLUSNUM}"
                                          pattern="0.000"></fmt:formatNumber> ${item.MEANAME}</td>
                    <td>${item.STORAGENAME}</td>
                    <td>${item.PRODUCINGAREA}</td>
                    <td>${item.COMPANYNAME}</td>
                    <td><fmt:formatDate value="${item.CREATETIME}" pattern="MM-dd HH:mm"></fmt:formatDate></td>
                    <td>
                        <a href="<c:url value='/good/togoodsdetail?goodId=${item.GOODID}&stockId=${item.STOCKID}&sellsurplusnum=${item.SELLSURPLUSNUM}&companyId=${item.COMPANYID}'/>">查看详情</a>
                    </td>
                        <%--         <td>
                                     <a class="btn-yellow">加入购物车</a>
                                 </td>--%>

                </tr>
            </c:forEach>
            </tbody>
        </table>

        <!---------------------------------这里写分页--------------------------------->
        <div id="page" class="m-pagination pull-right"></div>
        <input type="hidden" id="totalcount" value="${totalcount}"/>
        <input type="hidden" id="pageSize" value="${pageSize}"/>
        <input type="hidden" id="urlpage" value="/BiGeZaiXian/mall/toMall" pagepoint="pagepoint"/>
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



