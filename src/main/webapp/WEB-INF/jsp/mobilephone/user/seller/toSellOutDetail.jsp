<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../../top.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
    <link href="<c:url value="/css/mobilephone/seller/soldOutDetail.css"/>" rel="stylesheet" type="text/css">
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

            var  total = 0;
            <c:forEach items="${sellOutList}" var="item">
            total += ${item.AFFIRMNUM};
            </c:forEach>
            $("#total").text(total);
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
            <%--<!--在售数量-->
            <div class="xykx">
                <div class="xykx-1">在售数量：</div>
                <div class="xykx-2"><samp class="sa2">100</samp>&nbsp;吨</div>
            </div>--%>
            <!--在售价格-->
            <div class="xykx">
                <div class="xykx-1">在售价格：</div>
                <div class="xykx-2"><samp class="sa2">${price}</samp>&nbsp;元</div>
            </div>
            <!--标题-->
            <div class="biaot1">
                <div class="bt-1">
                    <div class="no">编号</div>
                    <div class="date">日期</div>
                    <div class="downSell">售出</div>
                </div>
            </div>
            <c:forEach items="${sellOutList}" var="item">
                <!--内容 1-->
                <div class="biaot2">
                    <div class="bt-2">
                        <div class="num_d-2-1"><samp class="sa2">${item.ROWNUM}</samp></div>
                        <div class="num_d-2-2">
                            <samp class="sa2"><fmt:formatDate value="${item.CREATETIME}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></samp>
                        </div>
                        <div class="num_d-2-3"><samp class="sa2">${item.AFFIRMNUM}</samp>${good.MEA}</div>
                    </div>
                </div>
            </c:forEach>
            <!--合计-->
            <div class="zongj">
                <div class="zj-1">合计</div>
                <div class="zj-2"><samp class="sa2" id="total"></samp>${good.MEA}</div>
            </div>
        </div>
    </form>

    <!--底部-->
    <jsp:include page="../../footer.jsp"></jsp:include>
</div>

</body>
</html>
