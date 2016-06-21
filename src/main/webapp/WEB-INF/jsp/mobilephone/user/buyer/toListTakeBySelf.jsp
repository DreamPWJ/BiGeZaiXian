<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../../top.jsp"></jsp:include>
  <link href="<c:url value="/css/mobilephone/user/noSinceSubmit.css"/>" rel="stylesheet" type="text/css" >
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
  <script type="text/javascript">
    $(function(){
      var aDent = true;
      var oParent = $('.list-bar');
      var oNodeContent = $('.list-menu');
      oParent.click(function(){
        if(aDent){
          oNodeContent.stop().slideDown(500);
        }else{
          oNodeContent.stop().slideUp(500);
        }
        aDent = !aDent;
      });
    });

  </script>
</head>

<body>
<jsp:include page="../../navigation.jsp"></jsp:include>

<c:forEach items="${goodList}" var="item">
  <!--订单标题-->
  <div class="ddbt">
    <div class="ddbt-2">${item.PRODUCER}&nbsp;${item.GOODKIND}&nbsp;${item.MARK}</div>
    <div class="ddbt-3"><div class="ddbt-3-1"></div></div>
  </div>

  <!--订单详细-->
  <div class="ddxx">
    <div class="ddxx-1">
      <div class="ddxx-1-1"><img src="<c:url value="${item.PICURL}"/>"  style="width:54px; height:60px;" /></div>

      <div class="ddxx-1-2">
        <div class="ddxx-1-2-s">牌号：<samp class="asm">${item.MARK}</samp></div>
        <div class="ddxx-1-2-x">产地：<samp class="asm">${item.PRODUCER}&nbsp;${item.GOODKIND}</samp></div>
      </div>
      <div class="ddxx-1-3">
        <div class="ddxx-1-3-s">￥<samp class="asm">${item.PRICEHASTAX}.00</samp></div>
        <div class="ddxx-1-3-x">x&nbsp;<samp style=" font-size:14px; color:#B0B0B0">${item.AFFIRMNUM}</samp>&nbsp;${item.MEA}</div>
      </div>

    </div>
  </div>

  <!--运费,实付款-->
  <div class="yf">
    <div class="yf-1">运费：</div>
    <div class="yf-2"></div>
    <div class="sfk-1">实付款(不含运费)：</div>
    <div class="sfk-2">￥${item.PRICEHASTAX * item.AFFIRMNUM}</div>
  </div>

  <!--订单号，成交时间-->
  <div class="ddh">
    <div class="ddh-1">订单号：<samp style=" font-size:14px; color:#666">${item.ORDERNO}</samp></div>
    <div class="ddh-1">聚融宝订单号：<samp style=" font-size:14px; color:#666">002646879870542</samp></div>
    <div class="ddh-1">成交时间：
      <samp style=" font-size:14px; color:#666">
          <%--${item.CREATETIME}--%>
        <fmt:formatDate value="${item.CREATETIME}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
      </samp>
    </div>
  </div>
  <!--底线-->
  <div class="dx"></div>
  <!--联系客服、取消订单、付款，按钮-->
  <div class="lqf">
    <div class="ycq-1">
      <div class="ycq-1-3"><a href="#">我已提货</a></div>
      <div class="yc"></div>
      <div class="ycq-1-2"><a href="#">延期自提</a></div>
      <div class="yc"></div>
      <div class="ycq-1-1"><a href="#">取消订单</a></div>
    </div>
  </div>
</c:forEach>

  <!--底部-->
<jsp:include page="../../footer.jsp"></jsp:include>
</div>
</body>
</html>

