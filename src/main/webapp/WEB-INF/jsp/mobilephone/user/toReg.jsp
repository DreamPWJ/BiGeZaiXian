<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap/css/bootstrap.css"/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>

  <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
  <%--<script type="text/javascript" src="<c:url value="/plugins/bootstrap/js/bootstrap.min.js"/>"></script>--%>
  <script type="text/javascript" src="<c:url value="/plugins/bootstrap3-validation.js"/>"></script>
  <%--<script type="text/javascript" name="baidu-tc-cerfication" src="http://apps.bdimg.com/cloudaapi/lightapp.js#fa1b660f8a42ec075fc6bc163f9890e9"></script>--%>
  <%--<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>--%>
</head>
<body>
<style>
  .form-horizontal .form-group {
    margin-right: -15px;
  }
</style>
<section class="wrap">
  <a name="top"></a>
  <jsp:include page="../navigation.jsp"></jsp:include>
  <!--content stop-->
  <form action="/BiGeZaiXian/user/reg?flag=2" role="form" method="post">
    <div style="width: 100%;height: 40px; margin-top: 10px">
      &nbsp;&nbsp;&nbsp; 我是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="radio" path="guestcode" name="guestcode" value="001" checked/>买家 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="radio" path="guestcode" name="guestcode" value="002"/>卖家
    </div>
    <div class="form-group">
      <label for="name" class="col-sm-2 control-label">用户名</label>
      <div class="col-sm-6">
        <input type="text" value="${frontUser.login}" class="form-control" id="name" path="login" name="login" check-type="required" required-message="请输入用户名">
        <span style="color: #FF0000;">${msg_userName}</span>
      </div>

    </div>

    <div class="form-group">
      <label for="password" class="col-sm-2 control-label">密码</label>
      <div class="col-sm-6">
        <input type="password" value="${frontUser.password}" class="form-control" id="password" path="password" name="password" check-type="required password" minlength="6" required-message="请输入密码">
      </div>
    </div>

    <div class="form-group">
      <label for="confirmPwd" class="col-sm-2 control-label">确认密码</label>
      <div class="col-sm-6">
        <input type="password" value="${frontUser.password}" class="form-control" id="confirmPwd" name="confirmPwd" check-type="required password" minlength="6" required-message="请确认密码">
      </div>
    </div>

    <div class="form-group">
      <label for="companyName" class="col-sm-2 control-label">公司名</label>
      <div class="col-sm-6">
        <input type="text" value="${frontUser.company}" class="form-control" id="companyName" path="company" name="company" check-type="required" range="2.2,5" required-message="请输入公司名">
      </div>
    </div>

    <div class="form-group">
      <label for="linkMan" class="col-sm-2 control-label">联系人</label>
      <div class="col-sm-6">
        <input type="text" value="${frontUser.name}" class="form-control" id="linkMan" path="name" name="name" check-type="required" range="2.2,5" required-message="请输入联系人姓名">
      </div>
    </div>

    <div class="form-group">
      <label for="linkTel" class="col-sm-2 control-label">联系电话</label>
      <div class="col-sm-6">
        <input type="text" value="${frontUser.mobphone}" class="form-control" id="linkTel" path="mobphone" name="mobphone" check-type="required phone" range="2.2,5" required-message="请填写手机号">
      </div>
    </div>

    <div class="form-group">
      <label for="email" class="col-sm-2 control-label">注册邮箱</label>
      <div class="col-sm-6">
        <input type="text" value="${frontUser.email}" class="form-control" id="email" path="email" name="email" check-type="required mail" range="2.2,5" required-message="请输入常用邮箱">
      </div>
    </div>

    <div class="form-group">
      <label for="address" class="col-sm-2 control-label">联系地址</label>
      <div class="col-sm-6">
        <input type="text" value="${frontUser.address}" class="form-control" id="address" path="address" name="address" check-type="required" range="2.2,5" required-message="请输入公司详细地址">
      </div>
    </div>

    <li>
      <label>
        <input class="login-checkbox" id="reg_checkbox" type="checkbox" checked/> 我已阅读并同意<a href="#" class="orange">《聚化网用户服务协议》</a></label>
    </li>

    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button id="reg" type="submit" class="btn btn-large btn-primary" style="width:100%">注册</button>
      </div>
    </div>

    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <span id="error-text" style="color: #FF0000;"></span>
      </div>
    </div>

  </form>
  <!--content end-->
  <!--footer stop-->
  <!--footer stop-->
  <footer class="footer">
    <section class="footer-bar">
      <a href="/BiGeZaiXian/user/toLogin">已有账号</a>
      <a href="/register/toLostPwd" class="ml10p">忘记密码</a>
      <a href="#top" class="fr">回到顶部</a>
    </section>
    <p class="copyright ffa">&copy; m.juhuawang.com</p>
    <div style="display: none;">
      <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252962129'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s19.cnzz.com/stat.php%3Fid%3D1252962129' type='text/javascript'%3E%3C/script%3E"));</script>
      <span id="cnzz_stat_icon_1252962129"><a href="http://www.cnzz.com/stat/website.php?web_id=1252962129" target="_blank" title="站长统计">站长统计</a></span>
      <script src=" http://s19.cnzz.com/stat.php?id=1252962129" type="text/javascript"></script>
      <script src="http://c.cnzz.com/core.php?web_id=1252962129&amp;t=z" charset="utf-8" type="text/javascript"></script>
    </div>
  </footer>
  <!--footer end-->
  <!--footer end-->
</section>
<script type="text/javascript">
  $(function() {
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
//    App.init();
    $("form").validation();



    // 确认密码
     $("#reg").click(function(){
       if($("#reg_checkbox").is(":checked")==false){
         alert("请勾选同意注册协议");
         return false;
       }

       // 检查两次密码输入是否一致
       var pwd = $("#password").val();
       var confirmPwd = $("#confirmPwd").val();
       if(pwd != confirmPwd){
         alert("两次密码输入不一致");
         return false;
       }
     });

    //表单提交验证
    $("button[type='submit']").on('click', function (event) {


      // 2.最后要调用 valid()方法。
      if ($("form").valid() == false) {
        return false;
      }
    });


  });
</script>
</body>
</html>
