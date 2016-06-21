<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../top.jsp"></jsp:include>
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
  <jsp:include page="../navigation.jsp"></jsp:include>
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

  <!--所在仓库-->
  <div class="szck">商品列表</div>

    <!--仓库信息-->
  <c:forEach items="${storageGoods}" var="item">
    <a href="/BiGeZaiXian/good/toDetail?companyId=${companyId}&storageId=${item.STORAGEID}&goodId=${goodId}&price=${item.PRICEHASTAX}&onsellNum=${item.UPSELL-item.DOWNSELL-item.SELLOUT}">
    <div class="ckxx">
      <div class="ckxx-1">
        <div class="ckxx-1-t"></div>
        <div class="ckxx-1-z"><samp class="sa2">${item.ROWNUM}.${item.STORAGENAME}</samp></div>
      </div>
      <div class="ckxx-2">
        <div class="ckxx-2-l">
          <samp style="color:#EB6100;">价格：
            <samp style="font-size:12px; font-family:'微软雅黑'; color:#eb6100;">${item.PRICEHASTAX}</samp>元
          </samp></div>
        <div class="ckxx-2-r">在售数量：<samp class="sa2">${item.UPSELL-item.DOWNSELL-item.SELLOUT}</samp>${good.MEA}</div>
      </div>
    </div>
    </a>
  </c:forEach>

  <!--底部-->
  <jsp:include page="../foot_index.jsp"></jsp:include>
</div>

</body>
</html>
