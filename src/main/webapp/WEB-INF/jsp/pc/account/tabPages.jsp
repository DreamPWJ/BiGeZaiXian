<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<ul class="order-tab">
    <li class="current">
        <a href="<c:url value='/account/toattachment'/>">认证附件</a>
    </li>
    <li>
        <a href="<c:url value='/account/tomanager'/>">基本资料</a>
    </li>
    <li>
        <a href="<c:url value='/account/toservices'/>">我的服务</a>
    </li>
    <%--   <li>
           <a href="<c:url value='/account/tosecuritySettings'/>">安全设置</a>
       </li>--%>

</ul>