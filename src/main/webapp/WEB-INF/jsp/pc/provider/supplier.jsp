<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>比格在线-供应商！</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/supplier.css'/>" rel="stylesheet" type="text/css">
</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>

<!--主体------------------------------------开始-->
<div class="Gys-main">

    <div class="gysbt">热门供应商</div>
    <div class="gdx1"></div>
    <div class="gdx2"></div>

    <div class="SH">
        <!--第一排-->
        <div class="d1p">
            <div class="g1">
                <div class="d1-1"><img src="<c:url value='/images/pc/supplier/GYS1.png'/>" width="165" height="70"/>
                </div>
                <!--图片格式，宽：156， 高：68-->
                <div class="d1-2"><a>台湾塑胶工业股份有限公司</a></div>
                <!--19个汉字-->
                <div class="d1-3"><a>Formosa Plastics Corporation</a></div>
                <!--40个英文字-->
            </div>

            <div class="g1">
                <div class="d1-1"><img src="<c:url value='/images/pc/supplier/GYS2.png'/>" width="165" height="70"/>
                </div>
                <!--图片格式，宽：156， 高：68-->
                <div class="d1-2"><a>泰国暹罗化工有限公司</a></div>
                <!--19个汉字-->
                <div class="d1-3"><a>SCG Plactics CO.,LTD</a></div>
                <!--40个英文字-->
            </div>

            <div class="g2">
                <div class="d1-1"><img src="<c:url value='/images/pc/supplier/GYS3.jpg'/>" width="165" height="70"/>
                </div>
                <!--图片格式，宽：156， 高：68-->
                <div class="d1-2"><a>韩国SK</a></div>
                <!--19个汉字-->
                <div class="d1-3"><a>SK</a></div>
                <!--40个英文字-->
            </div>
        </div>
        <div class="gdx3"></div>


        <!--第二排-->
        <div class="d1p">
            <div class="g1">
                <div class="d1-1"><img src="<c:url value='/images/pc/supplier/GYS4.jpg'/>" width="165" height="70"/>
                </div>
                <!--图片格式，宽：156， 高：68-->
                <div class="d1-2"><a>沙特基础工业公司</a></div>
                <!--19个汉字-->
                <div class="d1-3"><a>Saudi Basic industry Corporation</a></div>
                <!--40个英文字-->
            </div>

            <div class="g1">
                <div class="d1-1"><img src="<c:url value='/images/pc/supplier/GYS5.jpg'/>" width="165" height="70"/>
                </div>
                <div class="d1-2"><a>泰国PTT</a></div>
                <div class="d1-3"><a>PTT Public Company Limited</a></div>
            </div>

            <div class="g2">
                <div class="d1-1"><img src="<c:url value='/images/pc/supplier/GYS6.jpg'/>" width="165" height="70"/>
                </div>
                <div class="d1-2"><a>伊朗国家石化公司</a></div>
                <div class="d1-3"><a>Petrochemical Commercial Company</a></div>
            </div>
        </div>
        <div class="gdx3"></div>


        <!--第三排-->
        <div class="d1p">
            <div class="g1">
                <div class="d1-1"><img src="<c:url value='/images/pc/supplier/GYS7.jpg'/>" width="165" height="70"/>
                </div>
                <!--图片格式，宽：156， 高：68-->
                <div class="d1-2"><a>三井化学公司</a></div>
                <!--19个汉字-->
                <div class="d1-3"><a>Mitsui Chemicals</a></div>
                <!--40个英文字-->
            </div>

            <div class="g1">
                <div class="d1-1"><img src="<c:url value='/images/pc/supplier/GYS8.jpg'/>" width="165" height="70"/>
                </div>
                <div class="d1-2"><a>埃克森美孚公司</a></div>
                <div class="d1-3"><a>Exxon Mobil Corporation</a></div>
            </div>

            <div class="g2">
                <div class="d1-1"></div>
                <!--图片格式，宽：156， 高：68-->
                <div class="d1-2"><a></a></div>
                <!--19个汉字-->
                <div class="d1-3"><a></a></div>
                <!--40个英文字-->
            </div>
        </div>
    </div>



</div>
<!--主体------------------------------------结束-->

<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
