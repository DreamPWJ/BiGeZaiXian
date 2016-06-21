<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<link href="<c:url value='/css/pc/A_public/foot.css'/>" rel="stylesheet" type="text/css"/>

<!--底部------------------------------------开始-->
<div class="bottom">
    <!-- foot -->
    <div class="xfoot">
        <div class="row">

            <div class="col-xs-4 xfoot1">
                <div class="xfoot1_title"><i class="fa fa-plane"></i>供应求购</div>
                <div class="xfoot1_cnt">
                    <p><a href="javascript:void(0);" title="发布供应">发布供应</a></p>

                    <p><a href="<c:url value='/index/toreleaseFor'/>" title="发布求购">发布求购</a></p>

                    <p><a href="javascript:void(0);" title="商家入驻">商家入驻</a></p>
                </div>
            </div>
            <div class="col-xs-4 xfoot2">
                <div class="xfoot1_title"><i class="fa fa-truck"></i>支付与配送</div>
                <div class="xfoot1_cnt" style="line-height: 22px;">
                    <p><a href="<c:url value='/index/toonlinePay'/>" target="_blank"
                          title="比格在线在线支付">在线支付</a></p>

                    <p><a href="<c:url value='/order/toorderCenter'/>" title="订单查询">订单查询</a></p>

                    <p><a href="javascript:void(0);" title="公司转账">公司转账</a></p>
                </div>
            </div>
            <div class="col-xs-4 xfoot3">
                <div class="xfoot1_title"><i class="fa fa-heart"></i> 售后服务</div>
                <div class="xfoot1_cnt" style="line-height: 22px;">
                    <p><a href="<c:url value='/index/tocomplaintsSuggestions'/>" target="_blank"
                          title="比格在线投诉建议">投诉建议</a></p>

                    <p><a href="<c:url value='/index/todeliveryInstructions'/>" target="_blank" title="比格在线提货说明">提货说明</a>
                    </p>

                    <p><a href="<c:url value='/index/toinvoiceShows'/>" target="_blank" title="比格在线发票说明">发票说明</a>
                    </p>

                </div>
            </div>


        </div>
        <!-- floor   -->
        <div class="xfloor">
            <div class="xfloor1">
                <a href="<c:url value='/index/tocontactUs'/>">联系我们</a>
                <a href="#">人才招聘</a>
                <a href="#">社会责任</a>
                <a href="<c:url value="/index/tolegalNotices"/> ">法律声明</a>
                <a href="<c:url value="/index/toprivacyStatement"/> ">隐私声明</a>
            </div>
            <div class="xfloor2">
                &copy;山东比格电子商务有限公司&nbsp;&nbsp;
                版权所有 <%--鲁ICP备15000858号-1 All Rights Reserved--%>
                &nbsp;&nbsp;&nbsp;&nbsp;
      <%--          <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
                document.write(unescape("%3Cspan id='cnzz_stat_icon_1255168476'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1255168476%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
                &nbsp;&nbsp;在线人数:${onLines}--%>
            </div>
<%--            <div class="bott3">
                <div class="bott31">
                    <div class="col-xs-offset-2 col-xs-2 ">
                        <a href="http://webscan.360.cn/index/checkwebsite/url/www.juhuawang.com"><img border="0" src="http://img.webscan.360.cn/status/pai/hash/1942216baaf2442b02c4ed589ab2ee24"/></a>
                    </div>
                    <div class="col-xs-2 " > <img border="0" src="<c:url value='/images/pc/A_public/floor32.jpg'/>" /></div>
                    <div class="col-xs-2" ><span id="kx_verify"></span><script type="text/javascript">(function (){var _kxs = document.createElement('script');_kxs.id = 'kx_script';_kxs.async = true;_kxs.setAttribute('cid', 'kx_verify');_kxs.src = ('https:' == document.location.protocol ? 'https://ss.knet.cn' : 'http://rr.knet.cn')+'/static/js/icon3.js?sn=e150814371100599253vcr000000&tp=icon3';_kxs.setAttribute('size', 0);var _kx = document.getElementById('kx_verify');_kx.parentNode.insertBefore(_kxs, _kx);})();</script> </div>
                    <div class="col-xs-2">
                        <a id="_pingansec_bottomimagelarge_shiming" href="http://si.trustutn.org/info?
                    sn=961150827016675703032"><img  src="http://v.trustutn.org/images/cert/bottom_large_img.png"/></a>
                    </div>
                </div>
            </div>--%>

        </div>
    </div>
    <!--底部------------------------------------结束-->
    <%--     loading动画效果  --%>
    <div id="loader">
        <div class="loading">
            <i></i>
            <i></i>
            <i></i>
            <i></i>
            <i></i>
            <i></i>
            <i></i>
            <i></i>
        </div>
    </div>
</div>

<script type="text/javascript">
    //dom加载完毕 不需要加载完图片
    $(function () {
        //加载完成移除loading动画效果
        $("#loader").remove();
    })
</script>