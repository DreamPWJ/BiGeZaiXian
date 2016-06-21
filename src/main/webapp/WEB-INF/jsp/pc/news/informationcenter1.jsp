<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/normalize.min.css'/>" rel="stylesheet" type="text/css"/>
    <!--兼容样式-->
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/plugins/JqueryPagination/jquery.pagination.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/news/informationcenter.css'/>" rel="stylesheet" type="text/css"/>

    <title>资讯中心</title>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<!-- content ----------- 开始 -->

<div class="content">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#platform" aria-controls="platform" role="tab"
                                                  data-toggle="tab">平&nbsp;&nbsp;台</a></li>
        <li role="presentation"><a  id="markettab" href="#market" aria-controls="market" role="tab" data-toggle="tab">行&nbsp;&nbsp;业</a>
        </li>
        <li role="presentation"><a id="industrytab" href="#industry" aria-controls="industry" role="tab"
                                   data-toggle="tab">市&nbsp;&nbsp;场</a></li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="platform">
            <div class="L1-2"><img src="<c:url value='/images/pc/news/pt001.png'/> "/>平台资讯</div>
            <!--平台内容-->
            <c:forEach var="item" items="${news003001001}">
                <div class="L2">
                    <div class="L2-t"><a href="<c:url value='/index/tonews?id=${item.ID}'/> " target="_blank"><img
                            src="${item.TITLEIMAGE}"
                            width="228"
                            height="140"/></a></div>
                    <div class="L2-z">
                        <div class="L2-z1">
                            <div class="L2-z1-1"><a
                                    href="<c:url value='/index/tonews?id=${item.ID}'/>" target="_blank"
                                    title="${item.TITLE}"><samp
                                    class="lsa5 text-overflow_news">${item.TITLE}</samp></a>
                            </div>
                            <div class="L2-z1-2"><samp class="lsa1"><ftm:formatDate
                                    value="${item.UPDATETIME==null?item.CREATETIME:item.UPDATETIME}"
                                    pattern="yyyy-MM-dd"/></samp></div>
                        </div>
                        <div class="L2-z2">概述：<samp class="lsa4">
                                ${item.SUMMARY}
                        </samp></div>
                        <div class="L2-z3"><a target="_blank" href="<c:url value='/index/tonews?id=${item.ID}'/>">[详情]</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div style="clear:both;"></div>
            <!--分页-->
            <div id="page" class="m-pagination pull-right"></div>
            <input type="hidden" id="totalcount" value="${totalcount}"/>
            <input type="hidden" id="pageSize" value="${pageSize}"/>
            <input type="hidden" id="urlpage" value="/BiGeZaiXian/news/toinformationcenter"/>
            <!--平台活动-->
            <div class="pthd">
                <div class="pthd-z">平台活动</div>
            </div>
            <!--平台活动内容-->
            <div class="pthdnr">
                <div class="pthdnr1">
                    <div class="pthdnr1-1"><img src="<c:url value='/images/pc/news/hd001.jpg'/>"/></div>
                    <!--图片尺寸：134*218px-->
                    <div class="pthdnr1-2"><a href="#">参加活动</a></div>
                </div>

                <div class="pthdnr1">
                    <div class="pthdnr1-1"><img src="<c:url value='/images/pc/news/hd002.jpg'/>"/></div>
                    <!--图片尺寸：134*218px-->
                    <div class="pthdnr1-2"><a href="#">参加活动</a></div>
                </div>

                <div class="pthdnr1">
                    <div class="pthdnr1-1"><img src="<c:url value='/images/pc/news/hd003.jpg'/>"/></div>
                    <!--图片尺寸：134*218px-->
                    <div class="pthdnr1-2"><a href="#">参加活动</a></div>
                </div>

                <div class="pthdnr1">
                    <div class="pthdnr1-1"><img src="<c:url value='/images/pc/news/hd004.jpg'/>"/></div>
                    <!--图片尺寸：134*218px-->
                    <div class="pthdnr1-2"><a href="#">参加活动</a></div>
                </div>

                <%--        <div class="pthdnr1">
                            <div class="pthdnr1-1"><img src="<c:url value='/images/pc/news/hd001.jpg'/>"/></div>
                            <!--图片尺寸：134*218px-->
                            <div class="pthdnr1-2"><a href="#">参加活动</a></div>
                        </div>

                        <div class="pthdnr1">
                            <div class="pthdnr1-1"><img src="<c:url value='/images/pc/news/hd002.jpg'/>"/></div>
                            <!--图片尺寸：134*218px-->
                            <div class="pthdnr1-2"><a href="#">参加活动</a></div>
                        </div>

                        <div class="pthdnr2">
                            <div class="pthdnr1-1"><img src="<c:url value='/images/pc/news/hd003.jpg'/>"/></div>
                            <!--图片尺寸：134*218px-->
                            <div class="pthdnr1-2"><a href="#">参加活动</a></div>
                        </div>--%>
            </div>

        </div>


        <div role="tabpanel" class="tab-pane" id="market">         <!--行情内容-->
        <%--    <div class="L1-2"><img src="<c:url value='/images/pc/news/pt001.png'/> "/>行情资讯</div>--%>
            <c:forEach var="item" items="${news003002}">
                <div class="L2">
                    <div class="L2-t"><a
                            href="<c:url value='/index/tonews?id=${item.ID}'/>"  target="_blank"><img
                            src="${item.TITLEIMAGE}"
                            width="228"
                            height="140"/></a></div>
                    <div class="L2-z">
                        <div class="L2-z1">
                            <div class="L2-z1-1"><a
                                    href="<c:url value='/index/tonews?id=${item.ID}'/>"   target="_blank"
                                    title="${item.TITLE}" > <samp
                                    class="lsa5 text-overflow_news">${item.TITLE}</samp></a>
                            </div>
                            <div class="L2-z1-2"><samp class="lsa1"><ftm:formatDate
                                    value="${item.UPDATETIME==null?item.CREATETIME:item.UPDATETIME}"
                                    pattern="yyyy-MM-dd"/></samp></div>
                        </div>
                        <div class="L2-z2">概述：<samp class="lsa4">
                                ${item.SUMMARY}
                        </samp></div>
                        <div class="L2-z3"><a
                                href="<c:url value='/index/tonews?id=${item.ID}'/>"  target="_blank">[详情]</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div style="clear:both;"></div>
            <!--分页-->
            <div id="page1" class="m-pagination pull-right"></div>
            <input type="hidden" id="totalcount1" value="${totalcount1}"/>
            <input type="hidden" id="pageSize1" value="${pageSize1}"/>
            <input type="hidden" id="urlpage1" value="/BiGeZaiXian/news/toinformationcenter?type=market"/>
        </div>
        <div role="tabpanel" class="tab-pane" id="industry">               <!--行业内容-->
      <%--      <div class="L1-2"><img src="<c:url value='/images/pc/news/pt001.png'/> "/>行业资讯</div>--%>
            <c:forEach var="item" items="${news003003001}">
                <div class="L2">
                    <div class="L2-t"><a
                            href="<c:url value='/index/tonews?id=${item.ID}'/>"  target="_blank"><img
                            src="${item.TITLEIMAGE}"
                            width="228"
                            height="140"/></a></div>
                    <div class="L2-z">
                        <div class="L2-z1">
                            <div class="L2-z1-1"><a
                                    href="<c:url value='/index/tonews?id=${item.ID}'/>"  target="_blank"
                                    title="${item.TITLE}"><samp
                                    class="lsa5 text-overflow_news">${item.TITLE}</samp></a>
                            </div>
                            <div class="L2-z1-2"><samp class="lsa1"><ftm:formatDate
                                    value="${item.UPDATETIME==null?item.CREATETIME:item.UPDATETIME}"
                                    pattern="yyyy-MM-dd"/></samp></div>
                        </div>
                        <div class="L2-z2">概述：<samp class="lsa4">
                                ${item.SUMMARY}
                        </samp></div>
                        <div class="L2-z3"><a
                                href="<c:url value='/index/tonews?id=${item.ID}'/>"  target="_blank">[详情]</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div style="clear:both;"></div>
            <!--分页-->
            <div id="page2" class="m-pagination pull-right"></div>
            <input type="hidden" id="totalcount2" value="${totalcount2}"/>
            <input type="hidden" id="pageSize2" value="${pageSize2}"/>
            <input type="hidden" id="urlpage2" value="/BiGeZaiXian/news/toinformationcenter?type=industry"/>

        </div>
    </div>



</div>
<!-- content ----------- 结束 -->
<div class="clearborder"></div>
</div>

<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
<script src="<c:url value='/js/pc/A_public/jquery-1.11.1.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/pc/A_public/bootstrap.min.js'/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/js/commonUtil.js'/>"></script>
<script src="<c:url value='/js/pc/news/informationcenter.js'/>" type="text/javascript"></script>