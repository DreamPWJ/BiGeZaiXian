<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/mobilephone/good/toSpotList.js"/>"></script>
</head>
<script type="text/javascript">
  $(function(){
    $("#filter").click(function(){
      $("#content_filter").toggle();
    });
  });
</script>
<body>
<section class="wrap">
  <a name="top"></a>
  <jsp:include page="../navigation_select.jsp"></jsp:include>
  <section class="list-filter">
    <section class="list-filter-c">
      <div class="list-filter-c-sort">
        <ul>
          <li class="curr">
            <a href="#"><span>综合排序</span></a>
          </li>
          <li>
            <a href="#"><span class="sort">价格</span></a>
          </li>
          <li>
            <a href="#"><span class="sort curr">销量</span></a>
          </li>
          <li id="filter">
            <a href="#"><span class="sort curr">筛选</span></a>
          </li>
        </ul>
      </div>
      <input type="hidden" value="" id="area_id">
      <div id="content_filter" class="list-filter-c-category" style="display:none;">
        <ul>
          <li>分　　类<span>全部</span></li>
          <li>品　　牌<span>全部</span></li>
          <li>用途级别<span>全部</span></li>
          <li>特性级别<span>全部</span></li>
          <li>加工级别<span>全部</span></li>
          <li>价　　格<span>全部</span></li>
        </ul>

        <div class="list-f-result">共 708 条结果
          <a href="javascript:void(0);" class="fr blue" id="confirm">确定</a></div>
      </div>
    </section>
    
    <section class="products-list">
      <ul>
        <li>
          <p class="fl">
            <a href="#"><img src="<c:url value="/images/mobilephone/temporary/title.jpg"/>" width="100%"></a>
          </p>
          <div class="products-list-c">
            <p>牌号：1102K 产地：宁夏神华</p>
            <p class="plc-hi"><a href="#" class="blue">
              PP 1102K</a></p>
            <p class="pt5p"><span class="orange">￥10,850.00</span></p>
          </div>
        </li>
        <li>
          <p class="fl">
            <a href="#"><img src="http://img.sumibuy.com//face/2014/12/1418631281_8925.jpg" width="100%"></a>
          </p>
          <div class="products-list-c">
            <p>牌号：RE420MO 产地：博禄化工</p>
            <p class="plc-hi"><a href="#" class="blue">
              PP RE420MO<span class="red"> </span></a></p>
            <p class="pt5p"><span class="orange">￥10,850.00</span></p>
          </div>
        </li>
        <li>
          <p class="fl">
            <a href="#"><img src="http://img.sumibuy.com//face/2015/05/1432028209_952.jpg" width="100%"></a>
          </p>
          <div class="products-list-c">
            <p>牌号：3084 产地：台塑宁波</p>
            <p class="plc-hi"><a href="#" class="blue">
              PP 3084<span class="red"> </span></a></p>
            <p class="pt5p"><span class="orange">￥10,850.00</span></p>
          </div>
        </li>
      </ul>
      <a href="javascript:void(0);" id="PageNext">点击加载下一页</a>
    </section>
  </section>
  <jsp:include page="../foot_index.jsp"></jsp:include>
</section>
<div class="layer-mask" style="display:none;"></div>
<div class="categories" style="display:none;">
  <ul num="0">
    <li><a href="javascript:void(0);">全部</a></li>
    <li rel="58"><a href="javascript:void(0);">通用塑料</a></li>
    <li rel="3"><a href="javascript:void(0);">其它</a></li>
  </ul>
  <ul num="1" style="display:none;">
    <li><a href="javascript:void(0);">全部</a></li>
    <li rel="1"><a href="javascript:void(0);">宁波台塑</a></li>
    <li rel="4"><a href="javascript:void(0);">伊朗石化</a></li>
    <li rel="81"><a href="javascript:void(0);">马来西亚大藤</a></li>
  </ul>
  <ul num="2" style="display:none;">
    <li><a href="javascript:void(0);">全部</a></li>
    <li rel="1"><a href="javascript:void(0);">食品级</a></li>
  </ul>

  <ul num="3" style="display:none;">
    <li><a href="javascript:void(0);">全部</a></li>
    <li rel="11"><a href="javascript:void(0);">阻燃级</a></li>
    <li rel="12"><a href="javascript:void(0);">透明级</a></li>
    <li rel="13"><a href="javascript:void(0);">增韧级</a></li>
  </ul>

  <ul num="4" style="display:none;">
    <li><a href="javascript:void(0);">全部</a></li>
    <li rel="32"><a href="javascript:void(0);">中空级</a></li>
    <li rel="33"><a href="javascript:void(0);">吹膜级</a></li>
    <li rel="34"><a href="javascript:void(0);">注塑级</a></li>
  </ul>
  <ul num="5" style="display:none;">
    <li><a href="javascript:void(0);">全部</a></li>
    <li><a href="javascript:void(0);">10000-12000元</a></li>
    <li><a href="javascript:void(0);">12000-15000元</a></li>
  </ul>
</div>

<script type="text/javascript">
  var apiHost = "/product/list/productType/Spot";
  $(function(){

    //分页
    $("#PageNext").click(function(){
      $(this).text("正在加载中...");
      getMorePic();
    });

    //搜索
    $("#search").click(function(){
      window.location.href = "/product/list/searchKd/"+$("#searchKd").val();
    });

    $("#city_id").live('change',function(){
      var url = "/product/list/productType/Spot/area_id/"+$(this).val();
      window.location.href = url;
    });

    function sortList(obj){
      obj.click(function(){
        $(this).addClass('curr').siblings().removeClass('curr');
      });
    }

    sortList($('.list-filter-c-sort li'));
    sortList($('.list-filter-c-stock li'));
  });

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

  $(function(){
    $('.list-filter-c-category li').click(function(){

      var oHtmlHeight =  $('html').outerHeight(true);
      $('.layer-mask').css('height',oHtmlHeight);

      $('.categories').show();
      $('.layer-mask').show();
      oIndex = $(this).index();
      $('.categories>ul').eq(oIndex).show().siblings().hide();
      $('.categories').animate({right:'0'},500);
      $('.wrap').animate({marginLeft:'-50%'},500);
    });

    $('.categories li').click(function(){
      var aText = $(this).text();
      var rel = $(this).attr("rel");
      var aIndex= $(this).parents('ul').attr('num');

      $('.categories').animate({right:'-50%'},500);
      $('.wrap').animate({marginLeft:'0'},500,function(){
        $('.list-filter-c-category li').eq(aIndex).find('span').text(aText).attr("rel",rel);
        $('.layer-mask').hide();
        $('.categories').hide();
      });

    });

    $("#confirm").click(function(){

      var data = $(".list-filter-c-category li");

      var cateId = data.eq(0).children("span").attr("rel") != undefined ? data.eq(0).children("span").attr("rel") :0;
      var brandId = data.eq(1).children("span").attr("rel") != undefined ? data.eq(1).children("span").attr("rel") :0;

      var tagIds = data.eq(2).children("span").attr("rel") != undefined ? data.eq(2).children("span").attr("rel") :0;
      tagIds += data.eq(3).children("span").attr("rel") != undefined ? ";"+data.eq(3).children("span").attr("rel") :0;
      tagIds += data.eq(4).children("span").attr("rel") != undefined ? ";"+data.eq(4).children("span").attr("rel") :0;

      var price = data.eq(5).children("span").html() != "全部" ? data.eq(5).children("span").html() :"";

//      var url = "/product/list/productType/Spot/cate_id/"+cateId+"/brand_id/"+brandId+"/tag_id/"+tagIds+"/price/"+price;

      window.location.href = url;
    });
  });
</script>
<div class="top"></div>

<script type="text/javascript">
  $(function(){
    //置顶按钮显示/隐藏实现
    $(window).scroll(function(){
      var w_height = $(window).height();//浏览器高度
      var scroll_top = $(document).scrollTop();//滚动条到顶部的垂直高度
      if(scroll_top > w_height){
        $(".top").fadeIn(500);
      }else{
        $(".top").fadeOut(500);
      }
    });
    //置顶
    $(".top").click(function(e){
      e.preventDefault();
      $(document.documentElement).animate({
        scrollTop: 0
      },200);
      //支持chrome
      $(document.body).animate({
        scrollTop: 0
      },200);
    });
  })
</script>
</body>
</html>
