<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>友情链接</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value="/css/pc/requestLink.css"/>" rel="stylesheet" type="text/css">
</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>

<div class="main">
    <div class="main-lj">
    </div>
    <div class="LT"></div>
    <div class="RT"></div>
    <div class="main-L">
        <div class="qblj">
            <div class="qblj-ZL1-t"><img src="<c:url value="/images/pc/allLinks/jhgs2.png"/>" width="14" height="13"/></div>
            <div class="qblj-ZL1-z"><a href="allLinks.jsp">全部链接</a></div>
        </div>
        <div class="sqlj">
            <div class="sqlj-ZL2-t"><img src="<c:url value="/images/pc/allLinks/jhgs2.png"/> "width="14" height="13"/></div>
            <div class="sqlj-ZL2-z"><a href="javascript:void(0);">申请链接</a></div>
        </div>
    </div>


    <div class="main-R">
        <div class="sqlj-n2">
            <div class="form-name">网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</div>
            <div class="form-zhi">
                <input name="wangzhi" type="text" size="35" maxlength="35" placeholder="如：http://www.juhuawang.com"
                       class="wz"/>
            </div>

            <div class="form-name">网站名称：</div>
            <div class="form-zhi">
                <input name="wangzhiname" type="text" size="35" maxlength="35" placeholder="如：聚化网" class="wz"/>
            </div>

            <div class="form-name">网站Logo：</div>
            <div class="form-zhi">
                <input type="file" id="FileUpload1" class="wz"/>
            </div>

            <div class="form-name">站长Email：</div>
            <div class="form-zhi">
                <input name="user_email" type="text" size="50" maxlength="50" class="wz"/>
            </div>

            <div class="form-wzjk">网站简况：</div>
            <div class="form-zi">
                <textarea name="con" class="wzjk"></textarea>
            </div>

            <div class="form-name">网站类型：</div>
            <div class="form-zhi">
                <select name="chengsi" class="wtr">
                    <option value="" selected="selected">[选择类型]</option>
                    <option value="0">A类型</option>
                    <option value="1">B类型</option>
                    <option value="2">C类型</option>
                    <option value="3">D类型</option>
                    <option value="4">E类型</option>
                    <option value="5">F类型</option>
                </select>
            </div>
            <div class="form-yzm">验证码：</div>
            <div class="form-te">
                <input name="yzm" type="text" size="50" maxlength="8" class="wte"/><a href="validatecode.ashx"></a>
            </div>
            <div class="form-tu">
                <img id="vCode"
                     style="margin: 0px; width: 100px; height: 30px; border: 1px solid #ccc; -moz-border-radius: 3px 3px; -webkit-border-radius: 3px 3px; border-radius: 3px 3px;"
                     src="" title="看不清？点击更换"/>
            </div>

            <div class="kg"></div>

            <div class="form-ann">
                <p style="width: 180px; height: 50px; margin: 0px; padding: 0px; float: left;"></p>
                <input type="submit" name="tijiao" value="提    交" class="tj"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
                    type="reset" name="congzi" value="重    置" class="tj"/>
            </div>


            <div class="lo">
                <div class="renwu">
                    <img src="<c:url value="/images/pc/allLinks/youqin.png"/> style="width: 206px; height: 242px"/></div>
            </div>

        </div>
    </div>
</div>

<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
