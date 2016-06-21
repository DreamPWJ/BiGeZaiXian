<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
  <link href="<c:url value="/css/mobilephone/seller/sellerCenter.css"/>" rel="stylesheet" type="text/css" >

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
<div class="zhongti">
  <!--头部-->
  <jsp:include page="../../navigation.jsp"></jsp:include>
  <!--头部隐藏菜单栏-->
  <div class="top-dh" id="n1" style="display:none;">
    <!--底线-->
    <div class="dx"></div>
  </div>

  <!--头像导航条-->
  <div class="v3">
    <div class="v3-1">
      <div class="v3-2"><img src="<c:url value="/images/mobilephone/personalCenter/yuan.png"/>" width="90" height="90" /></div><!--上传头像格式90*90-->
    </div>
    <div class="v4"><a href="#">${user.login}</a></div>
  </div>

  <!--全部订单-->
  <div class="z1">
    <div class="z1-1">
      <div class="z1-1-1"><img src="<c:url value="/images/mobilephone/personalCenter/qbdd.jpg"/>" width="16" height="16" /></div>
      商品管理
    </div>
    <div class="z1-2">
      <!--	<div class="z1-2-1"><a href="">查看所有订单</a></div>-->
      <div class="z1-2-2"></div>
    </div>
  </div>

  <!--功能导航栏1-->
  <div class="gndh1">
    <a href="/BiGeZaiXian/user/toReleaseGood" id="a_releaseGood">
    <div class="gndh1-1" id="div_releaseGood">
      <input type="hidden" value="${msg_affirmReg}" id="releaseGood">
      <div class="gndh1-1-1"></div>
      <div class="gndh1-1-2">发布商品</div>
    </div>
    </a>
    <a href="/BiGeZaiXian/order/toSellerOrderCenter">
      <div class="gndh1-2" >
        <%--<div class="gndh1-1-0" ><samp style="font-size:11px;color:#FF0000;">1</samp></div>     <!--图标右上角的红色数字-->--%>
        <div class="gndh1-2-1"></div>
        <div class="gndh1-2-2">订单中心</div>
      </div>
    </a>
    <a href="/BiGeZaiXian/good/toMyGoods">
      <div class="gndh1-3">
        <%--<div class="gndh1-1-0" ><samp style="font-size:11px;color:#FF0000;">1</samp></div>     <!--图标右上角的红色数字-->--%>
        <div class="gndh1-3-1"></div>
        <div class="gndh1-3-2">我的商品</div>
      </div>
    </a>
    <a href="/BiGeZaiXian/good/toStockCenter">
      <div class="gndh1-4">
        <%--<div class="gndh1-1-0" ><samp style="font-size:11px;color:#FF0000;">1</samp></div>     <!--图标右上角的红色数字-->--%>
        <div class="gndh1-4-1"></div>
        <div class="gndh1-4-2">库存中心</div>
      </div>
    </a>
    <a href="/BiGeZaiXian/good/toOnSaleGoods">
    <div class="gndh1-5">
      <%--<div class="gndh1-1-0" ><samp style="font-size:11px;color:#FF0000;">4</samp></div>     <!--图标右上角的红色数字-->--%>
      <div class="gndh1-5-1"></div>
      <div class="gndh1-5-2">在售商品</div>
    </div>
    </a>
  </div>

  <!--间隔条-->
  <div class="jg"></div>

  <!--账号管理-->
  <div class="zhgl">
    <div class="z1-1">
      <div class="z1-1-1"><img src="<c:url value="/images/mobilephone/personalCenter/zhgl.jpg"/>" width="16" height="16" /></div>
      账号管理
    </div>
    <div class="jt"></div>
  </div>

  <!--功能导航栏2-->
  <div class="gndh2">
    <a href="/BiGeZaiXian/user/toEditPwd">
    <div class="gndh2-1">
      <div class="gndh2-1-1"></div>
      <div class="gndh2-1-2">修改密码</div>
    </div>
    </a>
    <a href="#">
    <div class="gndh2-2" >
      <div class="gndh2-2-1"></div>
      <div class="gndh2-2-2">修改地址</div>
    </div>
    </a>
    <a href="/BiGeZaiXian/user/toEditPhone">
    <div class="gndh2-3">
      <div class="gndh2-3-1"></div>
      <div class="gndh2-3-2">修改手机</div>
    </div>
    </a>
    <a href="/BiGeZaiXian/user/toEditEmail">
    <div class="gndh2-4">
      <div class="gndh2-4-1"></div>
      <div class="gndh2-4-2">修改邮箱</div>
    </div>
    </a>
    <a href="#">
    <div class="gndh2-5" id="upload">
      <div class="gndh2-5-1"></div>
      <div class="gndh2-5-2">上传认证</div>
    </div>
    </a>
  </div>

  <!--底部-->
<jsp:include page="../../footer.jsp"></jsp:include>
</div>
<script>
  $("#upload").click(function(){
    alert("该功能暂未开放，敬请期待...");
  });



    $("#div_releaseGood").click(function(){
      var releaseGood = $("#releaseGood").val().length;
      if(releaseGood > 0){
        $("#a_releaseGood").attr("href","#");
        alert("尚未认证通过，暂时不能发布商品");
      }

    });

</script>
</body>
</html>


