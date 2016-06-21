<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>比格在线-发布求购！</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/releaseFor.css'/>" rel="stylesheet" type="text/css">
</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>

<!--主体------------------------------------开始-->
<div class="tu">
    <div class="tu-M"><img src="<c:url value='/images/pc/releaseFor/fbqg1.png'/>" width="980" height="230"/></div>
</div>


<div id="tu-wb">
    <div class="qgjdt1">
        <img src="<c:url value='/images/pc/releaseFor/qgjdt1.png'/>" width="733" height="50"/>
    </div>
    <div class="portlet-body form">
        <!-- BEGIN FORM-->
        <form action="" class="form-horizontal" method="post">
            <div class="form-body">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <div class="col-xs-4 col-xs-offset-4">
                                    <input id="" name=""
                                           class="form-control placeholder-no-fix"
                                           autocomplete="on"
                                           placeholder="求购货品"
                                           check-type=""/>
                                </div>

                            </div>
                        </div>
                        <!--/span-->
                        <div class="col-xs-12">
                            <div class="form-group">
                                <div class="col-xs-4 col-xs-offset-4">

                                    <input id="" name=""
                                           class="form-control placeholder-no-fix"
                                           autocomplete="on"
                                           placeholder="数量"
                                           check-type=""/>

                                </div>

                            </div>
                        </div>
                        <!--/span-->

                        <!--/span-->
                        <div class="col-xs-12">
                            <div class="form-group">
                                <div class="col-xs-4 col-xs-offset-4">

                                    <input id="" name=""
                                           class="form-control placeholder-no-fix"
                                           autocomplete="on"
                                           placeholder="接受价格"
                                           check-type=""/>

                                </div>

                            </div>
                        </div>
                        <!--/span-->
                    </div>
                </div>
            </div>


            <div class="col-xs-12" style="text-align: center;">
                <button id="" type="submit"
                        class="btn btn-success ">
                    下一步
                </button>
            </div>

        </form>
        <!-- END FORM-->
    </div>
</div>
<!--主体------------------------------------结束-->

<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
