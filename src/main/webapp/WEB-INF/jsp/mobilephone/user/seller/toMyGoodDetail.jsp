<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../../top.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>

    <link href="<c:url value="/css/mobilephone/seller/doosDetail.css"/>" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        $(function () {
            var aDent = true;
            var oParent = $('.list-bar');
            var oNodeContent = $('.list-menu');
            oParent.click(function () {
                if (aDent) {
                    oNodeContent.stop().slideDown(500);
                } else {
                    oNodeContent.stop().slideUp(500);
                }
                aDent = !aDent;
            });
        });
    </script>
</head>

<body>
<div class="zhongti">
    <!--头部-->
    <jsp:include page="../../navigation.jsp"></jsp:include>
    <!--产品明细-->
    <div class="comx">
        <div class="comx-1"><samp>${good.GOODKIND}/${good.MARK}</samp></div>
        <div class="comx-2">
            <div class="comx-2-l">牌号：<samp class="sa2">${good.MARK}</samp></div>
            <div class="comx-2-r">计量单位：<samp class="sa2">${good.MEA}</samp></div>
        </div>
        <div class="comx-2">
            <div class="comx-2-l">品种：<samp class="sa2">${good.GOODKIND}</samp></div>
            <div class="comx-2-r">产商：<samp class="sa2">${good.PRODUCER}</samp></div>
        </div>
        <div class="comx-2">
            <div class="comx-2-l">包装说明：<samp class="sa2">${good.PACKCONTENT}</samp></div>
            <div class="comx-2-r">用途级别：<samp class="sa2">${good.USE}</samp></div>
        </div>
        <div class="comx-2">
            <div class="comx-2-l">产地：<samp class="sa2">${good.PRODUCINGAREA}</samp></div>
            <div class="comx-2-r">包装类型：<samp class="sa2">${good.PACKTYPE}</samp></div>
        </div>
        <div class="comx-2">
            <%--<div class="comx-2-l">产商：<samp class="sa2">${good.PRODUCER}</samp></div>--%>
            <%--<div class="comx-2-r">包装说明：<samp class="sa2">${good.PACKCONTENT}</samp></div>--%>
            商品描述：${good.CONTENT}
        </div>
    </div>

    <!--所在仓库-->
    <div class="szck">所在仓库</div>

<c:forEach items="${storageList}" var="item">
    <!--仓库信息-->
    <div class="ckxx">
        <div class="ckxx-1">
            <div class="ckxx-1-t"></div>
            <div class="ckxx-1-z"><samp class="sa2">${item.ROWNUM}.${item.ADDRESS}</samp></div>
        </div>
        <div class="ckxx-2">
            <div class="ckxx-2-l">
                <samp style="color:#EB6100;">在售：
                    <samp style="font-size:12px; font-family:'微软雅黑'; color:#eb6100;">${item.UPSELL - item.DOWNSELL -item.SELLOUT}</samp>${good.MEA}
                </samp>
            </div>
            <div class="ckxx-2-r">入库累计：<samp class="sa2">${item.STOCKINSUM}</samp>${good.MEA}</div>
        </div>
        <div class="ckxx-2">
            <div class="ckxx-2-l">售出：<samp class="sa2">${item.SELLOUT}</samp>${good.MEA}</div>
            <div class="ckxx-2-r">入库确认：<samp class="sa2">${item.STOCKAFFIRM}</samp>${good.MEA}</div>
        </div>
        <div class="ckxx-2">
            <div class="ckxx-2-l">其他支出：<samp class="sa2">${item.OTHER}</samp>${good.MEA}</div>
            <div class="ckxx-2-r">现有库存：<samp class="sa2">${item.STOCKAFFIRM - item.UPSELL + item.DOWNSELL + item.STOCKBACK + item.OTHER}</samp>${good.MEA}</div>
        </div>
    </div>
    <!--选择-->
    <div class="xkxz">
        <div class="xkxz-1" style=" background:#5A9AE1;">
            <a href="/BiGeZaiXian/good/toAddStock?companyId=${companyId}&storageId=${item.STORAGEID}&goodId=${goodId}&stockNow=${item.STOCKAFFIRM-item.UPSELL+item.DOWNSELL+item.STOCKBACK-item.OTHER}&mea=${good.MEA}&storageAddress=${item.ADDRESS}">
                <div class="xkxz-1-t"><img src="<c:url value="/images/mobilephone/Apublic/tjkc.png"/>" width="18"
                                           height="18"></div>
                添加库存</a>
        </div>
        <div class="xkxz-1" style=" background:#1BBC9B;">
            <a href="/BiGeZaiXian/good/toStockInDetail?companyId=${companyId}&storageId=${item.STORAGEID}&goodId=${goodId}&storageAddress=${item.ADDRESS}&mea=${good.MEA}">
                <div class="xkxz-1-t"><img src="<c:url value="/images/mobilephone/Apublic/rkmx.png"/>" width="18"
                                           height="18"></div>
                入库明细</a>
        </div>
        <div class="xkxz-1" style=" background:#F1C50E;">
            <a href="/BiGeZaiXian/good/toArrival?companyId=${companyId}&storageId=${item.STORAGEID}&goodId=${goodId}&storageAddress=${item.ADDRESS}&mea=${good.MEA}">
                <div class="xkxz-1-t"><img src="<c:url value="/images/mobilephone/Apublic/sj.png"/>" width="18"
                                           height="18"></div>
                上架</a>
        </div>
        <div class="xkxz-1" style=" background:#F26C63;">
            <a href="/BiGeZaiXian/good/toArrivalDetail?companyId=${companyId}&storageId=${item.STORAGEID}&goodId=${goodId}&storageAddress=${item.ADDRESS}&mea=${good.MEA}">
                <div class="xkxz-1-t"><img src="<c:url value="/images/mobilephone/Apublic/sjmx.png"/>" width="18"
                                           height="18"></div>
                上架明细</a>
        </div>
    </div>
</c:forEach>
    <!--底部-->
    <jsp:include page="../../footer.jsp"></jsp:include>
</div>

</body>
</html>
