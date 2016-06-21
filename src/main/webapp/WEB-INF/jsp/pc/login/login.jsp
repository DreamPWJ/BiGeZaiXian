<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>比格在线 - 登录</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/login.css'/> " rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/font-awesome.css'/>" rel="stylesheet" type="text/css">
    <%-- 字体图表库--%>
</head>
<body>
<!--头部------------------------------------开始-->
<div class="top1">
    <div class="top2">
        <div class="top3">
            <div class="top3-1">您好，欢迎来到比格在线电商平台！</div>
            <div class="top3-2"><a href="<c:url value='/index/pcindex'/>">首页</a><a
                    href="<c:url value='/index/toregister'/>" class="top3-2-2">注册</a></div>
        </div>
        <div class="top4">
            <%--       <div class="top4-3">热线：400-827-3009</div>--%>
            <div class="top4-2"><a href="<c:url value='/index/toprotocol'/>">帮助中心</a></div>
        </div>
    </div>
</div>
<div class="top-bgcolor">
    <div class="logo_area">
        <h1 class="header-logo">
            <a href="<c:url value='/index/pcindex'/>"></a>
        </h1>

        <div class="loginhotline"></div>
    </div>
</div>

<!--头部------------------------------------结束-->

<!--主体------------------------------------开始-->
<div class="content">
    <div class="login-left">
        <h3><i class="fa fa-user"></i> 用户登录</h3>

        <div id="secret">
 <%--           <div id="secret-hand-left"></div>
            <div id="secret-head"></div>
            <div id="secret-hand-right"></div>--%>
        </div>
        <div class="portlet-body form">
            <!-- BEGIN FORM-->
            <form id="loginForm" action="<c:url value='/user/login?flag=1'/>"
                  class="form-horizontal" method="post">
                <div class="form-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <div class="col-xs-4 col-xs-offset-4">
                                    <i class="fa fa-user fa-2x"></i>
                                    <input id="loginname" name="userName"
                                           class="form-control placeholder-no-fix" autofocus
                                           autocomplete="on"
                                           placeholder="用户名"
                                           check-type=""/>
                                </div>
                            </div>
                        </div>
                        <!--/span-->
                        <div class="col-xs-12">
                            <div class="form-group">
                                <div class="col-xs-4 col-xs-offset-4">
                                    <i class="fa fa-unlock-alt fa-2x"></i>
                                    <input type="password" id="password" name="password"
                                           class="form-control placeholder-no-fix"
                                           autocomplete="off"
                                           placeholder="密码"
                                           check-type=""/>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="captcha"/>
                        <span id="t1">${msg_exist}</span>
                    </div>
                </div>

                <div class="col-xs-12">
                    <button id="btnLogin" type="submit"   <c:if test="${msg_exist!=null}"> rocking="true" </c:if>
                            class="btn btn-success">
                        登录
                    </button>
                </div>

            </form>
            <!-- END FORM-->
        </div>

    </div>

</div>
<c:if test="${success}">
    <div id="tiptool">恭喜您注册成功！</div>
</c:if>
<!--主体------------------------------------结束-->
<script src="<c:url value='/js/pc/A_public/jquery-1.11.1.min.js'/>" type="text/javascript"></script>
<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
<%--<jsp:include page="../A_public/foot.jsp" flush="true"/>--%><!--动态包含-->

</body>
</html>

<!--js文件-->
<script src="<c:url value='/js/pc/A_public/bootstrap.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/commonUtil.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/pc/login.js'/>" type="text/javascript"></script>
