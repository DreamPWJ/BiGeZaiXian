<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>

  <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/js/commonUtil.js"/>"></script>
  <link href="<c:url value="/css/mobilephone/seller/inventoryCenter.css"/>" rel="stylesheet" type="text/css" >
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

      // 搜索
      $("#searchButton").click(function(){
        var input = $("#input").val();
        var url = "/BiGeZaiXian/good/getAjaxStockCenter?condition="+input;
        $.ajax({
          type: "GET",
          url: url,
          dataType: "json",
          success: function(data){
            $("#content").html("");// 清空内容
            var html = '';
            $.each(data, function(i, item){
              html += '<div class="sangp">';
              html += '<div class="sangp-1"><samp style="font-size:16px; font-weight:bold; color:#4C9ED9;">'+item.ROWNUM+'</samp></div>';
              html += '<div class="sangp-2">';
              html += '<div class="sangp-2-1">状&nbsp;态：&nbsp;<samp style=" font-size:16px; color:#EB6100; font-weight:bold;">'+item.AFFIRMSTOCK+'</samp></div>';
              html += '<div class="sangp-2-2">';
              html += '品&nbsp;种：<samp style=" font-size:16px; color:#333; ">'+item.GOODKIND+'</samp>';
              html += '&nbsp;&nbsp;&nbsp;牌&nbsp;号：&nbsp;<samp style=" font-size:16px; color:#333; ">'+item.MARK+'</samp></div>';
              html += '<div class="sangp-2-3">';
              html += '产&nbsp;地：&nbsp;<samp style=" font-size:16px; color:#333; ">sfddsadf</samp>';
              html += '&nbsp;&nbsp;&nbsp;仓&nbsp;库：&nbsp;<samp style=" font-size:16px; color:#333; ">'+item.STORAGENAME+'</samp></div>';
              html += '<div class="sangp-2-4">';
              html += '<div class="sangp-2-4-1" style="font-size: 16px">入库&nbsp;：<samp class="samn" style="font-size: 16px">'+item.INITNUM+'</samp>'+item.MEA+'</div>';
              html += '<div class="sangp-2-4-2" style="font-size: 16px">确认&nbsp;：<samp class="samn" style="font-size: 16px">'+item.AFFIRMNUM+'</samp>'+item.MEA+'</div></div>';
              html += '<div class="sangp-2-5">入库时间&nbsp;：<samp class="samn">'+new Date(item.CREATETIME).Format("yyyy-MM-dd hh:mm:ss")+'</samp></div>';
              html += '</div> </div>';
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
  <!--头部隐藏菜单栏-->

  <!--搜索-->
  <form>
    <div class="shous">
      <div class="shous-1">
        <input type="text" value="" id="input"  placeholder="请输入品种/牌号/产地" style="width:100%; height:40px; font-size:16px; color:#666;" />
      </div>
      <div class="shous-2">
        <button type="button" class="xFast_form_btn" id="searchButton"><div class="shous-2-t"></div></button>
      </div>
    </div>
  </form>

  <!--库存中心信息显示-->
  <div id="content">
  <c:forEach items="${stockInList}" var="item">
  <div class="sangp">
    <div class="sangp-1"><samp style="font-size:16px; font-weight:bold; color:#4C9ED9;">${item.ROWNUM}</samp></div>
    <div class="sangp-2">
      <div class="sangp-2-1">状&nbsp;态：&nbsp;<samp style=" font-size:16px; color:#EB6100; font-weight:bold;">${item.AFFIRMSTOCK}</samp></div>
      <div class="sangp-2-2">
        品&nbsp;种：<samp style=" font-size:16px; color:#333; ">${item.GOODKIND}</samp>
        &nbsp;&nbsp;&nbsp;牌&nbsp;号：&nbsp;<samp style=" font-size:16px; color:#333; ">${item.MARK}</samp>
      </div>
      <div class="sangp-2-3">
        产&nbsp;地：&nbsp;<samp style=" font-size:16px; color:#333; ">${item.PRODUCINGAREA}</samp>
        &nbsp;&nbsp;&nbsp;仓&nbsp;库：&nbsp;<samp style=" font-size:16px; color:#333; ">${item.STORAGENAME}</samp>
      </div>
      <div class="sangp-2-4" >
        <div class="sangp-2-4-1" style="font-size: 16px">入库&nbsp;：<samp class="samn" style="font-size: 16px">${item.INITNUM}</samp>${item.MEA}</div>
        <div class="sangp-2-4-2" style="font-size: 16px">确认&nbsp;：<samp class="samn" style="font-size: 16px">${item.AFFIRMNUM}</samp>${item.MEA}</div>
        <%--<div class="sangp-2-4-3">在售&nbsp;：<samp class="samn">40.00</samp>吨</div>--%>
      </div>
      <div class="sangp-2-5">入库时间&nbsp;：
        <samp class="samn"><fmt:formatDate value="${item.CREATETIME}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></samp>
      </div>
      <%--<div class="sangp-2-5">仓库&nbsp;：<samp class="samn">${item.STORAGENAME}</samp></div>--%>
    </div>
  </div>
  </c:forEach>
  </div>
  <!--底线-->
  <div class="dx4"></div>

  <!--添加库存-->
  <%--<div class="tjkc">
    <div class="tjkc-1"><a href="#">添&nbsp;加&nbsp;库&nbsp;存</a></div>
  </div>--%>

  <!--底部-->
  <jsp:include page="../../footer.jsp"></jsp:include>
</div>
</body>
</html>

