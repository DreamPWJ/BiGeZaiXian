<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
    <title>欢迎页面</title>
    <%@ include file="../../main/webapp/WEB-INF/jsp/share/importCss.jsp" %>

</head>
<body>
<h2>Hello Spring MVC+Spring+Mybatis!</h2>
<a href="<c:url value="/user/showUser"/>">
    <button class="btn btn-success" type="button">查询用户</button>
</a>
</body>
</html>
<%@ include file="../../main/webapp/WEB-INF/jsp/share/importJs.jsp" %>
