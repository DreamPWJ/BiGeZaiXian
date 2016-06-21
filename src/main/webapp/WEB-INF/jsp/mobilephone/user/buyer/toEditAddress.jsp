<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
  <link href="<c:url value="/css/mobilephone/user/editAddress.css"/>" rel="stylesheet" type="text/css" >
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
  <!--公司地址--编辑/删除-->
  <div class="xinmd" >
    <div class="gsdz">公司地址</div>
    <div class="xinmd-1">
      <%--<div class="xinmd-1-1"><a href="/BiGeZaiXian/user/toEditCompanyAddress">编辑</a></div>--%>
      <div class="xinmd-1-2"><a href="/BiGeZaiXian/user/toEditCompanyAddress?companyId=${company.id}">编辑</a></div>
    </div>
  </div>
  <!--姓名电话-->
  <div class="xinmds">
    <div class="xinmds-1"><samp class="xmsa">${company.linkman}</samp>&nbsp;&nbsp;&nbsp;&nbsp;<samp style="font-size:15px; color:#EB6100;">${company.mobphone}</samp></div>
    <!--			<div class="xinmds-2" style="display:inline;">
                    <div class="xinmds-2-1"></div>
                </div>
    -->
  </div>
  <!--地址-->
  <div class="dizi">
    <samp style="color:#666; font-size:12px;">${company.address}</samp>
  </div>
  <!--添加公司地址-->
  <%--<div class="tjshdz"><a href="#">添加公司地址</a></div>--%>

<c:forEach items="${addressList}" var="item">
  <!--收货地址-->
  <div class="xinmd" >
    <div class="gsdz">收货地址</div>
    <div class="xinmd-1">
      <div class="xinmd-1-1"><a href="/BiGeZaiXian/user/toEditReceiptAddress?type=2&addressId=${item.ID}">编辑</a></div>
      <div class="xinmd-1-2"><a href="/BiGeZaiXian/user/deleteReceiptAddress?addressId=${item.ID}">删除</a></div>
    </div>
  </div>

  <!--姓名电话-->
  <div class="xinmds">
    <div class="xinmds-1">
      <samp class="xmsa">${item.LINKMAN}</samp>&nbsp;&nbsp;&nbsp;&nbsp;
      <samp style="font-size:15px; color:#EB6100;">${item.MOBPHONE}</samp>
    </div>
    <div class="xinmds-2" style="display:inline;"><!-- 根据选择将此处进项隐藏-->
      <div class="xinmds-2-1"></div>
    </div>
  </div>
  <!--地址-->
  <div class="dizi">
    <samp style="color:#666; font-size:12px;">
      ${item.PROVINCE}${item.CITY}${item.COUNTY}${item.ADDRESS}
      <%--山东省日照市新市区国际金融中心1号楼B栋12楼山东省日照市新市区国际金融中心--%>
    </samp>
  </div>
</c:forEach>

  <h1 style="margin-left: 20px;color: #85140E;font-size: large">${msg_info}</h1>

  <!--添加收货地址-->
  <div class="tjshdz"><a href="/BiGeZaiXian/user/toEditReceiptAddress?type=1&addressId=0">添加收货地址</a></div>

  <!--底部-->
  <jsp:include page="../../footer.jsp"></jsp:include>
</div>
</body>
</html>


