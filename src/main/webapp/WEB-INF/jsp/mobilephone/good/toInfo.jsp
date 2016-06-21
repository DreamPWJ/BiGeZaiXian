<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/28 0028
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <%--<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="format-detection" content="telephone=no">
  <link href="favicon.ico" rel="icon" type="image/x-icon">
  <meta http-equiv="Expires" content="-1">
  <meta http-equiv="Cache-Control" content="no-cache">
  <meta http-equiv="Pragma" content="no-cache">
  <meta name="author" content="m.juhuawang.com">
  <title>
    聚化网-中国首家塑料自营电商网上商城
  </title>--%>
  <jsp:include page="../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/mobilephone/good/toSpotList.js"/>"></script>
  <%--<script type="text/javascript" name="baidu-tc-cerfication" src="http://apps.bdimg.com/cloudaapi/lightapp.js#fa1b660f8a42ec075fc6bc163f9890e9">--%>
  <%--</script>--%>
  <%--<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js">--%>
  <%--</script>--%>
</head>
<body>
<section class="wrap">
  <a name="top">
  </a>
  <jsp:include page="../navigation.jsp"></jsp:include>
  <!--header stop-->
  <!--header end-->
  <script type="text/javascript">
    $(function() {
      var aDent = true;
      var oParent = $('.list-bar');
      var oNodeContent = $('.list-menu');
      oParent.click(function() {
        if (aDent) {
          oNodeContent.stop().slideDown(500);
        } else {
          oNodeContent.stop().slideUp(500);
        }
        aDent = !aDent;
      });
    });

    $(function() {
      $('.deatail-hzc li').click(function() {
        var aIndex = $(this).index();
        $(this).addClass('curr').siblings().removeClass('curr');
        $('.deatail-hzc-list>li').eq(aIndex).show().siblings().hide();
      });
    });
  </script>
  <section class="detail-about">
    <ul class="deatail-hzc">
      <li class="curr">
        <a href="javascript:void(0);">
          商品详情
        </a>
      </li>
      <li>
        <a href="javascript:void(0);">
          售后服务
        </a>
      </li>
    </ul>
    <ul class="deatail-hzc-list">
      <li>
        <ul class="pro-item1-list">
          <li>
            产品产地：伊朗石化
          </li>
          <li>
            产品品牌：伊朗石化
          </li>
          <li>
            产品牌号：LL0220KJ
          </li>
          <li>
            用途级别：
          </li>
          <li>
            加工级别：
          </li>
          <li>
            特性级别：
          </li>
          <li>
            包装类型：25公斤/包
          </li>
          <li>
            托盘类型：原厂正牌
          </li>
        </ul>
        <div style="text-align:center;width:750px;">
          <h3 class="pro-item1-h3">
            产品参数
          </h3>
          <table width="98%" cellspacing="1" cellpadding="0" border="0" align="center"
                 class="product_tab">
            <tbody>
            <tr>
              <td nowrap="NOWRAP" colspan="2" class="title_bg2">
                性能项目
              </td>
              <td nowrap="NOWRAP" class="title_bg2">
                试验条件[状态]
              </td>
              <td nowrap="NOWRAP" class="title_bg2">
                测试方法
              </td>
              <td nowrap="NOWRAP" class="title_bg2">
                测试数据
              </td>
              <td nowrap="NOWRAP" class="title_bg2">
                数据单位
              </td>
            </tr>
            <tr>
              <td rowspan="2" class="title_bg3">
                基本性能
              </td>
              <td>
                熔体流动速率
              </td>
              <td>
                190℃/2.16kg
              </td>
              <td>
                ASTM D-1238
              </td>
              <td>
                2.3
              </td>
              <td>
                gr/10min
              </td>
            </tr>
            <tr>
              <td>
                密度
              </td>
              <td>
                &nbsp;
              </td>
              <td>
                ASTM D-1505
              </td>
              <td>
                0.920
              </td>
              <td>
                gr/cm
                <sup>
                  3
                </sup>
              </td>
            </tr>
            <tr>
              <td rowspan="7" class="title_bg3">
                机械性能
              </td>
              <td>
                落锤冲击
              </td>
              <td>
                &nbsp;
              </td>
              <td>
                ASTM D-1709A
              </td>
              <td>
                90
              </td>
              <td>
                g
              </td>
            </tr>
            <tr>
              <td>
                撕裂强度
              </td>
              <td>
                &nbsp;
              </td>
              <td>
                ASTM D-1922
              </td>
              <td>
                <table width="95%">
                  <tbody>
                  <tr>
                    <td>
                      MD
                    </td>
                    <td>
                      TD
                    </td>
                  </tr>
                  <tr>
                    <td width="100">
                      100
                    </td>
                    <td width="100">
                      300
                    </td>
                  </tr>
                  </tbody>
                </table>
              </td>
              <td>
                gr/25µm
              </td>
            </tr>
            <tr>
              <td>
                拉伸屈服强度
              </td>
              <td>
                &nbsp;
              </td>
              <td>
                ASTM D-882
              </td>
              <td>
                <table width="95%">
                  <tbody>
                  <tr>
                    <td>
                      TD
                    </td>
                    <td>
                      MD
                    </td>
                  </tr>
                  <tr>
                    <td width="100">
                      11
                    </td>
                    <td width="100">
                      10
                    </td>
                  </tr>
                  </tbody>
                </table>
              </td>
              <td>
                MPa
              </td>
            </tr>
            <tr>
              <td>
                拉伸断裂强度
              </td>
              <td>
                &nbsp;
              </td>
              <td>
                ASTM D-882
              </td>
              <td>
                <table width="95%">
                  <tbody>
                  <tr>
                    <td>
                      TD
                    </td>
                    <td>
                      MD
                    </td>
                  </tr>
                  <tr>
                    <td width="100">
                      25
                    </td>
                    <td width="100">
                      30
                    </td>
                  </tr>
                  </tbody>
                </table>
              </td>
              <td>
                MPa
              </td>
            </tr>
            <tr>
              <td>
                断裂伸长率
              </td>
              <td>
                &nbsp;
              </td>
              <td>
                ASTM D-882
              </td>
              <td>
                <table width="95%">
                  <tbody>
                  <tr>
                    <td>
                      TD
                    </td>
                    <td>
                      MD
                    </td>
                  </tr>
                  <tr>
                    <td width="100">
                      1100
                    </td>
                    <td width="100">
                      1000
                    </td>
                  </tr>
                  </tbody>
                </table>
              </td>
              <td>
                %
              </td>
            </tr>
            <tr>
              <td>
                正割模量
              </td>
              <td>
                &nbsp;
              </td>
              <td>
                ASTM D-882
              </td>
              <td>
                <table width="95%">
                  <tbody>
                  <tr>
                    <td>
                      TD
                    </td>
                    <td>
                      MD
                    </td>
                  </tr>
                  <tr>
                    <td width="100">
                      100
                    </td>
                    <td width="100">
                      80
                    </td>
                  </tr>
                  </tbody>
                </table>
              </td>
              <td>
                MPa
              </td>
            </tr>
            <tr>
              <td>
                摩擦系数
              </td>
              <td>
                &nbsp;
              </td>
              <td>
                ASTM D-1894
              </td>
              <td>
                0.13
              </td>
              <td>
                &nbsp;
              </td>
            </tr>
            <tr>
              <td rowspan="2" class="title_bg3">
                热性能
              </td>
              <td>
                维卡软化温度
              </td>
              <td>
                &nbsp;
              </td>
              <td>
                ASTM D-1525
              </td>
              <td>
                100
              </td>
              <td>
                ℃
              </td>
            </tr>
            <tr>
              <td>
                熔点
              </td>
              <td>
                &nbsp;
              </td>
              <td>
                BPC
              </td>
              <td>
                123
              </td>
              <td>
                ℃
              </td>
            </tr>
            <tr>
              <td rowspan="2" class="title_bg3">
                光学性能
              </td>
              <td>
                雾度
              </td>
              <td>
                &nbsp;
              </td>
              <td>
                ASTM D-1003
              </td>
              <td>
                12
              </td>
              <td>
                %
              </td>
            </tr>
            <tr>
              <td>
                光泽度
              </td>
              <td>
                45º
              </td>
              <td>
                ASTM D-2457
              </td>
              <td>
                30
              </td>
              <td>
                %
              </td>
            </tr>
            </tbody>
          </table>
          <h3 class="pro-item1-h3">
            原料描述
          </h3>
          <table cellspacing="0" cellpadding="0" class="product_tab">
            <tbody>
            <tr>
              <td width="100">
                规格级别
              </td>
              <td width="114">
                该料用途
              </td>
              <td width="116">
                备注说明
              </td>
              <td width="99">
                外观颜色
              </td>
            </tr>
            <tr>
              <td width="100">
                薄膜 其它
              </td>
              <td width="114">
                麻袋 垃圾袋 消费品包装 农膜
              </td>
              <td width="116">
                好的撕裂强度，高拉伸应力和良好的热粘性
              </td>
              <td>
                　
              </td>
            </tr>
            </tbody>
          </table>
          <h3 class="pro-item1-h3">
            产品介绍
          </h3>
          <img src="http://img.sumibuy.com/detail/2014/14/LL0220KJylsh_02.jpg" alt="">
          <h3 class="pro-item1-h3">
            产品细节
          </h3>
          <img src="http://img.sumibuy.com/detail/2014/14/LL0220KJylsh_04.jpg" alt="">
          <h3 class="pro-item1-h3">
            产品用途
          </h3>
          <img src="http://img.sumibuy.com/detail/2014/14/LL0220KJylsh_06.jpg" alt="">
          <!--公用 Start-->
          <%--<h3 class="pro-item1-h3">--%>
            <%--仓储物流--%>
          <%--</h3>--%>
          <%--<img src="http://img.sumibuy.com/detail/2014/14/gy07.jpg" alt="">--%>
          <%--<h3 class="pro-item1-h3">--%>
            <%--退换货流程--%>
          <%--</h3>--%>
          <%--<img src="http://img.sumibuy.com/detail/2014/14/gy02.jpg" alt="">--%>
          <%--<h3 class="pro-item1-h3">--%>
            <%--服务承诺--%>
          <%--</h3>--%>
          <%--<img src="http://img.sumibuy.com/detail/2014/14/gy03.jpg" alt="">--%>
          <%--<h3 class="pro-item1-h3">--%>
            <%--常见问题--%>
          <%--</h3>--%>
          <%--<img src="http://img.sumibuy.com/detail/2014/14/gy04.jpg" alt="">--%>
          <%--<h3 class="pro-item1-h3">--%>
            <%--发票说明--%>
          <%--</h3>--%>
          <%--<img src="http://img.sumibuy.com/detail/2014/14/gy05.jpg" alt="">--%>
          <%--<h3 class="pro-item1-h3">--%>
            <%--公司介绍--%>
          <%--</h3>--%>
          <%--<img src="http://img.sumibuy.com/detail/2014/14/gy06.jpg" alt="">--%>
          <%--<!--公用 end-->--%>
        </div>
      </li>
      <li style="display:none;">
        <div class="lh30p">
          <h3 class="orange fwb lh30p">
            一、发票的开具
          </h3>
          <p>
            1. 开具发票的金额以实际支付的金额为准。
          </p>
          <p class="pb10p">
            2. 聚化网提供的发票种类有“运输发票”和“增值税发票”两种。
          </p>
          <h3 class="orange fwb lh30p">
            二、运输发票
          </h3>
          <p>
            1. 是要配送货物的情况下，开运输发票。
          </p>
          <p>
            2. 开具运输发票时，抬头默认为收货人“个人姓名”，请需要更改抬头的客户在修改信息中进行修改。
          </p>
          <p>
            3. 在货物提完后才开发票。每个人自然月20号前把货物提完的，发票当月寄出，在每个月20号后才把货物提完的，发票隔月寄出。未提完货物的，不予开发票。运输发票信息与您输入的信息一致的情况下，发票一经开出，恕不退换。
          </p>
          <h3 class="orange fwb lh30p">
            三、增值税专用发票
          </h3>
          <p>
            1.为使客户能及时有效地使用增值税专用发票，请详细填写公司名称、地址、电话、税号、开户银行和帐号，并注意所填的内容须与纳税信息一致。公司名称必须为工商注册登记的
            名称。公司的地址和电话是您开票信息上的地址和电话。税务登记号是您公司《税务登记证》的编号，一般为15位，请仔细核对后输入。开户银行名称与银行帐号两者必须都要填写
            ，缺一不可。
          </p>
          <p>
            2.根据您输入的信息开具增值税专用发票，如影响认证抵扣，聚化网不会受理重新开具增值税专用发票的要求，请务必认真校对开票信息。
          </p>
          <p>
            3.增值税发票应该体现在订单详情里，客户把货物提走后，应该上聚化网点击确认收货，系统下一步就在订单详情里体现当月发票寄出或者隔月发票寄出，客户有要求的，客服
            线下解决。发票说明应该在用户服务协议里规定。
          </p>
          <p>
            4.根据《 国家税务总局关于修订增值税专用发票使用规定的补充通知》（国税发[2007]18号）第一条第三项规定：“因开票有误购买方拒收专用发票的，销售方须在专用发
            票认证期限内向主管税务机关填报申请单，并在申请单上填写具体原因以及相对应蓝字专用发票的信息， 同时提供由购买方出具的写明拒收理由、错误具体项目以及正确内
            容的书面材料，主管税务机关审核确认后出具通知单。销售方凭通知单开具红字专用发票。”
          </p>
          <p>
            1）开具红字发票申请单（敲好章）
          </p>
          <p>
            2）税务登记证副本
          </p>
          <p>
            3）发票
          </p>
          <p>
            4）拒收证明
          </p>
          <p class="pb10p">
            5）经办人身份证
          </p>
          <h3 class="orange fwb lh30p">
            温馨提示：
          </h3>
          <p>
            一个订单不能选择多种发票类型。
          </p>
          <p>
            如果您对以上开票信息有任何疑义，可咨询您公司的财务人员。
          </p>
          <p>
            如果您在收到货物时请检查发票，并在送货签收单上签字，一旦签字即代表您已收到发票，并且发票无误。
          </p>
          <p class="pb10p">
            如果您在收到货物时未收到发票，请您在送货签收单上注明无发票，并及时与我们的客服人员联系，我们会尽快处理。
          </p>
          <h3 class="orange fwb lh30p">
            四、发票的退换
          </h3>
          <p>
            1.如果您收到的发票与您输入的开票信息、订单信息不一致，请先联系我们的客服人员，我们会以最快的速度为你更换正确的发票。
          </p>
          <p>
            2.未经聚化网客服人员的允许，财务部门将不接受电话、传真、邮件、邮寄等形式的重开发票申请，如您擅自将发票寄到我公司的任一办公地址，在寄送过程中发生的发票遗
            失、缺失等情况，恕我们概不负责。
          </p>
        </div>
        <div class="lh30p">
          <h3 class="orange fwb lh30p">
            投诉建议：
          </h3>
          <p style="text-align:justify;">
            衷心地感谢您在百忙之中，通过投诉建议对我们的服务和产品提出宝贵的建议和意见。
            <br>
            您的支持和鼓励是我们不断前进的动力，为了给您提供更加优质的服务, 完善我们的 工作,请您通过以下方式提交您的建议和意见。
            <br>
            您的宝贵意见我们将认真采纳，我们会在3个工作日内，给您明确的回复！因此而给您带来的不便，敬请谅解。
            <br>
            服务热线：
								<span class="orange">
									4009-200-700
								</span>
            邮箱：
								<span class="orange">
									tousu@juhuawang.com
								</span>
          </p>
        </div>
        <div class="lh30p">
          <h3 class="orange fwb lh30p">
            上门自提：
          </h3>
          <p>
            1.支付货款的用户支持上门自提，付完款的客户，会收到短信通知！
          </p>
          <p>
            2.提货时间。(自订单生成客户付款三个工作日内，超过按实际收取仓储费。)
          </p>
          <p>
            3.提货吨数。（客户付款后，可分批提货，每提一次，订单总吨数都会自动减少，直至提完为止。）
          </p>
          <p>
            4.客户需提供提货车号、提货行驶证、提货司机姓名、联系电话、联系手机号码。
          </p>
        </div>
      </li>
    </ul>
  </section>
  <!--content end-->
  <!--footer stop-->
  <footer class="footer">
    <section class="footer-bar">
      <a href="/user/indexLogin">
        登录
      </a>
      <a href="/register/index" class="ml10p">
        注册
      </a>
      <a href="#top" class="fr">
        回到顶部
      </a>
    </section>
    <p class="copyright ffa">
      © m.juhuawang.com
    </p>
    <div style="display: none;">
      <script type="text/javascript">
        var cnzz_protocol = (("https:" == document.location.protocol) ? " https://": " http://");
        document.write(unescape("%3Cspan id='cnzz_stat_icon_1252962129'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s19.cnzz.com/stat.php%3Fid%3D1252962129' type='text/javascript'%3E%3C/script%3E"));
      </script>
					<span id="cnzz_stat_icon_1252962129">
						<a href="http://www.cnzz.com/stat/website.php?web_id=1252962129" target="_blank"
                           title="站长统计">
                          站长统计
                        </a>
					</span>
      <script src=" http://s19.cnzz.com/stat.php?id=1252962129" type="text/javascript">
      </script>
      <script src="http://c.cnzz.com/core.php?web_id=1252962129&amp;t=z" charset="utf-8"
              type="text/javascript">
      </script>
    </div>
  </footer>
  <!--footer end-->
</section>
</body>

</html>
