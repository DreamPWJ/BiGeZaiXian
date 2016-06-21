<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../../top.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
    <link href="<c:url value="/css/mobilephone/seller/putawayDetail.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/css/mobilephone/seller/myGoods.css"/>" rel="stylesheet" type="text/css" >
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
            <div class="cangk" style="margin-top: 0px">
                <h1 style="font-size: 24px;">在售总计</h1>
            </div>
            <div id="myGoods" style="margin-top: 5px;">
                <c:forEach items="${onSellList}" var="item">
                <!--商品 1-->
                <div class="sangp" style="height: 30px;padding: 5px 0px 5px 0px;">
                    <div class="sangp-1" style="height: 30px;"><samp>${item.ROWNUM}</samp>.</div>
                    <div class="sangp-2" style="height: 30px;width: 90%">
                        <div class="gp-2-1" style="font-size: 16px;">
                            <div class="gp-2-1-1">在售价格：<samp >${item.PRICEHASTAX}</samp>元</div>

                            <div class="gp-2-1-1">&nbsp;&nbsp;在售余量：<samp >${item.UPSELL - item.DOWNSELL - item.SELLOUT}</samp>${good.MEA}</div>
                        </div>
                    </div>
                </div>
                    <!--下架、明细-->
                    <div class="xiam" style="margin-bottom: 10px;">
                        <div class="xiam-1" style=" background:#5A9AE1;">
                            <div class="xiam-1-1">
                                <div class="xiam-1-t">
                                    <img src="<c:url value="/images/mobilephone/Apublic/xj.png"/>" width="20" height="20">
                                </div>
                                <div class="xiam-1-z">
                                    <a href="/BiGeZaiXian/good/toUnShelve?companyId=${companyId}&storageId=${storageId}&goodId=${goodId}&price=${item.PRICEHASTAX}&sellSurplus=${item.UPSELL - item.DOWNSELL - item.SELLOUT}&storageAddress=${storageAddress}">下&nbsp;架</a>
                                </div>
                            </div>
                        </div>
                        <div class="xiam-2" style=" background:#1BBC9B;">
                            <div class="xiam-1-1">
                                <div class="xiam-1-t"><img src="<c:url value="/images/mobilephone/Apublic/xjmx.png"/>" width="20" height="20"></div>
                                <div class="xiam-1-z">
                                    <a href="/BiGeZaiXian/good/toUnShelveDetail?companyId=${companyId}&storageId=${storageId}&goodId=${goodId}&price=${item.PRICEHASTAX}&storageAddress=${storageAddress}">下架明细</a>
                                </div>
                            </div>
                        </div>
                        <div class="xiam-1" style=" background:#F1C50E;">
                            <div class="xiam-1-1">
                                <div class="xiam-1-t"><img src="<c:url value="/images/mobilephone/Apublic/scmx.png"/>" width="20" height="20"></div>
                                <div class="xiam-1-z">
                                    <a href="/BiGeZaiXian/good/toSellOutDetail?companyId=${companyId}&storageId=${storageId}&goodId=${goodId}&price=${item.PRICEHASTAX}&storageAddress=${storageAddress}">售出明细</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!--明细-->
        <div class="tjkc" style="margin: 0px 0px 0px 0px;">
            <!--仓库地址-->
            <div class="cangk" style="margin-top: 0px">
                <h1 style="font-size: 24px;">上架明细</h1>
            </div>
            <div style="margin-top: 5px;">
                <!--标题-->
                <div class="sangp" style="height: 20px;padding: 0px 0px 0px 0px;">
                    <div class="sangp-1" style="height: 20px;width: 10%;font-size: 14px;"><samp>批次</samp></div>
                    <div class="sangp-2" style="height: 20px;width: 90%">
                        <div class="gp-2-1">
                            <div class="gp-2-1-1" style="width: 17%;text-align: center;font-size: 14px;"><samp>上架</samp></div>
                            <div class="gp-2-1-1" style="width: 17%;text-align: center;font-size: 14px;"><samp>确认</samp></div>
                            <div class="gp-2-1-1" style="width: 17%;text-align: center;font-size: 14px;"><samp>单价</samp></div>
                            <div class="gp-2-1-1" style="width: 49%;text-align: center;font-size: 14px;"><samp>日期</samp></div>
                        </div>
                    </div>
                </div>
                <c:forEach items="${upSellDetails}" var="item">
                <!--商品 1-->
                <div class="sangp" style="height: 24px;padding: 0px 0px 0px 0px;">
                    <div class="sangp-1" style="height: 24px;width: 10%;font-size: 12px;"><samp>${item.ROWNUM}</samp>.</div>
                    <div class="sangp-2" style="height: 24px;width: 90%">
                        <div class="gp-2-1">
                            <div class="gp-2-1-1" style="width: 17%;text-align: center;font-size: 12px;"><samp >${item.INITNUM}${good.MEA}</samp></div>
                            <div class="gp-2-1-1" style="width: 17%;text-align: center;font-size: 12px;"><samp >${item.AFFIRMNUM}${good.MEA}</samp></div>
                            <div class="gp-2-1-1" style="width: 17%;text-align: center;font-size: 12px;"><samp >${item.PRICEHASTAX}</samp>元</div>
                            <div class="gp-2-1-1" style="width: 49%;text-align: center;font-size: 12px;">
                                <samp ><fmt:formatDate value="${item.CREATETIME}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></samp>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </form>



    <!--底部-->
    <jsp:include page="../../footer.jsp"></jsp:include>
</div>

</body>
</html>
