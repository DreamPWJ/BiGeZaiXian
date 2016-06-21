<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
  <jsp:include page="../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/mobilephone/good/toSpotList.js"/>"></script>

</head>
<body>
<section class="wrap">
  <a name="top"></a>
  <jsp:include page="../navigation.jsp"></jsp:include>
  <section class="list-filter">
    <section class="products-list">
      <ul>
        <c:forEach items="${goodList}" var="good">
        <li>
          <p class="fl">
            <a href="/BiGeZaiXian/good/toStorageGoods?companyId=${good.COMPANYID}&goodId=${good.GOODID}">
              <c:choose>
                <c:when test="${good.PICURL != null}">
                  <img alt="这是一张图片" src="<c:url value="${good.PICURL}"/>" style="width: 75px;height: 75px">
                </c:when>
                <c:otherwise>
                  <img alt="这是一张图片" src="/BiGeZaiXian/images/mobilephone/temporary/title.jpg" style="width: 75px;height: 75px">
                </c:otherwise>
              </c:choose>

            </a>
          </p>
          <div class="products-list-c">
            <p>牌号：${good.MARK} &nbsp;&nbsp; 产地：${good.PRODUCINGAREA}</p>
            <p class="plc-hi"><a href="/BiGeZaiXian/good/toStorageGoods?companyId=${good.COMPANYID}&goodId=${good.GOODID}" class="blue">
              ${good.GOODKIND}  ${good.MARK} &nbsp;&nbsp; ${good.NAME}</a></p>
            <p class="pt5p"><span class="orange">￥${good.MINPRICE}/${good.MEA}</span></p>
          </div>
        </li>
        </c:forEach>
      </ul>
      <%--<a href="javascript:void(0);" id="PageNext">点击加载下一页</a>--%>
    </section>

  </section>
  <jsp:include page="../foot_index.jsp"></jsp:include>
</section>
<%--<script src="/js/pic/ProductListPic.js?minify=true"></script>--%>
<script type="text/javascript">

  var apiHost = "/product/list/productType/Spot";

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

<div class="top"></div>

<script type="text/javascript">
  $(function(){
    //置顶按钮显示/隐藏实现
    $(window).scroll(function(){
      var w_height = $(window).height();//浏览器高度
      var scroll_top = $(document).scrollTop();//滚动条到顶部的垂直高度
      if(scroll_top > w_height){
        $(".top").fadeIn(500);
      }else{
        $(".top").fadeOut(500);
      }
    });
    //置顶
    $(".top").click(function(e){
      e.preventDefault();
      $(document.documentElement).animate({
        scrollTop: 0
      },200);
      //支持chrome
      $(document.body).animate({
        scrollTop: 0
      },200);
    });
  })
</script>


</body></html>
