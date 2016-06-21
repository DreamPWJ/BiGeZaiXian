<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/3 0003
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link href="<c:url value='/css/pc/include_login.css'/> " rel="stylesheet" type="text/css">
</head>
<body>

<div class="content_login" id="login">
    <%--<c:when test="${sessionScope.get('frontUser').guestcode!='002'&& sessionScope.get('companyID')!=0&&msg}"></c:when>--%>
    <div class="login-left">
      <h3> <i class="fa fa-user"></i>
        <c:choose>
          <c:when test="${msg_login==false}">用户登录</c:when>
          <c:otherwise>提示信息</c:otherwise>
        </c:choose>
      </h3>

      <div id="secret">
        <div id="secret-hand-left" style="transform: translate(0px, 0px) scale(1); transition: all 0s;"></div>
        <div id="secret-head"></div>
        <div id="secret-hand-right"></div>
        <div class="theme-poptit">
          <a href="javascript:;" title="关闭" class="close" id="close">×</a>
        </div>
      </div>
      <div class="portlet-body form">
        <c:choose>
        <c:when test="${msg_login==false}">
        <!-- BEGIN FORM-->
        <form id="loginForm" action="/BiGeZaiXian/user/login?flag=1" class="form-horizontal" method="post" novalidate="novalidate">
          <div class="form-body">
            <div class="row">
              <div class="col-xs-12">
                <div class="form-group has-success">
                  <div class="col-xs-4 col-xs-offset-4">
                    <i class="fa fa-user fa-2x"></i>
                    <input id="loginname" name="userName" class="form-control placeholder-no-fix" autofocus="" autocomplete="on" placeholder="用户名" check-type="">
                  </div><span class="help-block" id="valierr"></span>
                </div>
              </div>
              <!--/span-->
              <div class="col-xs-12">
                <div class="form-group">
                  <div class="col-xs-4 col-xs-offset-4">
                    <i class="fa fa-unlock-alt fa-2x"></i>
                    <input type="password" id="password" name="password" class="form-control placeholder-no-fix" autocomplete="off" placeholder="密码" check-type="">
                  </div>
                </div>
              </div>
              <div >
                <a>
                  <span style="color: #1CAAEB;padding: 5px 100px 5px 5px">忘记密码？</span>
                </a>
                <a href="/BiGeZaiXian/index/toregister">
                  <span style="color: #1CAAEB">立即注册</span>
                </a>
              </div>
              <input type="hidden" name="captcha">
              <span id="t1"></span>
            </div>
          </div>

          <div class="col-xs-12">
            <button id="btnLogin" type="submit" class="btn btn-success ">
              登录
            </button>
          </div>
        </form>
        <!-- END FORM-->
        </c:when>
          <c:otherwise>
            <c:if test="${msg_buyer==false}"><p style="font-size: 16px;color: #FF4111">请使用购买商账户进行购买</p></c:if>
            <c:if test="${msg_buyer==true && msg_upload==false}"><a style="font-size: 16px;color: #FF4111" href="<c:url value='/account/toattachment'/>">请上传三证</a></c:if>
            <c:if test="${msg_buyer==true && msg_upload!=false && msg_check==false}"><p style="font-size: 16px;color: #FF4111">请耐心等待审核通过</p></c:if>
          </c:otherwise>
          </c:choose>
      </div>
    </div>
</div>
</body>
</html>
