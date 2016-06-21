<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
  <jsp:include page="../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
</head>
<body>
<a name="top"></a>
<jsp:include page="../navigation.jsp"></jsp:include>
<header class="header pt20p">
  <div class="search">
    <input class="search-text" placeholder="输入商品牌号" type="text" id="mark">
    <a href="" id="search_a">
    <input class="search-btn" type="button" value="" id="search">
    </a>
  </div>
</header>
<section class="area-category">
  <h3 class="ac-f">
    <span class="mp1"></span>
    <a href="/BiGeZaiXian/good/toClassifyList?type=001">聚乙烯 (PE)</a>
  </h3>
  <section class="ac-pr" style="border-top:1px solid #eee;">
    <ul>
      <c:forEach items="${markList_PE}" var="item">
        <li><a href="/BiGeZaiXian/good/toGoodList?mark=${item.MARK}">${item.MARK}</a></li>
      </c:forEach>
    </ul>
  </section>
</section>
<section class="area-category">
  <h3 class="ac-f">
    <span class="mp2"></span>
    <a href="/BiGeZaiXian/good/toClassifyList?type=002">聚丙烯 (PP)</a>
  </h3>
  <section class="ac-pr" style="border-top:1px solid #eee;">
    <ul>
      <c:forEach items="${markList_PP}" var="item">
        <li><a href="/BiGeZaiXian/good/toGoodList?mark=${item.MARK}">${item.MARK}</a></li>
      </c:forEach>
    </ul>
  </section>
</section>
<section class="area-category">
  <h3 class="ac-f">
    <span class="mp3"></span>
    <a href="/BiGeZaiXian/good/toClassifyList?type=003">聚氯乙烯 (PVC)</a>
  </h3>
  <section class="ac-pr" style="border-top:1px solid #eee;">
    <ul>
      <c:forEach items="${markList_PVC}" var="item">
        <li><a href="/BiGeZaiXian/good/toGoodList?mark=${item.MARK}">${item.MARK}</a></li>
      </c:forEach>
    </ul>
  </section>
</section>
<script type="text/javascript">
  $(function(){
    //搜索
    $("#search").click(function(){
      var mark = $("#mark").val();
      $("#search_a").attr("href","/BiGeZaiXian/good/searchGoodByMark?mark="+mark);
    });

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
<!--footer stop-->
<jsp:include page="../foot_index.jsp"></jsp:include>
</body></html>