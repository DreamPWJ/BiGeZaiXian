<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../../top.jsp"></jsp:include>

  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <link href="<c:url value="/css/mobilephone/user/personalCenter.css"/>" rel="stylesheet" type="text/css" >
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
<div class="zhongti">
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
  <br>
  <!--账户信息-->
  <div style="margin-left: 22px;font-size: 14px;">
    <div>
      账户金额：100000元 &nbsp;&nbsp;&nbsp;
      <a class="blue">收支明细</a>
    </div>
    <div>
      <p>
        我的积分：122分 &nbsp;&nbsp;&nbsp;
        <a class="blue">赚取积分</a>|<a class="blue">积分使用记录</a>
      </p>
      <p>
        银行商户号：一个银行商户号 &nbsp;&nbsp;&nbsp; <a href="/BiGeZaiXian/user/toBankList" class="blue">添加</a>
      </p>
      <p>
        联系电话：15000000000
      </p>
      <p>注册邮箱：1000000000@qq.com</p>
      <p>
        专属客服：娜娜 &nbsp;&nbsp;&nbsp;
        <span>客服电话：0633-8888888</span>
      </p>
    </div>
  </div>
  <div class="jg"></div>
  <div class="jg"></div>
  <!--全部订单-->
  <div class="z1">
    <div class="z1-1">
      <div class="z1-1-1"><img src="<c:url value="/images/mobilephone/personalCenter/qbdd.jpg"/>" width="16" height="16" /></div>
      <a href="">全部订单</a>
    </div>
    <%--<div class="z1-2">
      <div class="z1-2-1"><a href="">查看所有订单</a></div>
      <div class="z1-2-2"></div>
    </div>--%>
  </div>

  <!--功能导航栏1-->
  <div class="gndh1">
    <a href="/BiGeZaiXian/order/toOrderNoPay">
      <div class="gndh1-1">
        <input type="hidden" value="${count_noPay}" id="count_noPay">
        <!--图标右上角的红色数字-->
        <div class="gndh1-1-0" id="content_noPay">
          <samp style="font-size:11px;color:#FF0000;">${count_noPay}</samp>
        </div>
        <div class="gndh1-1-1"></div>
        <div class="gndh1-1-2">待支付</div>
      </div>
    </a>
    <a href="/BiGeZaiXian/user/toListTakeBySelf">
      <div class="gndh1-2">
        <input type="hidden" value="${count_noTakeGood}" id="count_noTakeGood">
        <!--图标右上角的红色数字-->
        <div class="gndh1-1-0" id="content_noTakeGood">
          <samp style="font-size:11px;color:#FF0000;">${count_noTakeGood}</samp>
        </div>
        <div class="gndh1-2-1"></div>
        <div class="gndh1-2-2">待提货</div>
      </div>
    </a>
    <a href="/BiGeZaiXian/user/noGoodsReceipt">
      <div class="gndh1-3">
        <input type="hidden" value="${count_sentGood}" id="count_sentGood">
        <!--图标右上角的红色数字-->
        <div class="gndh1-1-0" id="content_sentGood">
          <samp style="font-size:11px;color:#FF0000;">${count_sentGood}</samp>
        </div>
        <div class="gndh1-3-1"></div>
        <div class="gndh1-3-2">待收货</div>
      </div>
    </a>
    <a href="/BiGeZaiXian/user/noEvaluation">
      <div class="gndh1-4">
        <input type="hidden" value="${count_noEvaluate}" id="count_noEvaluate">
        <!--图标右上角的红色数字-->
        <div class="gndh1-1-0" id="content_noEvaluate">
          <samp style="font-size:11px;color:#FF0000;">${count_noEvaluate}</samp>
        </div>
        <div class="gndh1-4-1"></div>
        <div class="gndh1-4-2">待评价</div>
      </div>
    </a>
    <a href="/BiGeZaiXian/user/toAfterSale">
      <div class="gndh1-5">
        <!--图标右上角的红色数字-->
        <div class="">
          <samp style="font-size:11px;color:#FF0000;"></samp>
        </div>
        <div class="gndh1-5-1"></div>
        <div class="gndh1-5-2">售后</div>
      </div>
    </a>
  </div>

  <!--间隔条-->
  <div class="jg"></div>

  <!--账号管理-->
  <div class="zhgl">
    <div class="z1-1">
      <div class="z1-1-1"><img src="<c:url value="/images/mobilephone/personalCenter/zhgl.jpg"/>" width="16" height="16" /></div>
      <a href="">账号管理</a>
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
    <a href="/BiGeZaiXian/user/toEditAddress">
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

  $(function(){
    var count_noPay = $("#count_noPay").val();
    if(count_noPay == 0){
      $("#content_noPay").removeAttr("class");
      $("#content_noPay").html("");
    }
    var count_noTakeGood = $("#count_noTakeGood").val();
    if(count_noTakeGood == 0){
      $("#content_noTakeGood").removeAttr("class");
      $("#content_noTakeGood").html("");
    }


    var count_sentGood = $("#count_sentGood").val();
    if(count_sentGood == 0){
      $("#content_sentGood").removeAttr("class");
      $("#content_sentGood").html("");
    }
    var count_noEvaluate = $("#count_noEvaluate").val();
    if(count_noEvaluate == 0){
      $("#content_noEvaluate").removeAttr("class");
      $("#content_noEvaluate").html("");
    }
  });
</script>
</body>
</html>
