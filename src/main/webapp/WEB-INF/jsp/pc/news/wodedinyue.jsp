<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>信息中心 - 比格在线</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/wodedinyue.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">

</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>

<!-- content ----------- begin -->
<div class="content">
    <div class="container_25">
        <div class="grid_5">
            <%@ include file="../A_public/accountSideMenu.jsp" %>
        </div>
        <div class="grid_20">
            <div class="rightcon">
                <div class="uibox-head-order">
                    <h1 class="titbase" style="text-align:left;">消息中心</h1>
                </div>
                <div class="uibox-order">
                    <div class="formsendcon-f" id="con">
                        <ul class="order-tab" id="tag_div">
                            <li>
                                <a href="<c:url value='/index/tomsgCenter'/>">我的消息</a>
                            </li>
                            <li class="current">
                                <a href="wodedinyue.jsp">我的订阅</a>
                            </li>
                        </ul>


                        <!-- 我的订阅 -->
                        <div class="uibox-con">
                            <table class="text-cen">
                                <thead>
                                <tr class="bordertb">
                                    <th width="120px">订阅类别</th>
                                    <th width="250px">订阅内容</th>
                                    <th width="150px">站内信（<input data-type="setBatch" data-settype="1" id='set_1'
                                                                 type="checkbox"/><label for='set_1'>全选</label>
                                        ）
                                    </th>
                                    <th width="150px">短信（<input data-type="setBatch" data-settype="2" id='set_2'
                                                                type="checkbox"/><label for='set_2'>全选</label>
                                        ）
                                    </th>
                                    <th width="150px">邮箱（<input data-type="setBatch" data-settype="3" id='set_3'
                                                                type="checkbox"/><label for='set_3'>全选</label>
                                        ）
                                    </th>
                                </tr>


                                <tr class="bordertbs">
                                    <th width="120px">订阅类别</th>
                                    <th width="250px">订阅内容</th>
                                    <th width="150px">站内信（<input data-type="setBatch" data-settype="1" id='set_1'
                                                                 type="checkbox"/><label for='set_1'>全选</label>
                                        ）
                                    </th>
                                    <th width="150px">短信（<input data-type="setBatch" data-settype="2" id='set_2'
                                                                type="checkbox"/><label for='set_2'>全选</label>
                                        ）
                                    </th>
                                    <th width="150px">邮箱（<input data-type="setBatch" data-settype="3" id='set_3'
                                                                type="checkbox"/><label for='set_3'>全选</label>
                                        ）
                                    </th>
                                </tr>


                                <tr class="bordertbs">
                                    <th width="120px">订阅类别</th>
                                    <th width="250px">订阅内容</th>
                                    <th width="150px">站内信（<input data-type="setBatch" data-settype="1" id='set_1'
                                                                 type="checkbox"/><label for='set_1'>全选</label>
                                        ）
                                    </th>
                                    <th width="150px">短信（<input data-type="setBatch" data-settype="2" id='set_2'
                                                                type="checkbox"/><label for='set_2'>全选</label>
                                        ）
                                    </th>
                                    <th width="150px">邮箱（<input data-type="setBatch" data-settype="3" id='set_3'
                                                                type="checkbox"/><label for='set_3'>全选</label>
                                        ）
                                    </th>
                                </tr>
                                </thead>
                            </table>
                            <div class="form-smtcon">
                                <div class="bc">
                                    <a href="#" id="feedFormBtn">保存订阅</a>
                                    <!--			<a href="javascript:void(0);" style="color:#fff;" class="btnsm wico" id="feedFormBtn">保存订阅</a>-->
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- content ----------- end -->

<%-- 底部公共div--%>

<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
