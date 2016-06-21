<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/13 0013
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
</head>
<body>
<header class="header-wrap">
  <a href="javascript:history.back();" class="back-off"></a>
  <div class="list-search">
    <p class="list-search-text">${headTitle}</p>
  </div>
  <a href="javascript:void(0);" class="list-bar"></a>
</header>
<section class="list-menu" style="display: none;">
  <ul>
    <li> <a href="/BiGeZaiXian"> <span class="me1-icon mi"><i></i></span> <span class="mname">首页</span> </a> </li>
    <li> <a href=""> <span class="me2-icon mi"><i></i></span> <span class="mname">搜索</span> </a> </li>
    <li> <a href="/BiGeZaiXian/user/toCart"> <span class="me3-icon mi"><i></i></span> <span class="mname">购物车</span> </a> </li>
    <li> <a href="/BiGeZaiXian/user/toMyCenter"> <span class="me4-icon mi"><i></i></span> <span class="mname">我的</span> </a> </li>
  </ul>
</section>
</body>
</html>
