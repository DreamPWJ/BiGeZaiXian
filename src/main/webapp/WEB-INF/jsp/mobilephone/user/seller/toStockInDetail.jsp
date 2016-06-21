<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../../top.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
    <link href="<c:url value="/css/mobilephone/seller/storageDetail.css"/>" rel="stylesheet" type="text/css">
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
            <div class="comx-2-r">包装单位：<samp class="sa2">${good.PACKAGE}</samp></div>
        </div>
        <div class="comx-2">
            <%--<div class="comx-2-l">单价：<samp class="sa2">9800.00</samp>元</div>--%>
            <div class="comx-2-r">用途级别：<samp class="sa2">${good.USE}</samp></div>
        </div>
        <div class="comx-2">
            <div class="comx-2-l">产地：<samp class="sa2">${good.PRODUCINGAREA}</samp></div>
            <div class="comx-2-r">包装类型：<samp class="sa2">${good.PACKTYPE}</samp></div>
        </div>
        <div class="comx-2">
            <div class="comx-2-l">产商：<samp class="sa2">${good.PRODUCER}</samp></div>
            <div class="comx-2-r">包装说明：<samp class="sa2">${good.PACKCONTENT}</samp></div>
        </div>
    </div>

    <form>
        <div class="tjkc">
            <!--仓库地址-->
            <div class="cangk">
                <div class="cangk-1">仓库地址：</div>
                <div class="cangk-2"><samp class="sa2">${storageAddress}</samp></div>
            </div>

            <!--标题-->
            <div class="biaot1">
                <div class="bt-1">
                    <div class="d-1">批次</div>
                    <div class="d-1">日期</div>
                    <div class="d-1">入库</div>
                    <div class="d-1">入库确认</div>
                </div>
            </div>
            <!--内容 1-->
            <c:forEach items="${stockInDetails}" var="item">
            <div class="biaot2">
                <div class="bt-2">
                    <div class="d-2">第<samp class="sa2">${item.ROWNUM}</samp>批</div>
                    <div class="d-2">
                        <samp class="sa2">
                            <fmt:formatDate value="${item.CREATETIME}" pattern="yyyy-MM-dd"></fmt:formatDate>
                        </samp>
                    </div>
                    <div class="d-2"><samp class="sa2">${item.INITNUM}</samp>${mea}</div>
                    <div class="d-2-1"><samp class="sa2">${item.AFFIRMNUM}</samp>${mea}</div>
                </div>
            </div>
            </c:forEach>

            <div class="zongj">
                <div class="zj-1">合计</div>
                <div class="zj-2"><samp class="sa2">${sums.INITSUM}</samp>${mea}</div>
                <div class="zj-3"><samp class="sa2">${sums.AFFIRMSUM}</samp>${mea}</div>
            </div>
        </div>
    </form>

    <!--底部-->
    <jsp:include page="../../footer.jsp"></jsp:include>
</div>

</body>
</html>
