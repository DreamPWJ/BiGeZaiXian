<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap/css/bootstrap.css"/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>

  <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/plugins/bootstrap3-validation.js"/>"></script>
</head>
<body>
<section class="wrap">
  <a name="top"></a>
  <jsp:include page="../navigation.jsp"></jsp:include>
  <!--header stop-->
  <br>
  <form action="/BiGeZaiXian/user/login?flag=2" role="form" method="post">
    <div class="form-group">
      <label for="name" class="col-sm-2 control-label">用户名</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="name" name="userName" value="${userName}" check-type="required" required-message="请输入用户名">
      </div>
    </div>

    <div class="form-group">
      <label for="password" class="col-sm-2 control-label">密码</label>
      <div class="col-sm-6">
        <input type="password" class="form-control" id="password" name="password" value="${password}" check-type="required password" minlength="6" required-message="请输入密码">
      </div>
    </div>

    <div class="form-group">
      <div class="col-sm-6" >
        <input class="form-control" check-type="required" type="text" name="captcha" value="" placeholder="输入验证码" id="captcha" />
        <span style="color: #FF0000;">${msg_captcha}</span>
      </div>
      <div class="col-sm-6" >
          <img src="/BiGeZaiXian/user/getCode" id="kaptchaImage" />
      </div>
    </div>

    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button id="reg" type="submit" class="btn btn-large btn-primary" style="width:100%">用户登录</button>
      </div>
    </div>

    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <span id="error-text" style="color: #FF0000;">
          ${msg_exist}
        </span>
      </div>
    </div>

  </form>
  <!--content end-->
  <script type="text/javascript">

    var errInfo = {
      '-1': '操作过于频繁，请稍后再试',
      '-4': '用户名不能为空',
      '-5': '密码不能为空',
      '-6': 'Email或手机号输入错误',
      '-7': '用户名或密码不正确!',
      '-8': '验证码不能为空或者不正确！',
      '-9':'用户类型错误'
    };

    function change_code(){
      var img = document.getElementById('login_code_img');
      img.src = '/BiGeZaiXian/user/toLogin/' + Math.random();
//      img.src = '/BiGeZaiXian/user/toLogin';
    };

    $(function(){
      $('#kaptchaImage').click(function () {//生成验证码
        $(this).hide().attr('src', '/BiGeZaiXian/user/getCode?' + Math.floor(Math.random()*100) ).fadeIn();
      })
    });

    $(function(){
      $("form").validation();
      //表单提交验证
      $("button[type='submit']").on('click', function (event) {
        // 2.最后要调用 valid()方法。
        if ($("form").valid() == false) {
          return false;
        }
      });

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
  <!--footer stop-->
  <footer class="footer">
    <section class="footer-bar">
      <a href="/BiGeZaiXian/user/toReg">注册</a>
      <a href="#" class="ml10p">忘记密码</a>
      <%--<a href="#top" class="fr">回到顶部</a>--%>
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
</section>
</body>
</html>
