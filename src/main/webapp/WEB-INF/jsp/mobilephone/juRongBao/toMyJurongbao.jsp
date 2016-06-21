<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
    <jsp:include page="../top.jsp"></jsp:include>

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
    <link href="<c:url value="/css/mobilephone/jrb/jrbMy.css"/>" rel="stylesheet" type="text/css">

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

            /*已通过的审核*/
            $("#title_checkpass").click(function(){
                $("#content_checkpass").toggle();
            });
            /*审核中*/
            $("#title_checking").click(function(){
                $("#content_checking").toggle();
            });
            /*未通过的审核*/
            $("#title_checkfail").click(function(){
                $("#content_checkfail").toggle();
            });
        });
    </script>
</head>

<body>
<div class="zhongti" id="tou">
    <!--头部-->
    <jsp:include page="../navigation.jsp"></jsp:include>
    <!--top-logo-->
    <jsp:include page="jrbTop.jsp"></jsp:include>

    <!--额度-->
    <div class="Ed">
        <a href="/BiGeZaiXian/jurongbao/toJrbApplyRecord">
        <div class="Ed-1">
            <div class="Ed-1-t1">
                <div class="Ed-1-1">
                    <div class="Ed-1-1-1"><samp class="m-sam1">9000</samp></div>
                    <div class="Ed-1-1-2"><samp class="m-sam2">万元</samp></div>
                </div>
            </div>
            <div class="Ed-1-z">信用额度</div>
        </div>
        </a>
        <div class="Ed-1">
            <div class="Ed-1-t2">
                <div class="Ed-1-1">
                    <div class="Ed-1-1-1"><samp class="m-sam1">850</samp></div>
                    <div class="Ed-1-1-2"><samp class="m-sam2">万元</samp></div>
                </div>
            </div>
            <div class="Ed-1-z">可用额度</div>
        </div>
        <div class="Ed-1">
            <a href="/BiGeZaiXian/jurongbao/toJrbNoPay">
                <div class="Ed-1-t3">
                    <div class="Ed-1-1">
                        <div class="Ed-1-1-1"><samp class="m-sam1">150</samp></div>
                        <div class="Ed-1-1-2"><samp class="m-sam2">万元</samp></div>
                    </div>
                </div>
            </a>
            <div class="Ed-1-z">待还款项</div>
        </div>
        <div class="Ed-1">
            <a href="/BiGeZaiXian/jurongbao/toJrbHasPayed">
                <div class="Ed-1-t4">
                    <div class="Ed-1-1">
                        <div class="Ed-1-1-1"><samp class="m-sam1">130</samp></div>
                        <div class="Ed-1-1-2"><samp class="m-sam2">万元</samp></div>
                    </div>
                </div>
            </a>
            <div class="Ed-1-z">已还款项</div>
        </div>
    </div>

    <!--额度2-->
    <div class="Ed2">
        <div class="Ed-1">
            <a href="/BiGeZaiXian/jurongbao/toJrbCheckingList">
                <div class="Ed-1-t5">
                    <div class="Ed-1-1">
                        <div class="Ed-1-1-1"><samp class="m-sam1">90</samp></div>
                        <div class="Ed-1-1-2"><samp class="m-sam2">万元</samp></div>
                    </div>
                </div>
            </a>
            <div class="Ed-1-z">审核中</div>
        </div>
        <div class="Ed-1">
            <a href="/BiGeZaiXian/jurongbao/toJrbFrozenProvision">
                <div class="Ed-1-t6">
                    <div class="Ed-1-1">
                        <div class="Ed-1-1-1"><samp class="m-sam1">40</samp></div>
                        <div class="Ed-1-1-2"><samp class="m-sam2">万元</samp></div>
                    </div>
                </div>
            </a>
            <div class="Ed-1-z">冻结款项</div>
        </div>
        <div class="Ed-1">
            <a href="/BiGeZaiXian/jurongbao/toJrbHasLoan">
                <div class="Ed-1-t7">
                    <div class="Ed-1-1">
                        <div class="Ed-1-1-1"><samp class="m-sam1">280</samp></div>
                        <div class="Ed-1-1-2"><samp class="m-sam2">万元</samp></div>
                    </div>
                </div>
            </a>
            <div class="Ed-1-z">已贷款项</div>
        </div>
        <div class="Ed-1">
            <div class="Ed-1-t8">
                <div class="Ed-1-1">
                    <div class="Ed-1-1-1"><samp class="m-sam1">15</samp></div>
                    <div class="Ed-1-1-2"><samp class="m-sam2">万元</samp></div>
                </div>
            </div>
            <div class="Ed-1-z">手续费</div>
        </div>
    </div>
    <!--搜索-->
    <div class="shsu">
        <form>
            <jsp:include page="search.jsp"></jsp:include>
        </form>
    </div>
    <!--已通过的审核-->
    <div class="ytgdd">
        <div class="shtg" id="title_checkpass">
            <div class="shtg-1"><div class="shtg-1-1"></div></div>
            &nbsp;&nbsp;&nbsp;已通过的审核
            <div class="shtg-2"></div>
        </div>
        <div class="TGsh" id="content_checkpass" style="display: none;">
            <!--订单1-->
            <div class="dind">
                &nbsp;&nbsp;&nbsp;<samp class="d-sam1">订单</samp>&nbsp;&nbsp;&nbsp;<samp class="d-sam2">201510150026</samp>
                <a href="/BiGeZaiXian/jurongbao/toJrbOrderDetail">
                    <div class="dind-1">待还<samp class="d-sam3">65</samp>万<div class="dind-1-1"></div></div>
                </a>
            </div>
            <!--订单2-->
            <div class="dind">
                &nbsp;&nbsp;&nbsp;<samp class="d-sam1">订单</samp>&nbsp;&nbsp;&nbsp;<samp class="d-sam2">201510150028</samp>
                <a href="/BiGeZaiXian/jurongbao/toJrbOrderDetail"><div class="dind-1">
                    待还<samp class="d-sam3">65</samp>万
                    <div class="dind-1-1"></div>
                </div></a>
            </div>
            <!--订单3-->
            <div class="dind">
                &nbsp;&nbsp;&nbsp;<samp class="d-sam1">订单</samp>&nbsp;&nbsp;&nbsp;<samp class="d-sam2">201510150029</samp>
                <a href="/BiGeZaiXian/jurongbao/toJrbOrderDetail"><div class="dind-1">
                    待还<samp class="d-sam3">65</samp>万
                    <div class="dind-1-1"></div>
                </div></a>
            </div>
        </div>
    </div>
    <div style="width:auto; height:30px; clear:left; background:#F3F3F3;"></div>

    <!--审核中-->
    <div class="ytgdd">
        <div class="shz" id="title_checking">
            <div class="shz-1"><div class="shz-1-1"></div></div>
            &nbsp;&nbsp;&nbsp;审核中
            <div class="shtg-2"></div>
        </div>
        <div class="TGsh" id="content_checking" style="display:none;">
            <!--订单1-->
            <div class="dind">
                &nbsp;&nbsp;&nbsp;<samp class="d-sam1">订单</samp>&nbsp;&nbsp;&nbsp;<samp class="d-sam2">201510150030</samp>
                <a href="/BiGeZaiXian/jurongbao/toJrbCheckingList">
                    <div class="dind-1">贷款<samp class="d-sam3">100</samp>万<div class="dind-1-1"></div></div>
                </a>
            </div>
        </div>
    </div>
    <div style="width:auto; height:30px; clear:left; background:#F3F3F3;"></div>

    <!--未通过的审核-->
    <div class="ytgdd">
        <div class="shwtg" id="title_checkfail">
            <div class="shwtg-1"><div class="shwtg-1-1"></div></div>
            &nbsp;&nbsp;&nbsp;未通过的审核
            <div class="shtg-2"></div>
        </div>
        <div class="TGsh" id="content_checkfail" style="display:none;">
            <!--订单1-->
            <div class="dind">
                &nbsp;&nbsp;&nbsp;<samp class="d-sam1">订单</samp>&nbsp;&nbsp;&nbsp;<samp class="d-sam2">201510150027</samp>
                <a href="/BiGeZaiXian/jurongbao/toJrbOrderCheckFail">
                    <div class="dind-1">贷款<samp class="d-sam3">150</samp>万<div class="dind-1-1"></div></div>
                </a>
            </div>
        </div>
    </div>
    <div style="width:auto; height:30px; clear:left; background:#F3F3F3;"></div>

</div>
</body>
</html>

