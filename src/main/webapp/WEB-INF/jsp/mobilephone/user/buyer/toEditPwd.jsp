<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/26 0026
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap/css/bootstrap.css"/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
  <link href="<c:url value="/css/mobilephone/user/replacePassword.css"/>" rel="stylesheet" type="text/css" >
  <script type="text/javascript" src="<c:url value="/plugins/bootstrap3-validation.js"/>"></script>
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
      $("form").validation();
      //表单提交验证
      $("button[type='submit']").on('click', function (event) {
        // 2.最后要调用 valid()方法。
        if ($("form").valid() == false) {
          return false;
        }
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
  <form action="/BiGeZaiXian/user/editPwd" method="post">
    <div class="mima1">
    <div class="form-group">
      <label for="oldPwd" class="col-sm-2 control-label">旧密码</label>
      <div class="col-sm-6">
        <input type="password" value="${oldPwd}" class="form-control" id="oldPwd" name="oldPwd" check-type="required password" minlength="6" required-message="请输入密码">
      </div>
        <span style="color: #990000;font-size: large;margin-left: 20px">
          ${msg_oldPwd}
        </span>
    </div>
      <div class="form-group">
        <label for="newPwd" class="col-sm-2 control-label">新密码</label>
        <div class="col-sm-6">
          <input type="password" value="${newPwd}" class="form-control" id="newPwd" name="newPwd" check-type="required password" minlength="6" required-message="请输入密码">
        </div>
      </div>
      <div class="form-group">
        <label for="confirmPwd" class="col-sm-2 control-label">确认新密码</label>
        <div class="col-sm-6">
          <input type="password" value="${confirmPwd}" class="form-control" id="confirmPwd" name="confirmPwd" check-type="required password" minlength="6" required-message="请输入密码">
        </div>
      </div>

    <!--保存-->
    <div class="tjkc">
      <div style="width:140px; height:40px; line-height:40px; margin:0 auto;">
        <!--<div class="tjkc-1"><a href="#">保&nbsp;&nbsp;&nbsp;&nbsp;存</a></div>-->
        <button type="submit" class="btn btn-large btn-primary" id="submit">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
      </div>
    </div>
  </form>
  <span style="color: #990000;font-size: large;margin-left: 20px">
    ${msg_pwd}
  </span>

  <!--底线-->
  <%--<div class="dx5"></div>--%>
  <!--底部-->
  <jsp:include page="../../footer.jsp"></jsp:include>
</div>
<script>
  $("#submit").click(function(){
    var newPwd = $("#newPwd").val();
    var confirmPwd = $("#confirmPwd").val();
    if(newPwd != confirmPwd){
      alert("两次密码输入不一致");
      return false;
    }
  });
</script>
</body>
</html>


