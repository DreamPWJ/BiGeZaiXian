<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>帮你找货 - 比格在线</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/lookingfor.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">

</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>

<!-- content ----------- begin -->
<div class="content">
    <div class="container_25">
        <div class="grid_25">
        </div>
        <div class="grid_5">
            <%@ include file="../A_public/accountSideMenu.jsp" %>
        </div>
        <div class="grid_20">
            <div class="rightcon">
                <div class="uibox">
                    <div class="uibox-head">
                        <h1 class="titbase displine">帮你找货</h1>

                        <div class="toptext">
                        </div>
                    </div>
                    <div class="type-search">
                        <form action="" method="post" class="form-horizontal">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">关键字</label>

                                        <div class="col-md-8">
                                            <input name="" class="form-control placeholder-no-fix" placeholder="品名"
                                                   value=""/>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <input type="submit" class="btn btn-warning btn-sm" value="搜索">
                                    <input type="reset" class="btn btn-primary btn-sm" value="重置">
                                </div>

                            </div>
                        </form>
                    </div>
                    <div class="tabshow1">
                        <table class="table table-striped table-bordered table-hover"
                               id="data-table">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>品种/牌号</th>
                                <th>入库数量</th>
                                <th>确认数量</th>
                                <th>剩余数量</th>
                                <th>在售数量</th>
                                <th>确认状态</th>
                                <th>所在仓库</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
              <%--                  <td>111</td>
                                <td>品种/牌号</td>
                                <td>入库数量</td>
                                <td>确认数量</td>
                                <td>剩余数量</td>
                                <td>在售数量</td>
                                <td>确认状态</td>
                                <td>所在仓库</td>--%>
                            </tr>
                            </tbody>
                        </table>
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
