<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
  <jsp:include page="../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/mobilephone/good/toSpotList.js"/>"></script>
</head>
<body>
<section class="wrap">
  <a name="top"></a>
  <jsp:include page="../navigation_select.jsp"></jsp:include>
  <!--header stop-->
  <section class="list-filter">
    <ul class="list-filter-m">
      <li class="">综合排序</li>
      <li class="curr">库存</li>
      <li>交货地</li>
      <li>筛选</li>
    </ul>

    <section class="list-filter-c">
      <div class="list-filter-c-sort" style="display: none;">
        <ul>
          <li class="curr">
            <a href="#"><span>综合排序</span></a></li>
          <li>
            <a href="#"><span class="sort">价格</span></a>
          </li>

          <li><a href="#"><span class="sort curr">销量</span></a></li>
        </ul>
      </div>
      <div class="list-filter-c-glide" style="">
        <ul>
          <li class=""><a href="#">全部</a></li>
          <li class=""><a href="#">现货</a></li>
          <li class="curr"><a href="#">期货</a></li>
          <li class=""><a href="#">美金盘</a></li>
        </ul>
      </div>
      <div class="list-filter-c-delivery" style="display: none;">
        <select class="new-select fl" id="province_id">

          <option value="46064" selected="selected">上海</option>
          <option value="46063">天津</option>
          <option value="46062">北京</option>
          <option value="31">新疆维吾尔自治区</option>
          <option value="30">宁夏回族自治区</option>
          <option value="29">青海省</option>
          <option value="28">甘肃省</option>
          <option value="27">陕西省</option>
          <option value="26">西藏自治区</option>
          <option value="25">云南省</option>
          <option value="24">贵州省</option>
          <option value="23">四川省</option>
          <option value="22">重庆</option>
          <option value="21">海南省</option>
          <option value="20">广西壮族自治区</option>
          <option value="19">广东省</option>
          <option value="18">湖南省</option>
          <option value="17">湖北省</option>
          <option value="16">河南省</option>
          <option value="15">山东省</option>
          <option value="14">江西省</option>
          <option value="13">福建省</option>
          <option value="12">安徽省</option>
          <option value="11">浙江省</option>
          <option value="10">江苏省</option>
          <option value="8">黑龙江省</option>
          <option value="7">吉林省</option>
          <option value="6">辽宁省</option>
          <option value="5">内蒙古自治区</option>
          <option value="4">山西省</option>
          <option value="3">河北省</option>
        </select>
        <select class="new-select fr" id="city_id">
          <option value="9" selected="selected">上海市</option>
        </select>
      </div>

      <input type="hidden" value="" id="area_id" style="display: none;">
      <div class="list-filter-c-category" style="display: none;">
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
            <a href="/detail/1338">
              <img src="<c:url value="/images/mobilephone/temporary/sumi.jpg"/>" width="100%">
            </a>
          </p>
          <div class="products-list-c">
            <p>
              牌号：10803-020 产地：俄罗斯联化
            </p>
            <p>
              交货地：11月上海
            </p>
            <p class="plc-hi">
              <a href="/detail/1338" class="blue">
                LDPE 10803-020
              </a>
            </p>
            <p class="pt5p">
                    <span class="orange">
                        ￥10,350.00
                    </span>
                    <span class="red" style="margin-left: 20px;">
                        (正品期货)
                    </span>
            </p>
          </div>
        </li>
        <li>
          <p class="fl">
            <a href="/detail/907">
              <img src="<c:url value="/images/mobilephone/temporary/sumi.jpg"/>" width="100%">
            </a>
          </p>
          <div class="products-list-c">
            <p>
              牌号：118W 产地：沙特sabic
            </p>
            <p>
              交货地：11月上海
            </p>
            <p class="plc-hi">
              <a href="/detail/907" class="blue">
                LLDPE 118W
              </a>
            </p>
            <p class="pt5p">
                    <span class="orange">
                        ￥10,350.00
                    </span>
                    <span class="red" style="margin-left: 20px;">
                        (正品期货)
                    </span>
            </p>
          </div>
        </li>
        <li>
          <p class="fl">
            <a href="/detail/55">
              <img src="<c:url value="/images/mobilephone/temporary/sumi.jpg"/>" width="100%">
            </a>
          </p>
          <div class="products-list-c">
            <p>
              牌号：LL7420D 产地：泰国PTT
            </p>
            <p>
              交货地：11月上海
            </p>
            <p class="plc-hi">
              <a href="/detail/55" class="blue">
                LLDPE LL7420D
              </a>
            </p>
            <p class="pt5p">
                    <span class="orange">
                        ￥9,900.00
                    </span>
                    <span class="red" style="margin-left: 20px;">
                        (正品期货)
                    </span>
            </p>
          </div>
        </li>

        <li>
          <p class="fl">
            <a href="/detail/879">
              <img src="<c:url value="/images/mobilephone/temporary/sumi.jpg"/>" width="100%">
            </a>
          </p>
          <div class="products-list-c">
            <p>
              牌号：FS253S 产地：沙特拉比格石化
            </p>
            <p>
              交货地：10月上海
            </p>
            <p class="plc-hi">
              <a href="/detail/879" class="blue">
                LLDPE FS253S
              </a>
            </p>
            <p class="pt5p">
                    <span class="orange">
                        ￥10,400.00
                    </span>
                    <span class="red" style="margin-left: 20px;">
                        (正品期货)
                    </span>
            </p>
          </div>
        </li>
        <li>
          <p class="fl">
            <a href="/detail/32">
              <img src="<c:url value="/images/mobilephone/temporary/sumi.jpg"/>" width="100%">
            </a>
          </p>
          <div class="products-list-c">
            <p>
              牌号：5000S 产地：韩国湖南
            </p>
            <p>
              交货地：11月上海
            </p>
            <p class="plc-hi">
              <a href="/detail/32" class="blue">
                HDPE 5000S
              </a>
            </p>
            <p class="pt5p">
                    <span class="orange">
                        ￥11,050.00
                    </span>
                    <span class="red" style="margin-left: 20px;">
                        (正品期货)
                    </span>
            </p>
          </div>
        </li>
        <li>
          <p class="fl">
            <a href="/detail/816">
              <img src="<c:url value="/images/mobilephone/temporary/sumi.jpg"/>" width="100%">
            </a>
          </p>
          <div class="products-list-c">
            <p>
              牌号：118W 产地：沙特sabic
            </p>
            <p>
              交货地：11月上海
            </p>
            <p class="plc-hi">
              <a href="/detail/816" class="blue">
                LLDPE 118W
              </a>
            </p>
            <p class="pt5p">
                    <span class="orange">
                        ￥10,200.00
                    </span>
                    <span class="red" style="margin-left: 20px;">
                        (正品期货)
                    </span>
            </p>
          </div>
        </li>
        <li>
          <p class="fl">
            <a href="/detail/1171">
              <img src="<c:url value="/images/mobilephone/temporary/sumi.jpg"/>" width="100%">
            </a>
          </p>
          <div class="products-list-c">
            <p>
              牌号：15803 产地：阿塞拜疆
            </p>
            <p>
              交货地：11月上海
            </p>
            <p class="plc-hi">
              <a href="/detail/1171" class="blue">
                LDPE 15803
              </a>
            </p>
            <p class="pt5p">
                    <span class="orange">
                        ￥10,800.00
                    </span>
                    <span class="red" style="margin-left: 20px;">
                        (正品期货)
                    </span>
            </p>
          </div>
        </li>

      </ul>
      <a href="javascript:void(0);" id="PageNext">
        点击加载下一页
      </a>
    </section>


  </section>

  <!--content end-->
  <!--footer stop-->
  <jsp:include page="../foot_index.jsp"></jsp:include>
  <!--footer end-->
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
    <li rel="82"><a href="javascript:void(0);">卡塔尔石化</a></li>
    <li rel="83"><a href="javascript:void(0);">美国陶氏</a></li>
    <li rel="84"><a href="javascript:void(0);">俄罗斯联化</a></li>
    <li rel="85"><a href="javascript:void(0);">阿曼石化</a></li>
    <li rel="86"><a href="javascript:void(0);">沙特APC</a></li>
    <li rel="87"><a href="javascript:void(0);">泰国IRPC</a></li>
    <li rel="88"><a href="javascript:void(0);">沙特sabic</a></li>
    <li rel="89"><a href="javascript:void(0);">北欧化工</a></li>
    <li rel="90"><a href="javascript:void(0);">沙特Tasnee</a></li>
    <li rel="91"><a href="javascript:void(0);">泰国PTT</a></li>
    <li rel="92"><a href="javascript:void(0);">利安德巴塞尔</a></li>
    <li rel="93"><a href="javascript:void(0);">扬子巴斯夫</a></li>
    <li rel="94"><a href="javascript:void(0);">墨西哥PEMEX</a></li>
    <li rel="95"><a href="javascript:void(0);">韩国湖南</a></li>
    <li rel="96"><a href="javascript:void(0);">印度信诚</a></li>
    <li rel="97"><a href="javascript:void(0);">伊朗Arya Sasol</a></li>
    <li rel="98"><a href="javascript:void(0);">中海壳牌</a></li>
    <li rel="99"><a href="javascript:void(0);">马来西亚ETILINAS</a></li>
    <li rel="100"><a href="javascript:void(0);">美国台塑</a></li>
    <li rel="101"><a href="javascript:void(0);">菲律宾NPCA</a></li>
    <li rel="102"><a href="javascript:void(0);">美国雪弗龙菲利普</a></li>
    <li rel="103"><a href="javascript:void(0);">埃及Sidpec</a></li>
    <li rel="104"><a href="javascript:void(0);">科威特石化</a></li>
    <li rel="105"><a href="javascript:void(0);">日本普瑞曼</a></li>
    <li rel="106"><a href="javascript:void(0);">神华化工</a></li>
    <li rel="107"><a href="javascript:void(0);">韩国LG-DOW</a></li>
    <li rel="108"><a href="javascript:void(0);">韩国油化</a></li>
    <li rel="109"><a href="javascript:void(0);">大韩油化</a></li>
    <li rel="110"><a href="javascript:void(0);">印度海尔帝亚</a></li>
    <li rel="111"><a href="javascript:void(0);">LG化学</a></li>
    <li rel="112"><a href="javascript:void(0);">沙特雪佛龙菲利普</a></li>
    <li rel="113"><a href="javascript:void(0);">新加坡菲利普</a></li>
    <li rel="114"><a href="javascript:void(0);">埃克森美孚</a></li>
    <li rel="115"><a href="javascript:void(0);">南非SASOL</a></li>
    <li rel="116"><a href="javascript:void(0);">韩国现代</a></li>
    <li rel="117"><a href="javascript:void(0);">韩国晓星</a></li>
    <li rel="118"><a href="javascript:void(0);">韩国SK</a></li>
    <li rel="120"><a href="javascript:void(0);">乐天化学</a></li>
    <li rel="122"><a href="javascript:void(0);">BP</a></li>
    <li rel="123"><a href="javascript:void(0);">辽宁化纤</a></li>
    <li rel="124"><a href="javascript:void(0);">韩国GS</a></li>
    <li rel="125"><a href="javascript:void(0);">保加利亚卢克</a></li>
    <li rel="126"><a href="javascript:void(0);">三井化学</a></li>
    <li rel="127"><a href="javascript:void(0);">新加坡聚烯烃</a></li>
    <li rel="128"><a href="javascript:void(0);">三菱石化</a></li>
    <li rel="130"><a href="javascript:void(0);">沙特LLDPE</a></li>
    <li rel="131"><a href="javascript:void(0);">扬子石化</a></li>
    <li rel="132"><a href="javascript:void(0);">天津联合</a></li>
    <li rel="133"><a href="javascript:void(0);">乐天华学</a></li>
    <li rel="134"><a href="javascript:void(0);">韩国韩华</a></li>
    <li rel="136"><a href="javascript:void(0);">沙特sabia</a></li>
    <li rel="137"><a href="javascript:void(0);">沙特NATPET</a></li>
    <li rel="138"><a href="javascript:void(0);">沙特QAMAR</a></li>
    <li rel="139"><a href="javascript:void(0);">沙特拉比格</a></li>
    <li rel="140"><a href="javascript:void(0);">日本京叶</a></li>
    <li rel="141"><a href="javascript:void(0);">沙特拉比格石化</a></li>
    <li rel="142"><a href="javascript:void(0);">巴西Braskem</a></li>
    <li rel="143"><a href="javascript:void(0);">美国英力士</a></li>
    <li rel="144"><a href="javascript:void(0);">泰国暹罗</a></li>
    <li rel="145"><a href="javascript:void(0);">埃及</a></li>
    <li rel="149"><a href="javascript:void(0);">伊朗</a></li>
    <li rel="150"><a href="javascript:void(0);">巴西QUATTOR</a></li>
    <li rel="151"><a href="javascript:void(0);">马来西亚PETLIN</a></li>
    <li rel="152"><a href="javascript:void(0);">台湾奇美</a></li>
    <li rel="153"><a href="javascript:void(0);">越南BSR</a></li>
    <li rel="154"><a href="javascript:void(0);">印尼钱德拉阿斯里</a></li>
    <li rel="155"><a href="javascript:void(0);">台湾台塑</a></li>
    <li rel="156"><a href="javascript:void(0);">韩国LG</a></li>
    <li rel="157"><a href="javascript:void(0);">独山子石化</a></li>
    <li rel="158"><a href="javascript:void(0);">福建联合</a></li>
    <li rel="159"><a href="javascript:void(0);">吉林石化</a></li>
    <li rel="160"><a href="javascript:void(0);">兰州石化</a></li>
    <li rel="161"><a href="javascript:void(0);">茂名石化</a></li>
    <li rel="162"><a href="javascript:void(0);">齐鲁石化</a></li>
    <li rel="299"><a href="javascript:void(0);">镇海炼化</a></li>
    <li rel="393"><a href="javascript:void(0);">上海赛科</a></li>
    <li rel="394"><a href="javascript:void(0);">努发克</a></li>
    <li rel="395"><a href="javascript:void(0);">大庆石化</a></li>
    <li rel="519"><a href="javascript:void(0);">西班牙REPSOL</a></li>
    <li rel="579"><a href="javascript:void(0);">日本住友</a></li>
    <li rel="580"><a href="javascript:void(0);">台塑美国</a></li>
    <li rel="581"><a href="javascript:void(0);">燕山石化</a></li>
    <li rel="618"><a href="javascript:void(0);">上海石化</a></li>
    <li rel="619"><a href="javascript:void(0);">上海金菲</a></li>
    <li rel="620"><a href="javascript:void(0);">新加坡埃克森</a></li>
    <li rel="621"><a href="javascript:void(0);">日本JPC</a></li>
    <li rel="622"><a href="javascript:void(0);">三星道达尔</a></li>
    <li rel="623"><a href="javascript:void(0);">科威特EQUATE</a></li>
    <li rel="624"><a href="javascript:void(0);">华锦</a></li>
    <li rel="625"><a href="javascript:void(0);">韩国乐天</a></li>
    <li rel="626"><a href="javascript:void(0);">沙特阿拉伯</a></li>
    <li rel="628"><a href="javascript:void(0);">卡塔尔QATOFIN</a></li>
    <li rel="629"><a href="javascript:void(0);">锦西石化</a></li>
    <li rel="630"><a href="javascript:void(0);">宁夏神华</a></li>
    <li rel="631"><a href="javascript:void(0);">中沙天津</a></li>
    <li rel="632"><a href="javascript:void(0);">辽通化工(原盘锦乙烯)</a></li>
    <li rel="633"><a href="javascript:void(0);">镇海石化</a></li>
    <li rel="634"><a href="javascript:void(0);">台湾化纤</a></li>
    <li rel="635"><a href="javascript:void(0);">武汉石化</a></li>
    <li rel="636"><a href="javascript:void(0);">大连石化</a></li>
    <li rel="637"><a href="javascript:void(0);">大庆炼化</a></li>
    <li rel="638"><a href="javascript:void(0);">抚顺石化</a></li>
    <li rel="639"><a href="javascript:void(0);">海南炼厂</a></li>
    <li rel="640"><a href="javascript:void(0);">华锦化工</a></li>
    <li rel="641"><a href="javascript:void(0);">宁波富德</a></li>
    <li rel="642"><a href="javascript:void(0);">庆阳石化</a></li>
    <li rel="643"><a href="javascript:void(0);">绍兴三圆</a></li>
    <li rel="644"><a href="javascript:void(0);">延安炼厂</a></li>
    <li rel="645"><a href="javascript:void(0);">韩国锦湖</a></li>
    <li rel="647"><a href="javascript:void(0);">Ziiiro</a></li>
    <li rel="648"><a href="javascript:void(0);">Hog Wild</a></li>
    <li rel="649"><a href="javascript:void(0);">Google</a></li>
    <li rel="650"><a href="javascript:void(0);">larklife</a></li>
    <li rel="651"><a href="javascript:void(0);">咔咔</a></li>
    <li rel="652"><a href="javascript:void(0);">Bone</a></li>
    <li rel="653"><a href="javascript:void(0);">Homee</a></li>
    <li rel="654"><a href="javascript:void(0);">时尚元素</a></li>
    <li rel="655"><a href="javascript:void(0);">问童子</a></li>
    <li rel="656"><a href="javascript:void(0);">Twelve South</a></li>
    <li rel="657"><a href="javascript:void(0);">ostric</a></li>
    <li rel="658"><a href="javascript:void(0);">the one</a></li>
    <li rel="659"><a href="javascript:void(0);">IPS</a></li>
    <li rel="660"><a href="javascript:void(0);">tempo drop</a></li>
    <li rel="661"><a href="javascript:void(0);">妄想工作室</a></li>
    <li rel="662"><a href="javascript:void(0);">纸器时代</a></li>
    <li rel="663"><a href="javascript:void(0);">Apple/苹果</a></li>
    <li rel="664"><a href="javascript:void(0);">塑米</a></li>
    <li rel="665"><a href="javascript:void(0);">伊朗JPC</a></li>
    <li rel="666"><a href="javascript:void(0);">沙特聚合物</a></li>
    <li rel="668"><a href="javascript:void(0);">埃克森</a></li>
    <li rel="670"><a href="javascript:void(0);">韩国PolyMirae</a></li>
    <li rel="671"><a href="javascript:void(0);">韩国</a></li>
    <li rel="673"><a href="javascript:void(0);">意大利</a></li>
    <li rel="674"><a href="javascript:void(0);">Michaelkors MK Selma</a></li>
    <li rel="675"><a href="javascript:void(0);">索尼sony</a></li>
    <li rel="677"><a href="javascript:void(0);">博禄化工</a></li>
    <li rel="678"><a href="javascript:void(0);">中煤榆林</a></li>
    <li rel="679"><a href="javascript:void(0);">福建炼化</a></li>
    <li rel="680"><a href="javascript:void(0);">泉港</a></li>
    <li rel="681"><a href="javascript:void(0);">卡塔尔化工</a></li>
    <li rel="682"><a href="javascript:void(0);">阿塞拜疆</a></li>
    <li rel="683"><a href="javascript:void(0);">宁波禾元</a></li>
    <li rel="684"><a href="javascript:void(0);">四川石化</a></li>
    <li rel="685"><a href="javascript:void(0);">榆林</a></li>
    <li rel="686"><a href="javascript:void(0);">托姆斯克</a></li>
    <li rel="687"><a href="javascript:void(0);">中煤宝丰</a></li>
    <li rel="688"><a href="javascript:void(0);">201XV福炼</a></li>
    <li rel="689"><a href="javascript:void(0);">福炼</a></li>
    <li rel="690"><a href="javascript:void(0);">中煤延长</a></li>
    <li rel="691"><a href="javascript:void(0);">加拿大</a></li>
    <li rel="692"><a href="javascript:void(0);">澳大利亚Qenos</a></li>
    <li rel="693"><a href="javascript:void(0);">天津石化</a></li>
    <li rel="694"><a href="javascript:void(0);">中韩石化</a></li>
    <li rel="695"><a href="javascript:void(0);">沙特韩华IPC</a></li>
    <li rel="696"><a href="javascript:void(0);">中石化福炼</a></li>
    <li rel="698"><a href="javascript:void(0);">台塑宁波</a></li>
    <li rel="700"><a href="javascript:void(0);">福建联合石化</a></li>
    <li rel="701"><a href="javascript:void(0);">神华宁煤</a></li>
    <li rel="702"><a href="javascript:void(0);">福建埃克森</a></li>
    <li rel="703"><a href="javascript:void(0);">盘锦乙烯</a></li>
    <li rel="704"><a href="javascript:void(0);">阿联酋</a></li>
    <li rel="705"><a href="javascript:void(0);">菲律宾JGsummit</a></li>
    <li rel="706"><a href="javascript:void(0);">沙特巴塞尔</a></li>
    <li rel="708"><a href="javascript:void(0);">韩国大林</a></li>
    <li rel="709"><a href="javascript:void(0);">建德</a></li>
    <li rel="710"><a href="javascript:void(0);">科隆</a></li>
    <li rel="711"><a href="javascript:void(0);">雪弗龙菲利普斯</a></li>
    <li rel="712"><a href="javascript:void(0);">美国Enron</a></li>
    <li rel="713"><a href="javascript:void(0);">美国埃克森</a></li>
    <li rel="714"><a href="javascript:void(0);">台湾永嘉</a></li>
    <li rel="715"><a href="javascript:void(0);">俄罗斯喀山石化</a></li>
    <li rel="716"><a href="javascript:void(0);">泰国化学</a></li>
    <li rel="717"><a href="javascript:void(0);">中石油大连</a></li>
    <li rel="718"><a href="javascript:void(0);">新加坡</a></li>
    <li rel="719"><a href="javascript:void(0);">加拿大NOVA</a></li>
    <li rel="720"><a href="javascript:void(0);">泰国LRPC</a></li>
    <li rel="721"><a href="javascript:void(0);">海湾石油</a></li>
    <li rel="722"><a href="javascript:void(0);">量子化学</a></li>
    <li rel="723"><a href="javascript:void(0);">蒲城能源</a></li>
    <li rel="724"><a href="javascript:void(0);">美国蒙特</a></li>
    <li rel="725"><a href="javascript:void(0);">美国</a></li>
  </ul>
  <ul num="2" style="display:none;">
    <li><a href="javascript:void(0);">全部</a></li>
    <li rel="1"><a href="javascript:void(0);">食品级</a></li>
    <li rel="2"><a href="javascript:void(0);">薄膜级</a></li>
    <li rel="3"><a href="javascript:void(0);">电子电器部件</a></li>
    <li rel="4"><a href="javascript:void(0);">通用级</a></li>
    <li rel="5"><a href="javascript:void(0);">运动器材</a></li>
    <li rel="6"><a href="javascript:void(0);">汽车部件</a></li>
    <li rel="7"><a href="javascript:void(0);">薄壁制品</a></li>
    <li rel="8"><a href="javascript:void(0);">家电部件</a></li>
    <li rel="9"><a href="javascript:void(0);">纤维</a></li>
    <li rel="10"><a href="javascript:void(0);">电线电缆级</a></li>
    <li rel="42"><a href="javascript:void(0);">电动工具配件</a></li>
    <li rel="45"><a href="javascript:void(0);">型材</a></li>
    <li rel="48"><a href="javascript:void(0);">板材级</a></li>
    <li rel="49"><a href="javascript:void(0);">化妆品</a></li>
    <li rel="50"><a href="javascript:void(0);">家用货品</a></li>
    <li rel="51"><a href="javascript:void(0);">容器</a></li>
  </ul>

  <ul num="3" style="display:none;">
    <li><a href="javascript:void(0);">全部</a></li>
    <li rel="11"><a href="javascript:void(0);">阻燃级</a></li>
    <li rel="12"><a href="javascript:void(0);">透明级</a></li>
    <li rel="13"><a href="javascript:void(0);">增韧级</a></li>
    <li rel="14"><a href="javascript:void(0);">标准级</a></li>
    <li rel="15"><a href="javascript:void(0);">高刚性</a></li>
    <li rel="16"><a href="javascript:void(0);">高强度</a></li>
    <li rel="17"><a href="javascript:void(0);">高流动</a></li>
    <li rel="18"><a href="javascript:void(0);">热稳定性</a></li>
    <li rel="19"><a href="javascript:void(0);">高光泽</a></li>
    <li rel="20"><a href="javascript:void(0);">增强级</a></li>
    <li rel="21"><a href="javascript:void(0);">耐低温</a></li>
    <li rel="22"><a href="javascript:void(0);">耐高温</a></li>
    <li rel="23"><a href="javascript:void(0);">高抗冲</a></li>
    <li rel="24"><a href="javascript:void(0);">高滑动</a></li>
    <li rel="25"><a href="javascript:void(0);">抗紫外线</a></li>
    <li rel="26"><a href="javascript:void(0);">高结晶</a></li>
    <li rel="27"><a href="javascript:void(0);">耐磨</a></li>
    <li rel="28"><a href="javascript:void(0);">抗静电</a></li>
    <li rel="29"><a href="javascript:void(0);">耐水解</a></li>
    <li rel="30"><a href="javascript:void(0);">导电级</a></li>
    <li rel="31"><a href="javascript:void(0);">热稳定</a></li>
    <li rel="40"><a href="javascript:void(0);">抗化学性</a></li>
    <li rel="46"><a href="javascript:void(0);">粉料</a></li>
  </ul>

  <ul num="4" style="display:none;">
    <li><a href="javascript:void(0);">全部</a></li>
    <li rel="32"><a href="javascript:void(0);">中空级</a></li>
    <li rel="33"><a href="javascript:void(0);">吹膜级</a></li>
    <li rel="34"><a href="javascript:void(0);">注塑级</a></li>
    <li rel="35"><a href="javascript:void(0);">挤出级</a></li>
    <li rel="36"><a href="javascript:void(0);">发泡级</a></li>
    <li rel="37"><a href="javascript:void(0);">涂覆级</a></li>
    <li rel="38"><a href="javascript:void(0);">吹塑级</a></li>
    <li rel="39"><a href="javascript:void(0);">拉丝级</a></li>
    <li rel="43"><a href="javascript:void(0);">热熔级</a></li>
    <li rel="44"><a href="javascript:void(0);">脱模级</a></li>
    <li rel="47"><a href="javascript:void(0);">模塑</a></li>
  </ul>
  <ul num="5" style="display:none;">
    <li><a href="javascript:void(0);">全部</a></li>
    <li><a href="javascript:void(0);">10000-12000元</a></li>
    <li><a href="javascript:void(0);">12000-15000元</a></li>
    <li><a href="javascript:void(0);">15000-18000元</a></li>
    <li><a href="javascript:void(0);">18000-20000元</a></li>
    <li><a href="javascript:void(0);">20000-22000元</a></li>
    <li><a href="javascript:void(0);">22000-25000元</a></li>
    <li><a href="javascript:void(0);">28000-40000元</a></li>
  </ul>
</div>

<script src="/js/pic/ProductListPic.js?minify=true"></script>
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

    $('.list-filter-m>li').click(function(){
      var oIndex = $(this).index();
      $(this).addClass('curr').siblings().removeClass('curr');
      $('.list-filter-c>div').eq(oIndex).show().siblings().hide();
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

  $(function(){
    var prurl ="/region/subRegions/id/%d%d";
    $("#province_id").change(function(){
      var v = $("#province_id").val();
      if(v>0){
        $.ajax({
          type: 'GET',
          dataType: 'json',
          url:prurl.replace('%d%d',v),
          success:function(data){
            var str = '<option value="0">请选择....</option>';
            if(data){
              for(a in data){
                str+='<option zip="'+data[a].region_zip+'" areano="'+data[a].region_areano+'" value="'+data[a].region_id+'">'+data[a].region_name+'</option>';
              }
            }
            $("#city_id").html(str);
          }
        });
      }else{
        var str = '<option value="0">请选择....</option>';
        $("#city_id").html(str);
      }
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



</body></html>