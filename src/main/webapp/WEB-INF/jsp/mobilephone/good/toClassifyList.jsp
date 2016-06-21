<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap/css/bootstrap.min.css"/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/mobilephone/good/toSpotList.js"/>"></script>
</head>
<script type="text/javascript">
  $(function(){
    var flag = 1; //综合排序
    var more = 0; //默认加载
    var page = 1; //默认第一页
    var page_default = 1; //综合排序第一页
    var page_price = 1; //按价格排序第一页
    var page_sales = 1; //按销量排序第一页
    var comFun = function(){
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
          if(more == 0) {
            $("#content").html(html); //不同排序条件间切换，非加载更多，替换内容
          }
          if(more == 1){
            $("#content").append(html); //加载更多，末尾追加
          }
        }
      });
    };

// 初始化默认按照综合排序,异步获取初始化数据
    var url ="/BiGeZaiXian/good/queryDefalultGoods?type=${type}&page="+page;
    comFun();
    // 综合排序
    $("#default").click(function(){
      flag = 1; //综合排序
      more = 0; //第一次加载（非更多）
      page_default = 1; //第一页
      $("#content_filter").hide();
     url = "/BiGeZaiXian/good/queryDefalultGoods?type=${type}&page="+page_default;
      comFun();
    });
    // 价格
    $("#price").click(function(){
      flag = 2; //按价格排序
      more = 0; //第一次加载（非更多）
      page_price = 1; //第一页
      $("#content_filter").hide();
      url = "/BiGeZaiXian/good/getAjaxComPanyListByPrice?type=${type}&page="+page_price; //按照价格排序
      comFun();
    });
    // 销量
    $("#sales").click(function(){
      flag = 3; //按销量排序
      more = 0; //第一次加载（非更多）
      page_sales = 1; //第一页
      $("#content_filter").hide();
      url = "/BiGeZaiXian/good/getAjaxComPanyListByNumber?type=${type}&page="+page_sales; //按照销量倒序排列
      comFun();
    });
    // 筛选
    $("#filter").click(function(){
      $("#content_filter").toggle();
    });
    // 点击加载下一页
    $("#nextPage").click(function(){
      $(this).text("正在加载中...");
      if(flag == 1){ //综合排序
        page_default += 1;
        more = 1; //加载更多
        $("#content_filter").hide();
        url = "/BiGeZaiXian/good/queryDefalultGoods?type=${type}&page="+page_default;
        comFun();
      }
      if(flag == 2){ //按价格排序
        page_price += 1;
        more = 1; //加载更多
        $("#content_filter").hide();
        url = "/BiGeZaiXian/good/getAjaxComPanyListByPrice?type=${type}&page="+page_price;
        comFun();
      }
      if(flag == 3){ //按销量排序
        page_sales += 1;
        more = 1; //加载更多
        $("#content_filter").hide();
        url = "/BiGeZaiXian/good/getAjaxComPanyListByNumber?type=${type}&page="+page_sales;
        comFun();
      }
      $(this).text("点击加载下一页");
    });

    // 商品分类
    <c:forEach items="${goodKindList}" var="item">
    $("#li_${item.GOODKINDCODE}").click(function(){
      $("#content_filter").hide();
      url = "/BiGeZaiXian/good/getAjaxComPanyListByCondition?type=${type}&condition=${item.GOODKINDCODE}&page=page_goodKind";
      comFun();
    });
    </c:forEach>
    // 用途
    <c:forEach items="${goodUseList}" var="item">
    $("#li_${item.USECODE}").click(function(){
      $("#content_filter").hide();
      url = "/BiGeZaiXian/good/getAjaxComPanyListByCondition?type=${type}&condition=${item.USECODE}";
      comFun();
    });
    </c:forEach>
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
          <li id="default" class="curr">
            <a href="#"><span>综合排序</span></a>
          </li>
          <li id="price">
            <a href="#"><span class="sort">价格</span></a>
          </li>
          <li id="sales">
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
          <li>用途级别<span>全部</span></li>
          <%--<li>包装说明<span>全部</span></li>
          <li>特性级别<span>全部</span></li>
          <li>加工级别<span>全部</span></li>
          <li>价　　格<span>全部</span></li>--%>
        </ul>

        <div class="list-f-result">
          <a href="javascript:void(0);" class="fr blue" id="confirm">确定</a></div>
      </div>
    </section>

    <section class="products-list">
      <ul id="content">

      </ul>
      <button id="nextPage" class="btn btn-large btn-block btn-primary" type="button">点击加载下一页</button>
    </section>
  </section>
  <jsp:include page="../foot_index.jsp"></jsp:include>
</section>
<div class="layer-mask" style="display:none;"></div>
<div class="categories" style="display:none;">
  <ul num="0">
    <li><a href="javascript:void(0);">全部</a></li>
    <c:forEach items="${goodKindList}" var="item">
      <li rel="58" id="li_${item.GOODKINDCODE}">
        <a href="javascript:void(0);">${item.GOODKIND}</a>
      </li>
    </c:forEach>

  </ul>
  <ul num="1" style="display:none;">
    <li><a href="javascript:void(0);">全部</a></li>
    <c:forEach items="${goodUseList}" var="item">
    <li rel="1" id="li_${item.USECODE}"><a href="javascript:void(0);">${item.USE}</a></li>
    </c:forEach>
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

