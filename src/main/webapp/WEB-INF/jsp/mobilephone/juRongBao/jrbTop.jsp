<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script type="text/javascript">
  $(function(){
    // 简介
    if(${type == 1}){$("#intro").addClass("logo1-1-1");}
    // 申请
    if(${type == 2}){$("#apply").addClass("logo1-1-1");}
    // 我的聚融宝
    if(${type == 3}){$("#myjrb").addClass("logo1-2-1");}
    // 还贷
    if(${type == 4}){$("#repay").addClass("logo1-1-1");}
  });
</script>
<body>
<div class="top-logo">
  <div class="logo">
    <div class="logo-1"></div>
    <div class="logo-2">
      上聚化网<br>
      不花钱买全球塑料粒子
    </div>
  </div>
  <div class="logo1">
    <div class="logo1-1">
      <div id="intro">
        <a href="/BiGeZaiXian/jurongbao/toJuRongBao">简介</a>
      </div>
    </div>
    <div class="logo1-1">
      <div id="apply">
        <%--申请--%>
        <a href="/BiGeZaiXian/jurongbao/toJrbApplyMain">申请</a>
      </div>
    </div>
    <div class="logo1-2">
      <div id="myjrb">
        <a href="/BiGeZaiXian/jurongbao/toMyJurongbao">我的聚融宝</a>
      </div>
    </div>
    <div class="logo1-1">
      <div id="repay">
        <a href="/BiGeZaiXian/jurongbao/toRepayment">还贷</a>
      </div>
    </div>
  </div>
</div>
</body>

</html>
