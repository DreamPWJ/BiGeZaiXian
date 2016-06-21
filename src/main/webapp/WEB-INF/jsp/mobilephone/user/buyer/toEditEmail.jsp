<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
  <link href="<c:url value="/css/mobilephone/user/modifyEmail.css"/>" rel="stylesheet" type="text/css" >
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

  <form>
    <!--注册邮箱-->
    <div class="sjhm">
      <div class="sjhm-l">注册邮箱：</div>
      <div class="sjhm-r"><samp class="cl">*******@163.com</samp></div>
    </div>

    <!--验证码-->
    <div class="yzm">
      <div class="yzm-l">验证码：</div>
      <div class="yzm-c"><input type="text" value="" id="" class="text1"  placeholder="请输入验证码" style="width:100%; height:32px;" /></div>
      <div class="yzm-r">
        <div class="yzm-r-1">
          <button type="submit" class="tjkc-1" ><a href="#">获取验证码</a></button>
        </div>
      </div>
    </div>

    <!--新邮箱-->
    <div class="xsjhm">
      <div class="xsjhm-l">新邮箱：</div>
      <div class="xsjhm-r"><input type="text" value="" id="" class="text2"  placeholder="输入新邮箱"  /></div>
    </div>
    <!--底线-->
    <div class="dx6"></div>
    <!--保存-->
    <div class="tjkc">
      <div style="width:100px; height:40px; line-height:40px; margin:0 auto;">
        <!--<div class="tjkc-1"><a href="#">保&nbsp;存</a></div>-->
        <button type="submit" class="tjkc-2" ><a href="#">保&nbsp;存</a></button>
      </div>
    </div>
  </form>

  <!--底部-->
  <jsp:include page="../../footer.jsp"></jsp:include>
</div>
</body>
</html>

