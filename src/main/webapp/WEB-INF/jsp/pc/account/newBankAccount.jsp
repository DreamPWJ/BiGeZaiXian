<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN"><head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
  <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
  <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css"/>
  <link href="<c:url value='/css/pc/account/newBankAccount.css'/>" rel="stylesheet" type="text/css">
  <title>个人中心-账号管理-银行账号</title>

</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<!-- content ----------- 开始 -->
<div class="content">
  <!--地址-->


  <!--左边导航-->
  <%@ include file="../A_public/accountSideMenu.jsp" %><!--左边导航-->

  <!--右侧展示-->
  <div class="R-show">
    <div class="R-BT">
      <div class="R-BT-1">添加银行账号</div>
      <div class="R-BT-2">
        <div class="R-BT-2-1"><a href="<c:url value='/account/tobankAccount'/>">返回账号管理</a></div>
      </div>
    </div>

    <!--总-->
    <div class="ZONG" >
      <div class="Jbzl-1">山东资润化工有限公司</div>

      <div class="Tjzh-1">
        <div class="Tjzh-1-1">银行账号：</div>
        <input type="text" placeholder="" class="Tjzh-1-2" />
      </div>
      <div class="Tjzh-1">
        <div class="Tjzh-1-1">开户银行：</div>
        <select name="select" id="select_k1"  class="Tjzh-1-3">
          <option value="日照银行">日照银行</option>
          <option value="交通银行">交通银行</option>
          <option value="华夏银行">华夏银行</option>
        </select>
      </div>
      <div class="Tjzh-1">
        <div class="Tjzh-1-1">详细网点：</div>
        <input type="text" placeholder="" class="Tjzh-1-2" />
      </div>

      <div class="Qdin">
        <button type="button" class="Qdin-2">确定</button>
      </div>
    </div>
  </div><!--右侧展示-->

</div>
<!-- content ----------- 结束 -->
<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>

</body>
</html>
