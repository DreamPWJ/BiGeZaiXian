package com.juhuawang.controller;


import com.juhuawang.model.FrontUser;
import com.juhuawang.service.interfaces.IAccountService;
import com.juhuawang.service.interfaces.IAdTopService;
import com.juhuawang.service.interfaces.IMarkAdService;
import com.juhuawang.service.interfaces.IStockService;
import com.juhuawang.util.StringHelper;
import com.juhuawang.util.SysConstants;
import com.juhuawang.util.WebCrawlers;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 首页面跳转Controller
 */

@Controller
@RequestMapping("/index")
public class IndexController {

    @Resource
    IStockService stockService;
    @Resource
    IAdTopService adTopService;
    @Resource
    IMarkAdService markAdService;
    @Resource
    IAccountService accountService;

    @RequestMapping("/index")
    public String index(HttpServletRequest request, Model model) {
        // 获取用户注册类型
        FrontUser user = StringHelper.getFrontUser(request);
        if (user != null) {
            model.addAttribute("user", user);
            String regCode = user.getGuestcode();
            if (SysConstants.REGTYPE_SELLER.equals(regCode)) {
                model.addAttribute("msg_seller", "该用户为卖家");
            }
        }

        // 首页轮播图
        model.addAttribute("adList", adTopService.queryAdTopsByType());
        // 两个含有图片的广告位
        model.addAttribute("markPicList_PE", markAdService.queryMarkAdsHasPic("001%"));// PE
        model.addAttribute("markPicList_PP", markAdService.queryMarkAdsHasPic("002%"));// PP
        model.addAttribute("markPicList_PVC", markAdService.queryMarkAdsHasPic("003%"));// PVC
        // PE、PP、PVC八个广告位数据
        model.addAttribute("markList_PE", markAdService.queryMarkAdsByType("001%"));//PE
        model.addAttribute("markList_PP", markAdService.queryMarkAdsByType("002%"));//PP
        model.addAttribute("markList_PVC", markAdService.queryMarkAdsByType("003%"));//PVC
        return "mobilephone/index";
    }

    /**
     * pc首页
     *
     * @return
     */
    @RequestMapping("/pcindex")
    public String pcindex(Model model, HttpServletRequest request) {
        Map<String, Object> argmap = new HashMap<String, Object>();
        //主页上架商品按品种展示 成交动态展示
        argmap.put("goodKindName", "PE");
        Map<String, Object> PE = stockService.getIndexPEPPPVC(argmap);
        model.addAttribute("PE", PE.get("p_cursor"));
        model.addAttribute("PEMarkTotal", PE.get("myrows"));
        model.addAttribute("PEDeal", stockService.getIndexPEPPPVCDeal(argmap).get("p_cursor"));
        argmap.put("goodKindName", "PP");
        Map<String, Object> PP = stockService.getIndexPEPPPVC(argmap);
        model.addAttribute("PP", PP.get("p_cursor"));
        model.addAttribute("PPMarkTotal", PP.get("myrows"));
        model.addAttribute("PPDeal", stockService.getIndexPEPPPVCDeal(argmap).get("p_cursor"));
        argmap.put("goodKindName", "PVC");
        Map<String, Object> PVC = stockService.getIndexPEPPPVC(argmap);
        model.addAttribute("PVC", PVC.get("p_cursor"));
        model.addAttribute("PVCMarkTotal", PVC.get("myrows"));
        model.addAttribute("PVCDeal", stockService.getIndexPEPPPVCDeal(argmap).get("p_cursor"));

        //本周订单情况
        Map<String, Object> PEPPPVCDeal = stockService.getIndexTopPEPPPVCDeal();
        model.addAttribute("PEPPPVCDeal", PEPPPVCDeal.get("p_cursor"));
        model.addAttribute("PEPPPVCDealCount", PEPPPVCDeal.get("myrows"));

        //新闻数据展示
        Map<String, Object> newsargmap = new HashMap<String, Object>();
        newsargmap.put("pageNow", 1);
        newsargmap.put("pageSize", 6);//首页显示6条数据
        // 聚化动态
        newsargmap.put("newscode", "001002");
        model.addAttribute("news001002", stockService.getIndexNews(newsargmap).get("p_cursor"));
        // 市场分析
        newsargmap.put("newscode", "001003");
        model.addAttribute("news001003", stockService.getIndexNews(newsargmap).get("p_cursor"));
        // 行业资讯
        newsargmap.put("newscode", "001004");
        model.addAttribute("news001004", stockService.getIndexNews(newsargmap).get("p_cursor"));

        model.addAttribute("flag", "首页");
        return "pc/index";
    }

    /**
     * pc首页今日油价 网络爬虫异步获取数据
     *
     * @return
     */
    @RequestMapping("/getTodayOilPrices")
    public void getTodayOilPrices(PrintWriter out) {
        //首页打开http请求 影响打开时间  异步请求解决
        out.print(WebCrawlers.getTodayOilPrices());
        out.close();
    }

    /**
     * pc首页登陆页面跳转
     *
     * @return
     */
    @RequestMapping("/tologin")
    public String tologin(HttpServletRequest request) {
        request.getSession().removeAttribute("frontUser");//清除用户登陆信息session
        return "pc/login/login";
    }


    /**
     * pc首页注册页面跳转
     *
     * @return
     */
    @RequestMapping("/toregister")
    public String toregister() {
        return "pc/login/register";
    }

    /**
     * pc首页供应商模块跳转
     *
     * @return
     */
    @RequestMapping("/tosupplier")
    public String tosupplier(Model model) {
        model.addAttribute("flag", "供应商");
        return "pc/provider/supplier";
    }

    /**
     * pc首页聚融宝模块跳转
     *
     * @return
     */
    @RequestMapping("/toservice")
    public String toservice(Model model) {
        model.addAttribute("flag", "聚融宝");
        return "pc/jurongbao/service";
    }

    /**
     * pc首页发布求购模块跳转
     *
     * @return
     */
    @RequestMapping("/toreleaseFor")
    public String toreleaseFor(Model model) {
        model.addAttribute("flag", "发布求购");
        return "pc/other/releaseFor";
    }

    /**
     * pc首页公司简介模块跳转
     *
     * @return
     */
    @RequestMapping("/tocompanyProfile")
    public String tocompanyProfile(Model model) {
        model.addAttribute("flag", "公司简介");
        return "pc/other/companyProfile";
    }

    /**
     * pc首页关于我们模块跳转
     *
     * @return
     */
    @RequestMapping("/toaboutUs")
    public String toaboutUs(Model model) {
        model.addAttribute("flag", "关于我们");
        return "pc/other/aboutUs";
    }

    /**
     * pc首页新手指南模块跳转
     *
     * @return
     */
    @RequestMapping("/touserGuides")
    public String touserGuides(Model model) {
        model.addAttribute("flag", "新手指南");
        return "pc/other/userGuide";
    }

    /**
     * pc首页帮助中心跳转
     *
     * @return
     */
    @RequestMapping("/toprotocol")
    public String toprotocol() {
        return "pc/login/protocol";
    }

    /**
     * pc首页帮助中心投诉建议跳转
     *
     * @return
     */
    @RequestMapping("/tocomplaintsSuggestions")
    public String tocomplaintsSuggestions() {
        return "pc/other/complaintsSuggestions";
    }

    /**
     * pc首页帮助中心在线支付跳转
     *
     * @return
     */
    @RequestMapping("/toonlinePay")
    public String toonlinePay() {
        return "pc/other/onlinePay";
    }

    /**
     * pc首页帮助中心提货说明跳转
     *
     * @return
     */
    @RequestMapping("/todeliveryInstructions")
    public String todeliveryInstructions() {
        return "pc/other/deliveryInstructions";
    }

    /**
     * pc首页帮助中心发票说明跳转
     *
     * @return
     */
    @RequestMapping("/toinvoiceShows")
    public String toinvoiceShows() {
        return "pc/other/invoiceShows";
    }

    /**
     * pc首页帮助中心退换货跳转
     *
     * @return
     */
    @RequestMapping("/toreturnProcess")
    public String toreturnProcess() {
        return "pc/other/returnProcess";
    }


    /**
     * pc消息中心跳转
     *
     * @return
     */
    @RequestMapping("/tomsgCenter")
    public String tomsgCenter(Model model, HttpServletRequest request) {
        long userid = StringHelper.getFrontUserId(request);//聚化网客户id
        Map flagmap=new HashMap();
       /* 查看三证是否上传和状态*/
        List list = accountService.getAnnexByguestId(userid);
        flagmap.put("isUploadCredentials",list.isEmpty()||list==null?false:true);
        /*查看三证是否上传成功*/
        List listSucess = accountService.getSuccessAnnexByguestId(userid);
        flagmap.put("isSuccessCredentials",listSucess.isEmpty()||listSucess==null?false:true);
       /* 查看三证是否审核通过成功*/
        Map annexmap = accountService.getAuditSuccessAnnexByguestId(userid);
        flagmap.put("isCheckCredentials",annexmap==null || annexmap.isEmpty()?false:true);
        model.addAttribute("flagmap", flagmap);
        model.addAttribute("flag", "消息中心");
        return "pc/news/msgCenter";
    }

    /**
     * pc帮你找货跳转
     *
     * @return
     */
    @RequestMapping("/tolookingfor")
    public String tolookingfor(Model model) {
        model.addAttribute("flag", "帮你找货");
        return "pc/good/lookingfor";
    }

    /**
     * pc提示升级IE浏览器
     *
     * @return
     */
    @RequestMapping("/toupdateIE")
    public String totoupdateIE() {
        return "pc/other/updateIe";
    }

    /**
     * pc友情链接
     *
     * @return
     */
    @RequestMapping("/toallLinks")
    public String toallLinks() {
        return "pc/other/allLinks";
    }

    /**
     * pc找回密码
     *
     * @return
     */
    @RequestMapping("/tofindPassword")
    public String tofindPassword() {
        return "pc/login/findPassword";
    }

    /**
     * pc新闻公共模板
     *
     * @return
     */
    @RequestMapping("/tonews")
    public String tonews(long id,String code, Model model) {
        model.addAttribute("newsdetails", stockService.getIndexNewsdetails(id));
        model.addAttribute("code",code);    //行业类别
        return "pc/news/news";
    }

    /**
     * pc法律声明
     *
     * @return
     */
    @RequestMapping("/tolegalNotices")
    public String tolegalNotices(Model model) {
        return "pc/other/legalNotices";
    }

    /**
     * pc隐私声明
     *
     * @return
     */
    @RequestMapping("/toprivacyStatement")
    public String toprivacyStatement(Model model) {
        return "pc/other/privacyStatement";
    }

    /**
     * pc首页联系我们模块跳转
     *
     * @return
     */
    @RequestMapping("/tocontactUs")
    public String tocontactUs(Model model) {
        model.addAttribute("flag", "联系我们");
        return "pc/other/contactUs";
    }
}

