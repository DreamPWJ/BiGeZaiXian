<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>找回密码
    </title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/findPassword.css'/>" rel="stylesheet" type="text/css">


</head>

<body>
<!--头部------------------------------------开始-->
<div class="top1">
    <div class="top2">
        <div class="top3">
            <div class="top3-1">您好，欢迎来到聚化网电商平台！</div>
            <div class="top3-2"><a href="<c:url value='/index/pcindex'/>">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                    href="<c:url value='/index/toregister'/>" style=" color:#FF8000;">注册</a></div>
        </div>
        <div class="top4">
            <div class="top4-3">热线：400-827-3009</div>
            <div class="top4-2"><a href="<c:url value='/index/toprotocol'/>">帮助中心</a></div>
            <div class="top4-1"><a href="#">在线客户</a></div>
        </div>
    </div>
</div>
<div class="top-bgcolor">
    <div class="logo_area">
        <h1 class="header-logo">
            <a href="#">聚化网-货到付款，送给你用！</a>
        </h1>

        <div class="loginhotline"></div>
    </div>
</div>

<!--头部------------------------------------结束-->

<!--主体------------------------------------开始-->
<div class="content">
    <div class="login-left">
        <h3>找回密码</h3>
        <div class="portlet-body form">
            <!-- BEGIN FORM-->
            <form id="loginForm" action="<c:url value=''/>"
                  class="form-horizontal" method="post">

                <div class="form-body">
                    <div class="row">

                        <div class="col-xs-12">
                            <div class="form-group">
                                <div class="col-xs-6 col-xs-offset-3">

                                    <input id="loginname" name="userName"
                                           class="form-control placeholder-no-fix"
                                           autocomplete="on"
                                           placeholder="用户名"
                                           check-type=""/>
                                </div>

                            </div>
                        </div>
                        <!--/span-->
                        <div class="col-xs-12">
                            <div class="form-group">
                                <div class="col-xs-6 col-xs-offset-3">

                                    <input type="password" id="password" name="password"
                                           class="form-control placeholder-no-fix"
                                           autocomplete="on"
                                           placeholder="绑定邮箱"
                                           check-type=""/>


                                </div>

                            </div>
                        </div>


                    </div>

                </div>


                <div class="col-xs-12 col-xs-offset-5">
                    <button id="btnLogin" type="submit"
                            class="btn btn-success ">
                        找回密码
                    </button>
                </div>

            </form>
            <!-- END FORM-->
        </div>

    </div>
    <div class="login-right">
        <h3>
            <p>还没有账号，立即<a href="<c:url value='/index/toregister'/>">注册</a></p>
        </h3>
        <ul class="infotext">
            <li>
                <i class="ico1"></i>
                    <span>
                        <h4>金融服务</h4>
                        <p>提升资金，高效服务</p>
                    </span>
            </li>

            <li>
                <i class="ico2"></i>
                    <span>
                        <h4>其他服务</h4>
                        <p>我们的服务，值得信任</p>
                    </span>
            </li>
        </ul>
    </div>
</div>
<!--主体------------------------------------结束-->
<script src="<c:url value='/js/pc/A_public/jquery-1.11.1.min.js'/>" type="text/javascript"></script>
<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>

<!--js文件-->
<script src="<c:url value='/js/pc/A_public/bootstrap.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/commonUtil.js'/> " type="text/javascript"></script>
