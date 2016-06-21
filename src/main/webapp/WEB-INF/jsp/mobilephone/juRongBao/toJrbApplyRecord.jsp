<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
  <jsp:include page="../top.jsp"></jsp:include>

  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
  <link href="<c:url value="/css/mobilephone/jrb/historicalRecord.css"/>" rel="stylesheet" type="text/css">

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
<div class="zhongti" id="tou">
  <!--头部-->
  <jsp:include page="../navigation.jsp"></jsp:include>

  <!--搜索-->
  <div class="shsu">
    <form>
      <jsp:include page="search.jsp"></jsp:include>
    </form>
  </div>

  <!--记录-->
  <div class="JL">
    <div class="JL-0">
      <div class="JL-1">
        <div class="JL-1-t"></div>
        <div class="JL-1-z">订单：<samp class="JL-sam1">201510100018</samp></div>
      </div>
      <div class="JL-2">
        申请额度时间：<samp class="JL-sam2">2015-10-10</samp>
        <div class="JL-2-1">金额：<samp class="JL-sam2">9999</samp>&nbsp;万</div>
      </div>
    </div>
    <div style="width:100%; height:20px; clear:left; background:#F3F3F3;"></div>

    <div class="JL-0">
      <div class="JL-1">
        <div class="JL-1-t"></div>
        <div class="JL-1-z">订单：<samp class="JL-sam1">201510180018</samp></div>
      </div>
      <div class="JL-2">
        申请额度时间：<samp class="JL-sam2">2015-10-15</samp>
        <div class="JL-2-1">金额：<samp class="JL-sam2">9999</samp>&nbsp;万</div>
      </div>
    </div>
    <div style="width:100%; height:20px; clear:left; background:#F3F3F3;"></div>

    <div class="JL-0">
      <div class="JL-1">
        <div class="JL-1-t"></div>
        <div class="JL-1-z">订单：<samp class="JL-sam1">201510180018</samp></div>
      </div>
      <div class="JL-2">
        申请额度时间：<samp class="JL-sam2">2015-10-15</samp>
        <div class="JL-2-1">金额：<samp class="JL-sam2">9999</samp>&nbsp;万</div>
      </div>
    </div>
    <div style="width:100%; height:20px; clear:left; background:#F3F3F3;"></div>

    <div class="JL-0">
      <div class="JL-1">
        <div class="JL-1-t"></div>
        <div class="JL-1-z">订单：<samp class="JL-sam1">201510180018</samp></div>
      </div>
      <div class="JL-2">
        申请额度时间：<samp class="JL-sam2">2015-10-15</samp>
        <div class="JL-2-1">金额：<samp class="JL-sam2">9999</samp>&nbsp;万</div>
      </div>
    </div>
    <div style="width:100%; height:20px; clear:left; background:#F3F3F3;"></div>

    <div class="JL-0">
      <div class="JL-1">
        <div class="JL-1-t"></div>
        <div class="JL-1-z">订单：<samp class="JL-sam1">201510180018</samp></div>
      </div>
      <div class="JL-2">
        申请额度时间：<samp class="JL-sam2">2015-10-15</samp>
        <div class="JL-2-1">金额：<samp class="JL-sam2">9999</samp>&nbsp;万</div>
      </div>
    </div>
    <div style="width:100%; height:20px; clear:left; background:#F3F3F3;"></div>

    <div class="JL-0">
      <div class="JL-1">
        <div class="JL-1-t"></div>
        <div class="JL-1-z">订单：<samp class="JL-sam1">201510180018</samp></div>
      </div>
      <div class="JL-2">
        申请额度时间：<samp class="JL-sam2">2015-10-15</samp>
        <div class="JL-2-1">金额：<samp class="JL-sam2">9999</samp>&nbsp;万</div>
      </div>
    </div>
    <div style="width:100%; height:20px; clear:left; background:#F3F3F3;"></div>

    <div class="JL-0">
      <div class="JL-1">
        <div class="JL-1-t"></div>
        <div class="JL-1-z">订单：<samp class="JL-sam1">201510180018</samp></div>
      </div>
      <div class="JL-2">
        申请额度时间：<samp class="JL-sam2">2015-10-15</samp>
        <div class="JL-2-1">金额：<samp class="JL-sam2">9999</samp>&nbsp;万</div>
      </div>
    </div>
    <div style="width:100%; height:20px; clear:left; background:#F3F3F3;"></div>
  </div>

</div><!--主体-->
</body>
</html>
