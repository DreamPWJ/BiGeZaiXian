<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/js/commonUtil.js"/>"></script>
  <link href="<c:url value="/css/mobilephone/seller/saleGoods.css"/>" rel="stylesheet" type="text/css" >
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

      var input = $("#input").val();
      $("#button").click(function(){
        var url = "/BiGeZaiXian/good/getAjaxSellList?condition="+input;
        $.ajax({
          type: "GET",
          url: url,
          dataType: "json",
          success: function(data){
            $("#content").html("");// 清空内容
            var html = '';
            $.each(data, function(i, item){
              html += '<div class="sangp"> <div class="sangp-1"><samp style="font-size:14px; font-weight:bold; color:#4C9ED9;"></samp></div>';
              html += '<div class="sangp-2"> <div class="sangp-2-4">';
              html += '       <div class="sangp-2-4-1">牌号：&nbsp;<samp class="samn">'+item.MARK+'</samp></div>';
              html += '<div class="sangp-2-4-2">产地：&nbsp;'+item.PRODUCINGAREA+'</div> </div>';
              html += '<div class="sangp-2-4"> <div class="sangp-2-4-1"> 下架：';
              html += '&nbsp;<samp class="samn">'+item.INITNUM+'</samp>克</div>';
              html += ' <div class="sangp-2-4-2">确认：&nbsp;<samp class="samn">'+item.AFFIRMNUM+'</samp>'+item.MEA+'</div> </div>';
              html += '<div class="sangp-2-5">价格：&nbsp;<samp class="samns">'+item.PRICEHASTAX+'</samp>元</div>';
              html += '<div class="sangp-2-5">创建时间：&nbsp;';
              html += '<samp class="samn">'+new Date(item.CREATETIME).Format("yyyy-MM-dd hh:mm:ss")+'</samp> </div> </div> </div>';
            });
            $('#content').html(html);
          }
        });
      });
    });
  </script>
</head>

<body>
<div class="zhongti">
  <!--头部-->
  <jsp:include page="../../navigation.jsp"></jsp:include>
  <!--搜索-->
  <form>
    <div class="shous">
      <div class="shous-1"><input type="text" value="" id="input"  placeholder="请输入品种/牌号/产地" style="width:100%; height:40px; font-size:14px; color:#666;" /></div>
      <div class="shous-2"><button id="button" type="button" class="xFast_form_btn" ><div class="shous-2-t"></div></button></div>
    </div>
  </form>

  <!--商品信息显示-->
  <div id="content">
  <c:forEach items="${sellList}" var="item">
  <div class="sangp">
    <div class="sangp-1"><samp style="font-size:14px; font-weight:bold; color:#4C9ED9;">${item.ROWNUM}</samp></div>
    <div class="sangp-2">
      <%--<div class="sangp-2-1">状&nbsp;态：&nbsp;<samp style=" font-size:14px; color:#EB6100; font-weight:bold;">${item.AFFIRMSTOCK}</samp></div>--%>
      <div class="sangp-2-4" >
        <div class="sangp-2-4-1">牌号：&nbsp;<samp class="samn">${item.MARK}</samp></div>
        <div class="sangp-2-4-2">产地：&nbsp;${item.PRODUCINGAREA}</div>
      </div>

      <div class="sangp-2-4" >
        <div class="sangp-2-4-1">
          <c:choose>
            <c:when test="${item.STOCKCODE=='002'}">上架：</c:when>
            <c:when test="${item.STOCKCODE=='003'}">下架：</c:when>
          </c:choose>
          初始：&nbsp;<samp class="samn">${item.INITNUM}</samp>${item.MEA}</div>
        <div class="sangp-2-4-2">确认：&nbsp;<samp class="samn">${item.AFFIRMNUM}</samp>${item.MEA}</div>
      </div>
      <div class="sangp-2-5">
        价格：&nbsp;<samp class="samns">${item.PRICEHASTAX}</samp>元/${item.MEA}
        &nbsp;&nbsp;&nbsp;品种：&nbsp;<samp class="samns">${item.GOODKIND}</samp>
      </div>
      <div class="sangp-2-5">创建时间：&nbsp;
        <samp class="samn"><fmt:formatDate value="${item.CREATETIME}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></samp>
      </div>
    </div>
  </div>
  </c:forEach>
  </div>
  <!--底线-->
  <div class="dx4"></div>
  <!--底部-->
  <jsp:include page="../../footer.jsp"></jsp:include>
</div>
</body>
</html>
