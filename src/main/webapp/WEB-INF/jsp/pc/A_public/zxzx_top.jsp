<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../../css/A_public/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../../css/A_public/zxzx_top.css" rel="stylesheet" type="text/css"/>
    <script src="../../js/A_public/bootstrap.min.js" type="text/javascript"></script>

</head>

<body>
<!--头部------------------------------------开始-->
<div class="zxzx-top">
    <!-- top -->
    <nav class="navbar navbar-default navbar-fixed-top xtop" role="navigation">
        <div class="xcn row">
            <form class="navbar-form xtop_form" role="search">
                <div class="form-group xtop_form_group">
                    <button type="button" onclick="window.open('../index.html')"
                            class="navbar-left navbar-btn btn btn-default xtop_btn">返回首页
                    </button>
                    <div class="navbar-left xtop_tele_img"></div>
                    <div class="navbar-left navbar-text xtop_tele_text">400-827-3009</div>
                </div>
                <div class="form-group navbar-text navbar-right xtop_form_group" style="height:40px; line-height:40px;">
                    <a href="../bstage/login.aspx" class="navbar-link xtop_link">登录</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="../bstage/register.aspx" class="navbar-link xtop_link">注册</a>
                </div>
            </form>
        </div>
    </nav>
    <!-- head   -->
    <nav class="navbar navbar-default xhead" role="navigation">
        <form class="navbar-form xhead_form">
            <div class="form-group navbar-left">
                <!--logo链接-->
                <a href="../" target="_parent">
                    <div class="xhead_logo"></div>
                </a>
            </div>
            <div class="input-group navbar-right">
                <input type="text" class="form-control xhead_form_search" placeholder="搜索">
                <span class="input-group-btn">
                  <button type="button" class="btn btn-danger xhead_form_search_btn" id="dd">搜索</button>
                </span>
            </div>
        </form>
    </nav>
    <!-- nav   -->
    <nav class="navbar navbar-default xnav" role="navigation">
        <div class="navbar-left xnav_left"></div>
        <div class="navbar-left xnav_middle">
            <ul class="nav nav-pills xnav_middle_pill">
                <li><a href="#" target="_parent">行业</a></li>
                <li><a href="../zxzx_market.html" target="_parent">行情</a></li>
                <!--                 <li class="active"><a href="../zxzx_market.jsp" target="_parent">行情</a></li>-->
                <li><a href="#" target="_parent">聚化发布</a></li>
                <li><a target="_parent">咨询服务</a></li>
            </ul>

        </div>
        <div class="navbar-left xnav_right"></div>
    </nav>
</div>
<!--头部------------------------------------结束-->
</body>
</html>
