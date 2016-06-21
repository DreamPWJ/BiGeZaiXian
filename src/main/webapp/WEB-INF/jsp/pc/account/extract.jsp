<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN"><head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
  <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
  <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css"/>
  <link href="<c:url value='/css/pc/account/extract.css'/>" rel="stylesheet" type="text/css">
  <title>个人中心-我的比格-提现</title>

</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<!-- content ----------- 开始 -->
<div class="content">
  <!--地址-->

  <!--左边导航-->
  <%@ include file="../A_public/accountSideMenu.jsp" %><!--左边导航-->


  <!--右侧展示-->
  <div class="R-show">
    <div class="R-BT">
      <div class="R-BT-1">提现</div>
<%--      <div class="R-BT-2"><a href="<c:url value='/account/touserCenter'/>">返回我的聚化</a></div>--%>
    </div>

    <!--充值---总-->
    <div class="Cz">
      <div class="Cz1">
        <div class="Cz1-1">选择银行：</div>
        <div class="Cz1-2">
          <div class="Cz1-2-1"><img src="<c:url value='/images/pc/account/jh.jpg'/>" width="20" height="20"/></div>
          <div class="Cz1-2-2"><samp class="Cz1-2-2-sa">中国建设银行</samp></div>
          <div class="Cz1-2-3"><img src="<c:url value='/images/pc/account/yhsh.png'/>" width="54" height="20"/></div>
          <div class="Cz1-2-4"><samp class="Cz1-2-2-sa">83333</samp></div>
        </div>
        <a href="javascript:GH();">
          <div class="Cz1-3">
            <div class="Cz1-3-1">更换银行&nbsp;&or;</div>
          </div>
        </a>
        <a href="javascript:TJ();">
          <div class="Cz1-4">
            <div class="Cz1-4-1">+&nbsp;银行商户</div>
          </div>
        </a>
      </div>

      <!--更换银行-->
      <div class="ghyh" id="hh1" style="display:none;">
        <div class="ghyh-0">
          <div class="ghyh-1">
            <div class="ghyh-1-1"><input type="radio" name="hyh" style="margin:0px;" value="value" ></div>
            <div class="ghyh-1-2">
              <div class="ghyh-1-2-1"><img src="<c:url value='/images/pc/account/jh.jpg'/>" width="20" height="20"/></div>
              <div class="ghyh-1-2-2"><samp class="ghyh-1-2-2-sa">中国建设银行</div>
            </div>
          </div>
          <div class="ghyh-1">
            <div class="ghyh-1-1"><input type="radio" name="hyh" style="margin:0px;" value="value" ></div>
            <div class="ghyh-1-2">
              <div class="ghyh-1-2-1"><img src="<c:url value='/images/pc/account/zh.jpg'/>" width="20" height="20"/></div>
              <div class="ghyh-1-2-2"><samp class="ghyh-1-2-2-sa">中国银行</div>
            </div>
          </div>
          <div class="ghyh-1">
            <div class="ghyh-1-1"><input type="radio" name="hyh" style="margin:0px;" value="value" ></div>
            <div class="ghyh-1-2">
              <div class="ghyh-1-2-1"><img src="<c:url value='/images/pc/account/jt.jpg'/>" width="20" height="20"/></div>
              <div class="ghyh-1-2-2"><samp class="ghyh-1-2-2-sa">交通银行</div>
            </div>
          </div>
          <div class="ghyh-1">
            <div class="ghyh-1-1"><input type="radio" name="hyh" style="margin:0px;" value="value" ></div>
            <div class="ghyh-1-2">
              <div class="ghyh-1-2-1"><img src="<c:url value='/images/pc/account/rh.jpg'/>" width="20" height="20"/></div>
              <div class="ghyh-1-2-2"><samp class="ghyh-1-2-2-sa">日照银行</div>
            </div>
          </div>
        </div>
        <a href="javascript:QD();">
          <div class="ghyh-2">
            <div class="ghyh-2-1">确定</div>
          </div>
        </a>
      </div>


      <!--添加银行-->
      <div class="ghyh" id="tj1" style="display:none;">
        <div class="ghyh-0">
          <div class="ghyh-1">
            <div class="ghyh-1-1"><input type="radio" name="hyh" style="margin:0px;" value="value" ></div>
            <div class="ghyh-1-2">
              <div class="ghyh-1-2-1"><img src="<c:url value='/images/pc/account/jh.jpg'/>" width="20" height="20"/></div>
              <div class="ghyh-1-2-2"><samp class="ghyh-1-2-2-sa">中国建设银行</div>
            </div>
          </div>
          <div class="ghyh-1">
            <div class="ghyh-1-1"><input type="radio" name="hyh" style="margin:0px;" value="value" ></div>
            <div class="ghyh-1-2">
              <div class="ghyh-1-2-1"><img src="<c:url value='/images/pc/account/zh.jpg'/>" width="20" height="20"/></div>
              <div class="ghyh-1-2-2"><samp class="ghyh-1-2-2-sa">中国银行</div>
            </div>
          </div>
          <div class="ghyh-1">
            <div class="ghyh-1-1"><input type="radio" name="hyh" style="margin:0px;" value="value" ></div>
            <div class="ghyh-1-2">
              <div class="ghyh-1-2-1"><img src="<c:url value='/images/pc/account/jt.jpg'/>" width="20" height="20"/></div>
              <div class="ghyh-1-2-2"><samp class="ghyh-1-2-2-sa">交通银行</div>
            </div>
          </div>
          <div class="ghyh-1">
            <div class="ghyh-1-1"><input type="radio" name="hyh" style="margin:0px;" value="value" ></div>
            <div class="ghyh-1-2">
              <div class="ghyh-1-2-1"><img src="<c:url value='/images/pc/account/rh.jpg'/>" width="20" height="20"/></div>
              <div class="ghyh-1-2-2"><samp class="ghyh-1-2-2-sa">日照银行</div>
            </div>
          </div>
        </div>
        <div class="ghyh-3">
          <div class="ghyh-3-1">请输入银行商户号：</div>
          <input type="text" class="ghyh-3-2">
          <div class="ghyh-3-1">手机号：</div>
          <input type="text" class="ghyh-3-2" placeholder="请输入银行预留手机号">
        </div>

        <a href="javascript:BC();">
          <div class="ghyh-2">
            <div class="ghyh-2-1">保存</div>
          </div>
        </a>
      </div>


      <div class="Cz1">
        <div class="Cz1-1">提现金额：</div>
        <input type="text" class="Cz2-1"/>
        <div class="Cz2-2">元</div>
      </div>


      <div class="Cz1">
        <div class="Cz1-1">支付密码：</div>
        <input type="text" class="Cz2-1"/>
        <div class="Cz3-1"><a href="#">忘记密码？</a></div>
      </div>


      <div class="congzi">
        <button type="button" class="congzi-1">提现</button>
      </div>


    </div>

  </div><!--右侧展示-->


  <div style=" width:100%; height:100px; clear:left; border-bottom:1px solid #E0E0E0; margin-bottom:20px;"></div><!--勿删-->
</div>
<!-- content ----------- 结束 -->
<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
