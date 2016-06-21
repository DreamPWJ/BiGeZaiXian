<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>资质认证 - 比格在线</title>
    <!--js-->
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/attachment.css'/>" rel="stylesheet" type="text/css">
    <script src="<c:url value='/js/pc/scripts/jquery-1.11.1.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/js/commonUtil.js'/>" type="text/javascript"></script>
    <script type="text/javascript">
        $(function(){
            if(${msg_file == '请先上传三证图片'}){
                alert("请先上传三证图片");
            }
        });
    </script>
</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>

<div class="content">
    <div class="container_25">
        <div class="grid_5">
            <%@ include file="../A_public/accountSideMenu.jsp" %>
        </div>
        <div class="grid_20">
            <div class="rightcon">
                <div class="uibox-head-order">
                    <h1 class="titbase" style="text-align:left;">账号管理</h1>
                </div>
                <div class="uibox-order">
                    <div class="formsendcon-f">
                                <div class="yxyz">
                                    <div class="yxyz-1">资质文件上传（请提供相关证件的扫描件，以便我们进行资质审核。）</div>
                                    <div class="yxyz-2">*上传文件为&nbsp;jpg、jpeg、png等图片类型，大小不超过4MB</div>
                                </div>

                            </ul>
                        <div class="uibox-con">
                            <form action="<c:url value='/account/uploadCredentials'/>" method="post"
                                  enctype="multipart/form-data">
                                <table class="table  table-hover"
                                       id="data-table">
                                    <thead>
                                    <tr>
                                        <th>名称</th>
                                        <th>附件</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>企业营业执照</td>
                                        <td>
                                            营业执照
                                        </td>
                                        <td>
                                            <c:if test="${msg==null}">
                                                <input type="file" id="uplcharter" name="filepic" check-type="required"/>
                                            </c:if>
                                            <c:if test="${msg==true}">
                                                <span class="uploadsucess">上传成功</span>
                                            </c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>税务登记证</td>
                                        <td>
                                            税务登记证
                                        </td>
                                        <td>
                                            <c:if test="${msg==null}">
                                                <input type="file" id="upltax" name="filepic" check-type="required"/>
                                            </c:if>
                                            <c:if test="${msg==true}">
                                                <span class="uploadsucess">上传成功</span>
                                            </c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>组织机构代码证</td>
                                        <td>
                                            组织机构代码证
                                        </td>
                                        <td>
                                            <c:if test="${msg==null}">
                                                <input type="file" id="uplcode" name="filepic" check-type="required"/>
                                            </c:if>
                                            <c:if test="${msg==true}">
                                                <span class="uploadsucess">上传成功</span>
                                            </c:if></td>
                                    </tr>

                                    </tbody>
                                </table>
                                <input id="uploader" type="submit" class="btn btn-success"
                                       <c:if test="${msg==true}">disabled</c:if> value="上传"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--提示回话过期-->
<div style="display: none;" id="overtime"></div>

<!--提示回话过期-->

<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
<!--js文件-->

