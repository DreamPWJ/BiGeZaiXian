<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>

  <script type="text/javascript">
    $(function () {
      var aDent = true;
      var oParent = $('.list-bar');
      var oNodeContent = $('.list-menu');
      oParent.click(function () {
        if (aDent) {
          oNodeContent.stop().slideDown(500);
        } else {
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

  <br/>
  <a href="/BiGeZaiXian/user/toAddBank" class="blue" style="font-size: 14px">增加</a>
  <br/>
  <!--银行账户列表-->
  <table>
    <tbody>
      <tr>
        <td>序号</td>
        <td>银行账号</td>
        <td>开户银行</td>
        <td>详细网点</td>
        <td>默认</td>
        <td colspan="3" style="text-align: center;">操作</td>
      </tr>
      <tr>
        <td>1</td>
        <td>1111111111</td>
        <td>中国银行</td>
        <td>黄海一路68号</td>
        <td>默认</td>
        <td>编辑</td>
        <td>删除</td>
        <td>设为默认</td>
      </tr>
    </tbody>
  </table>

  <!--底部-->
  <jsp:include page="../../foot_index.jsp"></jsp:include>
</div>

</body>
</html>

