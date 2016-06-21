<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
</head>
<script style="text/javascript">
  $(function(){
  $("#search_button").click(function(){
    var search_content = $("#search_content").val();
    var url ="/BiGeZaiXian/good/getAjaxSearch?input="+search_content;
    $.ajax({
      type: "GET",
      url: url,
      dataType: "json",
      success: function(data){
        var html = '';
        $.each(data, function(i, item){
          html += '<li> <p class="fl">';
          html += ' <a href="/BiGeZaiXian/good/toStorageGoods?companyId='+item.COMPANYID+'&goodId='+item.GOODID+'">';
          if(item.PICURL != null){
            html +=  '<img alt="这是一张图片" src="/BiGeZaiXian'+item.PICURL+'" style="width: 75px;height: 75px;"></a>';
          } else {
            html +=  '<img alt="这是一张图片" src="/BiGeZaiXian/images/mobilephone/temporary/title.jpg" style="width: 75px;height: 75px;"></a>';
          }
          html += '</p>  <div class="products-list-c">';
          html += ' <p>牌号：'+item.MARK+'&nbsp;&nbsp;&nbsp; 产地：'+item.PRODUCINGAREA+'</p>';
          html += ' <p class="plc-hi"><a href="/BiGeZaiXian/good/toStorageGoods?companyId='+item.COMPANYID+'&goodId='+item.GOODID+'" class="blue">';
          html += '<span style="float: right">'+item.COMPANYNAME+' </span>';
          html += item.GOODKIND+'&nbsp;&nbsp;&nbsp;'+item.MARK+' </a></p>';
          html += ' <p class="pt5p"><span class="orange">￥'+item.PRICEHASTAX+'元/'+item.MEA+'</span></p>';
          html += ' </div> </li>';
        });
        $("#content").html(html);
      }
    });
  });
  });
</script>
<body>
<header class="header-wrap">
  <a href="javascript:history.back()" class="back-off"></a>
  <div class="list-search">
    <input type="text" class="ls-text" placeholder="牌号/品种/厂商" id="search_content" value="">
    <input class="ls-btn" type="button" value="" id="search_button"></div>
  <a href="javascript:void(0);" class="list-bar"></a>
</header>
<section class="list-menu" style="display:none;">
  <ul>
    <li>
      <a href="/BiGeZaiXian">
        <span class="me1-icon mi"><i></i></span>
        <span class="mname">首页</span>
      </a>
    </li>
    <li>
      <a href="">
        <span class="me2-icon mi"><i></i></span>
        <span class="mname">搜索</span>
      </a>
    </li>
    <li>
      <a href="/BiGeZaiXian/user/toCart">
        <span class="me3-icon mi"><i></i></span>
        <span class="mname">购物车</span>
      </a>
    </li>
    <li>
      <a href="/BiGeZaiXian/user/toMyCenter">
        <span class="me4-icon mi"><i></i></span>
        <span class="mname">我的</span>
      </a>
    </li>
  </ul>
</section>
</body>
</html>
