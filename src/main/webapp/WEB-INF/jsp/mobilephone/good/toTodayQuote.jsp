<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/mobilephone/good/toSpotList.js"/>"></script>
  <%--<script type="text/javascript" name="baidu-tc-cerfication" src="http://apps.bdimg.com/cloudaapi/lightapp.js#fa1b660f8a42ec075fc6bc163f9890e9"></script>
  <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>--%>

</head>

<body>
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
  });
  $(document).ready(function(){
    var title ="今日牌价,塑米城-中国首家塑料米自营电商网上商城";
    var link ="http://m.sumibuy.com/event";
    var imgUrl="http://m.sumibuy.com/favicon.jpg";
    var desc="今日牌价,塑米城-中国首家塑料米自营电商网上商城";
    var type ="link";
    var dataUrl ="";

    wx.config({
//            debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
      appId: 'wxacd3c21e4f1582ed', // 必填，公众号的唯一标识
      timestamp:'1439945968', // 必填，生成签名的时间戳
      nonceStr: 'PngJwUi5I9U7MwQn', // 必填，生成签名的随机串
      signature: 'cc418cf40023e1d734fbd8351c8d995562057c86',// 必填，签名，见附录1
      jsApiList: ['checkJsApi','onMenuShareTimeline','onMenuShareAppMessage','onMenuShareQQ','onMenuShareWeibo','hideMenuItems','hideOptionMenu','showOptionMenu'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
    });

    wx.ready(function(){
      wx.onMenuShareTimeline({
        title: title, // 分享标题
        link: link, // 分享链接
        imgUrl: imgUrl, // 分享图标
        success: function (res) {
          alert(JSON.stringify(res));
          // 用户确认分享后执行的回调函数
        },
        cancel: function (res) {
          alert(JSON.stringify(res));
          // 用户取消分享后执行的回调函数
        },
        trigger: function (res) {
          alert('用户点击发送给朋友');
        },

        fail: function (res) {
          alert(JSON.stringify(res));
        }
      });

      wx.onMenuShareAppMessage({
        title: title, // 分享标题
        desc: desc, // 分享描述
        link: link, // 分享链接
        imgUrl:imgUrl, // 分享图标
        type: type, // 分享类型,music、video或link，不填默认为link
        dataUrl: dataUrl, // 如果type是music或video，则要提供数据链接，默认为空
//                success: function () {
//                    onMenuShareAppMessage:ok
//                    // 用户确认分享后执行的回调函数
//                },
//                cancel: function () {
//                    // 用户取消分享后执行的回调函数
//                }
      });
      wx.onMenuShareQQ({
        title: title, // 分享标题
        desc: desc, // 分享描述
        link: link, // 分享链接
        imgUrl: imgUrl, // 分享图标
//                success: function () {
//                    // 用户确认分享后执行的回调函数
//                },
//                cancel: function () {
//                    // 用户取消分享后执行的回调函数
//                }
      });
      wx.onMenuShareWeibo({
        title:title, // 分享标题
        desc: desc, // 分享描述
        link: link, // 分享链接
        imgUrl: imgUrl, // 分享图标
//                success: function () {
//                    // 用户确认分享后执行的回调函数
//                },
//                cancel: function () {
//                    // 用户取消分享后执行的回调函数
//                }
      });

    });
    wx.error(function(res){
      alert(res.errMsg);

    });
  });
</script>

<section class="wrap">
  <a name="top"></a>
  <jsp:include page="../navigation.jsp"></jsp:include>

  <div class="plate-price">
    <h3 class="plate-price-h3"><p class="fl ffw"><i>华南</i>（每天9点准时更新）</p>
      <p class="fr"><i>2015</i>年<i>08</i>月<i>19</i>日</p></h3>
    <table class="plate-price-tab">
      <tbody><tr><th class="fwb">牌号</th><th>厂商</th><th>单价</th><th>库存(吨)</th><th>交货地点</th><th>交货时间</th><th>更新时间</th></tr>
      <tr>
        <td>EGDA-6888</td>
        <td>科威特石化</td>
        <td>10600</td>
        <td>0.000</td>
        <!--<td>期货</td>-->
        <td>珠三角配送</td>
        <td>7月中上旬</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>T10</td>
        <td>印度信诚</td>
        <td>10850</td>
        <td>30.000</td>
        <!--<td>现货</td>-->
        <td>青岛自提</td>
        <td>现货</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>218W</td>
        <td>沙特sabia</td>
        <td>10200</td>
        <td>70.125</td>
        <!--<td>现货</td>-->
        <td>上海自提</td>
        <td>现货</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>EX5</td>
        <td>伊朗石化</td>
        <td>10650</td>
        <td>24.750</td>
        <!--<td>现货</td>-->
        <td>青岛自提</td>
        <td>本周</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>TR144</td>
        <td>卡塔尔石化</td>
        <td>10600</td>
        <td>25.500</td>
        <!--<td>期货</td>-->
        <td>珠三角配送</td>
        <td>7月底8月初</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>7000F</td>
        <td>伊朗石化</td>
        <td>11000</td>
        <td>24.750</td>
        <!--<td>现货</td>-->
        <td>青岛自提</td>
        <td>本周</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>8010</td>
        <td>台湾台塑</td>
        <td>11000</td>
        <td>17.000</td>
        <!--<td>现货</td>-->
        <td>珠三角配送</td>
        <td>现货</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>H110MA</td>
        <td>印度信诚</td>
        <td>9000</td>
        <td>26.000</td>
        <!--<td>期货</td>-->
        <td>珠三角配送</td>
        <td>本周</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>5000S</td>
        <td>泰国PTT</td>
        <td>10900</td>
        <td>18.000</td>
        <!--<td>期货</td>-->
        <td>上海自提</td>
        <td>8月中旬</td>
        <td>3天前</td>
      </tr>
      </tbody>
    </table>

    <h3 class="plate-price-h3"><p class="fl ffw"><i>华东</i>（每天9点准时更新）</p></h3>
    <table class="plate-price-tab">
      <tbody><tr><th class="fwb">牌号</th><th>厂商</th><th>单价</th><th>库存(吨)</th><th>交货地点</th><th>交货时间</th><th>更新时间</th></tr>
      <tr>
        <td>9001</td>
        <td>台湾台塑</td>
        <td>11050</td>
        <td>34.000</td>
        <!--<td>期货</td>-->
        <td>上海</td>
        <td>7.20</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>9001</td>
        <td>台湾台塑</td>
        <td>11100</td>
        <td>10.000</td>
        <!--<td>期货</td>-->
        <td>上海</td>
        <td>7.20</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>9001</td>
        <td>台湾台塑</td>
        <td>11050</td>
        <td>34.000</td>
        <!--<td>期货</td>-->
        <td>上海</td>
        <td>7.20</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>52518</td>
        <td>伊朗石化</td>
        <td>10250</td>
        <td>422.500</td>
        <!--<td>期货</td>-->
        <td>宁波</td>
        <td>7月初</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>LF2119</td>
        <td>伊朗石化</td>
        <td>10800</td>
        <td>222.750</td>
        <!--<td>期货</td>-->
        <td>上海</td>
        <td>6.26</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>5502M</td>
        <td>美国蒙特</td>
        <td>10400</td>
        <td>301.500</td>
        <!--<td>期货</td>-->
        <td>上海</td>
        <td>7月初</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>2231</td>
        <td>沙特APC</td>
        <td>9600</td>
        <td>49.500</td>
        <!--<td>期货</td>-->
        <td>上海</td>
        <td>6.19</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>52518</td>
        <td>伊朗石化</td>
        <td>10400</td>
        <td>297.000</td>
        <!--<td>期货</td>-->
        <td>宁波</td>
        <td>7月初</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>LF2119</td>
        <td>伊朗石化</td>
        <td>10850</td>
        <td>198.000</td>
        <!--<td>期货</td>-->
        <td>上海</td>
        <td>6.26</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>9001</td>
        <td>台湾台塑</td>
        <td>11200</td>
        <td>102.000</td>
        <!--<td>期货</td>-->
        <td>上海</td>
        <td>7.20</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>5502M</td>
        <td>美国蒙特</td>
        <td>10200</td>
        <td>304.500</td>
        <!--<td>期货</td>-->
        <td>上海</td>
        <td>7月初</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>7000F</td>
        <td>伊朗石化</td>
        <td>10650</td>
        <td>38.500</td>
        <!--<td>期货</td>-->
        <td>上海</td>
        <td>7月中</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>LF2119</td>
        <td>伊朗石化</td>
        <td>10850</td>
        <td>198.000</td>
        <!--<td>期货</td>-->
        <td>上海</td>
        <td>6.26</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>9001</td>
        <td>台湾台塑</td>
        <td>11200</td>
        <td>102.000</td>
        <!--<td>期货</td>-->
        <td>上海</td>
        <td>7.20</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>5502M</td>
        <td>美国蒙特</td>
        <td>10100</td>
        <td>354.500</td>
        <!--<td>期货</td>-->
        <td>上海</td>
        <td>7月初</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>2231</td>
        <td>沙特APC</td>
        <td>9600</td>
        <td>99.000</td>
        <!--<td>期货</td>-->
        <td>上海</td>
        <td>6.19</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>9001</td>
        <td>台湾台塑</td>
        <td>11200</td>
        <td>102.000</td>
        <!--<td>期货</td>-->
        <td>上海</td>
        <td>7.20</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>LF2119</td>
        <td>伊朗石化</td>
        <td>10850</td>
        <td>198.000</td>
        <!--<td>期货</td>-->
        <td>上海</td>
        <td>6.26</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>5502M</td>
        <td>美国蒙特</td>
        <td>10200</td>
        <td>354.500</td>
        <!--<td>期货</td>-->
        <td>上海</td>
        <td>7月初</td>
        <td>3天前</td>
      </tr>
      <tr>
        <td>7000F</td>
        <td>伊朗石化</td>
        <td>10700</td>
        <td>187.000</td>
        <!--<td>期货</td>-->
        <td>上海</td>
        <td>7月中</td>
        <td>3天前</td>
      </tr>
      </tbody>
    </table>



  </div>

  <!--content end-->
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
    });
  </script>

  <!--footer stop-->
  <jsp:include page="../foot_index.jsp"></jsp:include>
  <!--footer end-->
</section>

</body></html>
