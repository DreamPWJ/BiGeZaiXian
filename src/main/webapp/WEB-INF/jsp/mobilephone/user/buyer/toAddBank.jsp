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

  <!--银行账号增加-->
  <div>
    公司名称 <input/>
  </div>
  <div>
    银行账号 <input/>
  </div>
  <div>
    开户银行
    <select>
      <option value="1">中国银行</option>
      <option value="2">中国农业银行</option>
      <option value="3">日照银行</option>
    </select>
  </div>
  <div>
    详细网点 <input placeholder="请填写网点的准确信息"/>
  </div>
  <!--底部-->
  <jsp:include page="../../foot_index.jsp"></jsp:include>
</div>

</body>
</html>

