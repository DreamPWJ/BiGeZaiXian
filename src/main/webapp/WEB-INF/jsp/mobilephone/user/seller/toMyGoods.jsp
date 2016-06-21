<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>

  <link href="<c:url value="/css/mobilephone/seller/myGoods.css"/>" rel="stylesheet" type="text/css" >

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
      $("#submit").click(function(){
        // 获取文本框中的值
        var mark = $("#mark").val();
        $.ajax({
          type: "GET",
          url: "/BiGeZaiXian/good/getAjaxMyGoods?mark="+mark,
          dataType: "json",
          success: function(data){
            $("#myGoods").html("");// 清空内容
            var html = '';
            $.each(data, function(i, item){
              html += '<div class="sangp">';
              html += '<div class="sangp-1"><samp>1</samp>.</div>';
              html +='<div class="sangp-2"> <div class="gp-2-1">';
              html += '<samp style="font-size:14px;color:#009FE8;">'+item.GOODKIND+'/'+item.MARK+'</samp>';
              html += '</div> <div class="gp-2-1">';
              html += '<div class="gp-2-1-1">生产商：<samp class="sa1">'+item.PRODUCER+'</samp></div>';
              html += '<div class="gp-2-1-1"> 产地：<samp class="sa1">'+item.PRODUCINGAREA+'</samp></div>';
              html += '</div> <div class="gp-2-1">';
              html += '<div class="gp-2-1-1">入库：<samp class="sa1">'+item.STOCKIN+'</samp>'+item.MEA+'</div>';
              html +='<div class="gp-2-1-1">确认：<samp class="sa1">'+item.AFFIRM+'</samp>'+item.MEA+'</div>';
              html +='</div> <div class="gp-2-1">';
              html += '<div class="gp-2-1-1">在售：<samp class="sa1">'+item.ONSELL+'</samp>'+item.MEA+'</div>';
              html += '<div class="gp-2-1-1">售出：<samp class="sa1">'+item.SELLOUT+'</samp>'+item.MEA+'</div>';
              html +='</div> <div class="gp-2-1">';
              html += '<div class="gp-2-1-1">库存：<samp class="sa1">'+item.STOCK+'</samp>'+item.MEA+'</div>';
              html +='<div class="gp-2-1-1">其他支出：<samp class="sa1">'+item.OTHER+'</samp>'+item.MEA+'</div>';
              html +='</div> </div> <div class="sangp-3">';
              html += '<div class="gp-3-1"><a href="/BiGeZaiXian/good/toMyGoodDetail?companyId='+item.COMPANYID+'&goodId='+item.GOODID+'">商品明细</a></div>';
              html +='</div> </div>';
            });
            $('#myGoods').html(html);
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
  <%--<form action="">--%>
    <div class="shous">
      <div class="shous-1">
        <input type="text" value="" id="mark"  placeholder="请输入品种/牌号" style="width:100%; height:36px; font-size:14px; color:#666;" />
      </div>
      <div class="shous-2">
        <button type="button" class="xFast_form_btn" id="submit"><div class="shous-2-t"></div></button>
      </div>
    </div>
  <%--</form>--%>

  <div id="myGoods">
<c:forEach items="${goods}" var="item">
  <!--商品 1-->
  <div class="sangp">
    <div class="sangp-1"><samp>${item.ROWNUM}</samp>.</div>

    <div class="sangp-2">
      <div class="gp-2-1">
        <samp style="font-size:14px; font-family:'微软雅黑'; color:#009FE8;">${item.GOODKIND}/${item.MARK}</samp>
      </div>
      <div class="gp-2-1">
        <div class="gp-2-1-1">生产商：<samp class="sa1">${item.PRODUCER}</samp></div>
        <div class="gp-2-1-1"> 产地：<samp class="sa1">${item.PRODUCINGAREA}</samp></div>
      </div>
      <div class="gp-2-1">
        <div class="gp-2-1-1">入库：<samp class="sa1">${item.STOCKIN}</samp>${item.MEA}</div>
        <div class="gp-2-1-1">确认：<samp class="sa1">${item.AFFIRM}</samp>${item.MEA}</div>
      </div>
      <div class="gp-2-1">
        <div class="gp-2-1-1">在售：<samp class="sa1">${item.ONSELL}</samp>${item.MEA}</div>
        <div class="gp-2-1-1">售出：<samp class="sa1">${item.SELLOUT}</samp>${item.MEA}</div>
      </div>
      <div class="gp-2-1">
        <div class="gp-2-1-1">库存：<samp class="sa1">${item.STOCK}</samp>${item.MEA}</div>
        <div class="gp-2-1-1">其他支出：<samp class="sa1">${item.OTHER}</samp>${item.MEA}</div>
      </div>
    </div>
    <div class="sangp-3">
      <div class="gp-3-1"><a href="/BiGeZaiXian/good/toMyGoodDetail?companyId=${item.COMPANYID}&goodId=${item.GOODID}">商品明细</a></div>
      <%--<div class="gp-3-2"><a href="#">添加库存</a></div>--%>
    </div>
  </div>
</c:forEach>
  </div>

  <!--底线2-->
  <div class="dix2"></div>

  <!--底部-->
  <jsp:include page="../../footer.jsp"></jsp:include>
</div>
</body>

</html>


