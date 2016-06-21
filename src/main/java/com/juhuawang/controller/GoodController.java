package com.juhuawang.controller;

import com.alibaba.fastjson.JSONArray;
import com.juhuawang.model.*;
import com.juhuawang.service.interfaces.*;
import com.juhuawang.util.StringHelper;
import com.juhuawang.util.SysConstants;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 商品的Controller
 */
@Controller
@RequestMapping("/good")
public class GoodController {

    @Resource
    private IRegionService regionService;

    @Resource
    IOrderGoodService orderGoodService;

    @Resource
    private IGoodService goodService;

    @Resource
    private IStockService stockService;

    @Resource
    private IGoodDescService goodDescService;

    @Resource
    IAccountService accountService;
    @Resource
    IMarkAdService markAdService;

    /**
     * 商品分类页面
     *
     * @param model
     * @return
     */
    @RequestMapping("/toClassify")
    public String toClassify(Model model) {

        // PE、PP、PVC八个广告位数据
        model.addAttribute("markList_PE", markAdService.queryMarkAdsByType("001%"));//PE
        model.addAttribute("markList_PP", markAdService.queryMarkAdsByType("002%"));//PP
        model.addAttribute("markList_PVC", markAdService.queryMarkAdsByType("003%"));//PVC
        model.addAttribute("headTitle", "商品分类");
        return "mobilephone/good/toClassify";
    }

    /**
     * 根据商品牌号查询
     */
    @RequestMapping("/searchGoodByMark")
    public String searchGoodByMark(String mark, Model model) {
        mark = "%" + mark + "%";
        // 根据商品牌号查询商品信息
        List goodList = goodService.searchGoodByMark(mark.toUpperCase());
        if (goodList == null) {
            model.addAttribute("msg_good", "暂时没有该牌号的商品信息请等待。。。");
        } else {
            model.addAttribute("goodList", goodList);
        }
        model.addAttribute("headTitle", "商品列表");
        return "mobilephone/good/toGoodList";
    }

    /**
     * 商品分类列表页面
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/toClassifyList")
    public String toClassifyList(HttpServletRequest request, Model model, String type) {
        List goodKindList = goodService.queryGoodKindList(type);// 获取所有的商品品种
        List goodUseList = goodService.queryGoodUseList(type);// 获取所有的商品用途

        model.addAttribute("goodKindList", goodKindList);
        model.addAttribute("goodUseList", goodUseList);
        model.addAttribute("type", type);

        return "mobilephone/good/toClassifyList";
    }

    /**
     * 异步获取综合排序的数据
     */
    @RequestMapping("/queryDefalultGoods")
    public void queryDefalultGoods(PrintWriter out, String type, int page) {
        // 综合排序下的商品列表
        type = type + "%";
        int begin = (page - 1) * SysConstants.DEFAULT_PAGE_SIZE + 1;
        int end = page * SysConstants.DEFAULT_PAGE_SIZE;
        List goodList = goodService.queryDefalultGoods(type, begin, end);
        JSONArray jsonArray = (JSONArray) JSONArray.toJSON(goodList);
        out.print(jsonArray);
    }

    /**
     * 异步获取所有PE、PP、PVC商品，按价格排序
     */
    @RequestMapping("/getAjaxComPanyListByPrice")
    public void getAjaxComPanyListByPrice(String type, PrintWriter out, int page) {
        type = type + "%";
        int begin = (page - 1) * SysConstants.DEFAULT_PAGE_SIZE + 1;
        int end = page * SysConstants.DEFAULT_PAGE_SIZE;
        List companyList = goodService.getAjaxComPanyListByPrice(type, begin, end);
        JSONArray jsonArray = (JSONArray) JSONArray.toJSON(companyList);
        out.print(jsonArray);
    }

    /**
     * 异步获取所有PE、PP、PVC商品，按销量倒序排列
     */
    @RequestMapping("/getAjaxComPanyListByNumber")
    public void getAjaxComPanyListByNumber(String type, PrintWriter out, int page) {
        type = type + "%";
        int begin = (page - 1) * SysConstants.DEFAULT_PAGE_SIZE + 1;
        int end = page * SysConstants.DEFAULT_PAGE_SIZE;
        List companyList = goodService.getAjaxComPanyListByNumber(type, begin, end);
        JSONArray jsonArray = (JSONArray) JSONArray.toJSON(companyList);
        out.print(jsonArray);
    }

    /**
     * 筛选：异步获取满足条件的商品
     */
    @RequestMapping("/getAjaxComPanyListByCondition")
    public void getAjaxComPanyListByCondition(String type, String condition, PrintWriter out) {
        type = type + "%";
        List companyList = goodService.getAjaxComPanyListByCondition(type, condition);
        JSONArray jsonArray = (JSONArray) JSONArray.toJSON(companyList);
        out.print(jsonArray);
    }

    /**
     * 搜索：根据牌号、品种、厂商进行模糊查询
     */
    @RequestMapping("/getAjaxSearch")
    public void getAjaxSearch(String input, PrintWriter out) {
        List companyList = goodService.getAjaxSearch("%" + input.toUpperCase() + "%");
        JSONArray jsonArray = (JSONArray) JSONArray.toJSON(companyList);
        out.print(jsonArray);
    }

    /**
     * 现货页面
     */
    @RequestMapping("/toSpotList")
    public String toSpotList() {
        return "mobilephone/good/toSpotList";
    }

    /**
     * 期货页面
     */
    @RequestMapping("/toFutureList")
    public String toFutureList(Model model) {
        // 获取所有的省份
       /* List provinceList = regionService.getAllProvinces();
        if (provinceList != null){
            model.addAttribute("provinceList",provinceList);
        }*/
        return "mobilephone/good/toFutureList";
    }

    /**
     * 根据商品牌号查询商品简单列表（相同供应商、同种商品价格最低的商品列表）
     */
    @RequestMapping("/toGoodList")
    public String toGoodList(String mark, Model model) {
        // 根据商品牌号查询商品信息
        List goodList = goodService.queryGoodsByMark(mark);
        if (goodList == null) {
            model.addAttribute("msg_good", "暂时没有该牌号的商品信息请等待。。。");
        } else {
            model.addAttribute("goodList", goodList);
        }
        model.addAttribute("headTitle", "商品列表");
        return "mobilephone/good/toGoodList";
    }

    /**
     * 根据companyId、goodId按公司仓库分类显示
     */
    @RequestMapping("/toStorageGoods")
    public String toStorageGoods(Model model, long companyId, long goodId, HttpServletRequest request) {
        // 根据companyId、goodId查询该公司下不同仓库地址下商品列表
        long userId = StringHelper.getFrontUserId(request);
        Object good = goodService.getByGoodId(goodId);
        // 获取不同仓库下商品信息
        List storageGoods = goodService.queryGoods(companyId, goodId);

        model.addAttribute("headTitle", "商品列表");
        model.addAttribute("good", good);
        model.addAttribute("companyId", companyId);
        model.addAttribute("goodId", goodId);
        model.addAttribute("storageGoods", storageGoods);
        return "mobilephone/good/toStorageGoods";
    }

    /**
     * 商品详情
     */
    @RequestMapping("/toDetail")
    public String toDetail(Model model, long companyId, long storageId, long goodId, BigDecimal price, BigDecimal onsellNum) {
        Object good = goodService.getByGoodId(goodId);// 根据商品ID查询商品详细信息
        List goodPicList = goodService.queryGoodPicsByGoodId(goodId);// 根据goodId查询商品图片

        // 获取当前商品在售数量
        BigDecimal onsell = goodService.getOnSellCount(companyId, storageId, goodId, price);

        model.addAttribute("companyId", companyId);
        model.addAttribute("storageId", storageId);
        model.addAttribute("goodId", goodId);
        model.addAttribute("price", price);
        model.addAttribute("onsellNum", onsell);
        model.addAttribute("good", good);
        model.addAttribute("goodPicList", goodPicList);
        model.addAttribute("headTitle", "商品详情");

        return "mobilephone/good/toDetail";
    }

    /**
     * 根据省份获取所有的市
     */
    @RequestMapping("/getAjaxCity")
    public void getAjaxCity(HttpServletRequest request, String provinceId, HttpServletResponse response) throws IOException {
        JSONArray json = (JSONArray) JSONArray.toJSON(regionService.getCitysByPid(Long.valueOf(provinceId)));
        System.out.println(json);
        request.setCharacterEncoding("utf-8"); //这里不设置编码会有乱码
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }

    /**
     * 商品信息
     */
    @RequestMapping("/toInfo")
    public String toInfo(Model model) {
        model.addAttribute("headTitle", "详细介绍");
        return "mobilephone/good/toInfo";
    }

    /**
     * 今日牌价
     */
    @RequestMapping("/toTodayQuote")
    public String toTodayQuote(Model model) {
        model.addAttribute("headTitle", "今日牌价");
        return "mobilephone/good/toTodayQuote";
    }

    /**
     * 我的商品
     */
    @RequestMapping("/toMyGoods")
    public String toMyGoods(Model model, HttpServletRequest request) {
        long uid = StringHelper.getFrontUserId(request);
        // 根据用户ID查询商品信息（入库数量、确认数量、库存数量、在售、售出数量）
        List goods = goodService.getGoodByFrontUserId(uid);

        model.addAttribute("goods", goods);
        model.addAttribute("headTitle", "我的商品");
        return "/mobilephone/user/seller/toMyGoods";
    }

    /**
     * 异步获取我的商品数据--用于搜索
     */
    @RequestMapping("/getAjaxMyGoods")
    public void getAjaxMyGoods(String mark, HttpServletRequest request, PrintWriter out) {
        mark = mark.toUpperCase();
        long uid = StringHelper.getFrontUserId(request);
        JSONArray goodList = (JSONArray) JSONArray.toJSON(goodService.queryByUidAndMarkOrGoodKind(uid, mark));
        out.print(goodList);
    }

    /**
     * 我的商品明细
     */
    @RequestMapping("/toMyGoodDetail")
    public String toMyGoodDetail(Model model, long companyId, long goodId, HttpServletRequest request) {
        long userId = StringHelper.getFrontUserId(request);
        // 查询商品的基本信息
        Object good = goodService.getGoodContentByGoodId(goodId, userId);
        // 根据公司ID、商品ID查询仓库列表
        List storageList = goodService.queryStoragesBycompanyIdAndGoodId(companyId, goodId);

        model.addAttribute("companyId", companyId);
        model.addAttribute("goodId", goodId);
        model.addAttribute("good", good);
        model.addAttribute("storageList", storageList);
        model.addAttribute("headTitle", "商品明细");

        return "/mobilephone/user/seller/toMyGoodDetail";
    }

    /**
     * 添加库存
     */
    @RequestMapping("/toAddStock")
    public String toAddStock(HttpServletRequest request, Model model, long companyId, long storageId, long goodId, BigDecimal stockNow, String mea, String storageAddress) {
        Object good = goodService.getGoodContentByGoodId(goodId, StringHelper.getFrontUserId(request));
        // 获取仓库名称
        List storageList = stockService.getStorageNames();

        model.addAttribute("storageList", storageList);
        model.addAttribute("good", good);
        model.addAttribute("companyId", companyId);
        model.addAttribute("storageId", storageId);
        model.addAttribute("goodId", goodId);
        model.addAttribute("stockNow", stockNow);
        model.addAttribute("mea", mea);
        model.addAttribute("storageAddress", storageAddress);
        model.addAttribute("headTitle", "添加库存");

        return "/mobilephone/user/seller/toAddStock";
    }

    /**
     * 库存新增
     */
    @RequestMapping("/addStock")
    public String addStock(HttpServletRequest request, Model model, long companyId, long goodId, BigDecimal stockIn, long storageId, String mea, BigDecimal stockNow, String storageAddress) {
        long userId = StringHelper.getFrontUserId(request);
        stockService.addNewStock(goodId, companyId, storageId, userId, stockIn);

        model.addAttribute("companyId", companyId);
        model.addAttribute("goodId", goodId);
        model.addAttribute("stockNow", stockNow);
        model.addAttribute("mea", mea);
        model.addAttribute("stockIn", stockIn);
        model.addAttribute("storageAddress", storageAddress);
        model.addAttribute("msg_addStock", "新增库存成功");
        return "forward:/good/toAddStock";
    }

    /**
     * 入库明细
     */
    @RequestMapping("/toStockInDetail")
    public String toStockInDetail(HttpServletRequest request, Model model, long companyId, long storageId, long goodId, String storageAddress, String mea) {
        // 商品信息
        Object good = goodService.getGoodContentByGoodId(goodId, StringHelper.getFrontUserId(request));
        // 根据companyId、goodId、storageId查询商品入库数量、确认数量列表
        List stockInDetails = stockService.queryInitNumAndAffirmNum(companyId, storageId, goodId);
        // 商品入库合计
        Object sums = stockService.getInitSumAndAffirmSum(companyId, storageId, goodId);

        model.addAttribute("good", good);
        model.addAttribute("stockInDetails", stockInDetails);
        model.addAttribute("sums", sums);
        model.addAttribute("storageAddress", storageAddress);
        model.addAttribute("mea", mea);
        model.addAttribute("headTitle", "入库明细");
        return "/mobilephone/user/seller/toStockInDetail";
    }

    /**
     * 上架
     */
    @RequestMapping("/toArrival")
    public String toArrival(HttpServletRequest request, Model model, long companyId, long storageId, long goodId, String storageAddress, String mea) {
        // 商品信息
        Object good = goodService.getGoodContentByGoodId(goodId, StringHelper.getFrontUserId(request));
        // 查询当前用户可用的上架数量
        Object availableStock = stockService.getAvailableStockNum(companyId, storageId, goodId);

        model.addAttribute("good", good);
        model.addAttribute("companyId", companyId);
        model.addAttribute("storageId", storageId);
        model.addAttribute("goodId", goodId);
        model.addAttribute("storageAddress", storageAddress);
        model.addAttribute("mea", mea);
        model.addAttribute("availableStock", availableStock);
        model.addAttribute("headTitle", "上架");

        return "/mobilephone/user/seller/toArrival";
    }

    /**
     * 上架保存
     */
    @RequestMapping("/arrival")
    public String arrival(Model model, HttpServletRequest request, long companyId, long storageId, long goodId, BigDecimal upSell, BigDecimal price, String storageAddress, String mea) {
        long userId = StringHelper.getFrontUserId(request);
        String codeNo = StringHelper.getOrderNum();
        String ip = StringHelper.getIpAddr(request);

        stockService.addUpSell(codeNo, userId, companyId, storageId, goodId, price, upSell, ip);// 上架新增
        model.addAttribute("companyId", companyId);
        model.addAttribute("storageId", storageId);
        model.addAttribute("goodId", goodId);
        model.addAttribute("storageAddress", storageAddress);
        model.addAttribute("mea", mea);
        model.addAttribute("price", price);
        model.addAttribute("upSell", upSell);
        model.addAttribute("msg_arrival", "上架成功，等待审核...");

        return "forward:/good/toArrival";
    }

    /**
     * 上架明细
     */
    @RequestMapping("/toArrivalDetail")
    public String toArrivalDetail(HttpServletRequest request, Model model, long companyId, long storageId, long goodId, String storageAddress, String mea) {
        Object good = goodService.getGoodContentByGoodId(goodId, StringHelper.getFrontUserId(request));// 商品信息
        List onSellList = stockService.getOnSellList(companyId, storageId, goodId);// 不同价格下的在售信息
        List upSellDetails = stockService.getUpSellDetails(companyId, storageId, goodId);// 上架详情

        model.addAttribute("companyId", companyId);
        model.addAttribute("storageId", storageId);
        model.addAttribute("goodId", goodId);
        model.addAttribute("good", good);
        model.addAttribute("storageAddress", storageAddress);
        model.addAttribute("mea", mea);
        model.addAttribute("onSellList", onSellList);
        model.addAttribute("upSellDetails", upSellDetails);
        model.addAttribute("headTitle", "上架明细");

        return "/mobilephone/user/seller/toArrivalDetail";
    }

    /**
     * 下架
     */
    @RequestMapping("/toUnShelve")
    public String toUnShelve(HttpServletRequest request, Model model, long companyId, long storageId, long goodId, BigDecimal price, BigDecimal sellSurplus, String storageAddress) {
        Object good = goodService.getGoodContentByGoodId(goodId, StringHelper.getFrontUserId(request));// 商品信息

        model.addAttribute("good", good);
        model.addAttribute("price", price);
        model.addAttribute("companyId", companyId);
        model.addAttribute("storageId", storageId);
        model.addAttribute("goodId", goodId);
        model.addAttribute("sellSurplus", sellSurplus);
        model.addAttribute("storageAddress", storageAddress);
        model.addAttribute("headTitle", "下架");
        return "/mobilephone/user/seller/toUnShelve";
    }

    /**
     * 下架保存
     */
    @RequestMapping("/downSell")
    public String downSell(HttpServletRequest request, Model model, long companyId, long storageId, long goodId, BigDecimal price, BigDecimal num, String storageAddress, BigDecimal sellSurplus) {
        long userId = StringHelper.getFrontUserId(request);
        String stockNo = StringHelper.getOrderNum();
        String ip = StringHelper.getIpAddr(request);
        stockService.addStock(stockNo, companyId, storageId, goodId, price, num, userId, ip, SysConstants.STOCKCODE_DOWNSELL);

        model.addAttribute("companyId", companyId);
        model.addAttribute("storageId", storageId);
        model.addAttribute("goodId", goodId);
        model.addAttribute("price", price);
        model.addAttribute("num", num);
        model.addAttribute("sellSurplus", sellSurplus);
        model.addAttribute("storageAddress", storageAddress);
        model.addAttribute("msg_downSell", "下架成功");
        return "forward:/good/toUnShelve";
    }

    /**
     * 下架明细
     */
    @RequestMapping("/toUnShelveDetail")
    public String toUnShelveDetail(HttpServletRequest request, Model model, long companyId, long storageId, long goodId, BigDecimal price, String storageAddress) {
        Object good = goodService.getGoodContentByGoodId(goodId, StringHelper.getFrontUserId(request));// 商品信息
        // 查询商品下架明细
        List downSellList = stockService.queryDownSellDetails(companyId, storageId, goodId, price, SysConstants.STOCKCODE_DOWNSELL);

        model.addAttribute("downSellList", downSellList);
        model.addAttribute("price", price);
        model.addAttribute("good", good);
        model.addAttribute("storageAddress", storageAddress);
        model.addAttribute("headTitle", "下架明细");
        return "/mobilephone/user/seller/toUnShelveDetail";
    }

    /**
     * 售出明细
     */
    @RequestMapping("/toSellOutDetail")
    public String toSellOutDetail(HttpServletRequest request, Model model, long companyId, long storageId, long goodId, BigDecimal price, String storageAddress) {
        Object good = goodService.getGoodContentByGoodId(goodId, StringHelper.getFrontUserId(request));// 商品信息
        // 查询商品售出明细
        List sellOutList = stockService.queryDownSellDetails(companyId, storageId, goodId, price, SysConstants.STOCKCODE_SELLOUT);

        model.addAttribute("sellOutList", sellOutList);
        model.addAttribute("price", price);
        model.addAttribute("good", good);
        model.addAttribute("storageAddress", storageAddress);
        model.addAttribute("headTitle", "售出明细");
        return "/mobilephone/user/seller/toSellOutDetail";
    }

    /**
     * 库存中心
     */
    @RequestMapping("/toStockCenter")
    public String toStockCenter(Model model, HttpServletRequest request) {
        // 查询入库列表
        long userId = StringHelper.getFrontUserId(request);
        List stockInList = stockService.queryStockInList(userId);

        model.addAttribute("stockInList", stockInList);
        model.addAttribute("headTitle", "库存中心");
        return "/mobilephone/user/seller/toStockCenter";
    }

    /**
     * 异步获取库存中心数据---用于搜索
     */
    @RequestMapping("/getAjaxStockCenter")
    public void getAjaxStockCenter(HttpServletRequest request, String condition, PrintWriter out) {
        condition = "%" + condition + "%";
        long userId = StringHelper.getFrontUserId(request);
        JSONArray jsonArray = (JSONArray) JSONArray.toJSON(stockService.getAjaxStockCenter(userId, condition.toUpperCase()));
        out.print(jsonArray);

    }

    /**
     * 在售商品
     */
    @RequestMapping("/toOnSaleGoods")
    public String toOnSaleGoods(Model model, HttpServletRequest request) {
        long userId = StringHelper.getFrontUserId(request);
        // 查询上架和下架记录
        List sellList = stockService.querySellList(userId);

        model.addAttribute("sellList", sellList);
        model.addAttribute("headTitle", "在售商品");
        return "/mobilephone/user/seller/toOnSaleGoods";
    }

    /**
     * 异步获取在售商品-用于搜索
     */
    @RequestMapping("/getAjaxSellList")
    public void getAjaxSellList(HttpServletRequest request, PrintWriter out, String condition) {
        condition = "%" + condition + "%";
        JSONArray jsonArray = (JSONArray) JSONArray.toJSON(stockService.getAjaxSellList(StringHelper.getFrontUserId(request), condition.toUpperCase()));
        out.print(jsonArray);
    }

    /**
     * PC端 商品产品详情下单页面
     */
    @RequestMapping("/togoodsdetail")
    public String togoodsdetail(HttpServletRequest request, Model model, long goodId, long stockId, BigDecimal sellsurplusnum, long companyId) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("goodId", goodId);
        map.put("stockId", stockId);
        map.put("companyId", companyId);//卖家公司id
        Map<String, Object> resmap = orderGoodService.getOrderDetail(map);
        resmap.put("ONSELLNUM", sellsurplusnum);
        model.addAttribute("orderDetail", resmap);
        FrontUser user = StringHelper.getFrontUser(request);
        if(user == null){//是否登录
            model.addAttribute("msg_login",false);
        } else {
            model.addAttribute("msg_buyer",("001".equals(user.getGuestcode()))?true:false);//是否是购买商
            List list = accountService.getAnnexByguestId(user.getId());//是否上传三证
            if(list.size()==0){
                model.addAttribute("msg_upload",false);
            } else {
                Map annexmap = accountService.getAuditSuccessAnnexByguestId(user.getId());//是否审核通过
                if(annexmap==null){
                    model.addAttribute("msg_check",false);
                }
            }
        }
        return "pc/good/goodsdetail";
    }

    /**
     * PC端 商品产品详情下单页面的图片显示
     */
    @RequestMapping("/showPicture")
    public void showPicture(String pathname, HttpServletResponse response) {
        StringHelper.showFileAsDisk(pathname, response);
    }


    /**
     * pc我的商品跳转
     *
     * @return
     */
    @RequestMapping("/tomyProducts")
    public String tomyProducts(HttpServletRequest request, Model model) {
        int pageNow = request.getParameter("pageIndex") == null ? 1 : Integer.valueOf(request.getParameter("pageIndex"));//当前页
        int pageSize = SysConstants.DEFAULT_PAGE_SIZE;//每页显示多少条记录
        long companyId = StringHelper.getCompanyID(request);
        Map map = orderGoodService.getGoodList(pageNow, pageSize, companyId);
        model.addAttribute("productsModel", map.get("p_cursor"));
        model.addAttribute("totalcount", map.get("myrows"));

        model.addAttribute("pageSize", pageSize);
        model.addAttribute("flag", "我的商品");
        return "pc/good/myProducts";

    }


    /**
     * pc我的商品详情页面跳转
     *
     * @return
     */
    @RequestMapping("/toprodetail")
    public String toprodetail(HttpServletRequest request, Model model, long goodId) {
        model.addAttribute("goodinfo", orderGoodService.getGoodById(goodId));
        model.addAttribute("stocks", stockService.getStocksByGoodId(StringHelper.getCompanyID(request), goodId));
        return "pc/good/prodetail";
    }

    /**
     * pc我的商品发布页面跳转
     *
     * @return
     */
    @RequestMapping("/topublishProduct")
    public String topublishProduct(HttpServletRequest request, Model model) {
        model.addAttribute("goodKindCode", orderGoodService.getGoodKindCode());
        model.addAttribute("goodTypeCode", orderGoodService.getGoodTypeCode());
        model.addAttribute("macCode", orderGoodService.getMacCode());
        model.addAttribute("meaCode", orderGoodService.getMeaCode());
        model.addAttribute("useCode", orderGoodService.getUseCode());
        model.addAttribute("packTypeCode", orderGoodService.getPackTypeCode());
        model.addAttribute("packContent", orderGoodService.getPackContent());
        model.addAttribute("packageCode", orderGoodService.getPackageCode());
        model.addAttribute("storage", orderGoodService.getStoragesForSelect());
        long userid = StringHelper.getFrontUserId(request);//聚化网客户id
        if (userid != 0) {
            Map annexmap = accountService.getAuditSuccessAnnexByguestId(userid);
            if (annexmap == null) {
                model.addAttribute("msg", false);
            } else {
                model.addAttribute("msg", true);
            }
        } else {
            model.addAttribute("msg", false);
        }

        model.addAttribute("flag", "商品发布");
        return "pc/good/publishProduct";
    }


    /**
     * pc我的商品发布和入库保存方法
     *
     * @return
     */
    @RequestMapping("/saveGood")
    public String saveGood(HttpServletRequest request,Model model, Good good, Stock stock, GoodDesc goodDesc, GoodPic goodPic, @RequestParam("filepic") MultipartFile file) {
        String path = SysConstants.GOOD_PICTURES_FILENAME + "/" + StringHelper.getFrontUserLoginName(request) + "/";
        String fileName =StringHelper.getOrderNum()+ file.getOriginalFilename();//获取图片文件原始名称和时间
        File targetFile = new File(path, fileName);//创建目标文件
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        //保存文件到制定的文件下
        try {
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        goodPic.setPicurl(path + fileName);
        long fontUserId = StringHelper.getFrontUserId(request);
        long comanyID = StringHelper.getCompanyID(request);
        String operationIP = StringHelper.getIpAddr(request);
        //组装对象属性
        good.setFrontuserid(fontUserId);
        good.setOperationip(operationIP);
        goodDesc.setSelluserid(fontUserId);
        goodPic.setSelluserid(fontUserId);
        stock.setCompanyid(comanyID);
        stock.setFrontuserid(fontUserId);
        stock.setCodeno(StringHelper.getOrderNum());
        orderGoodService.saveGoodandStock(good, stock, goodDesc, goodPic);
        model.addAttribute("success",true); //是否发布成功
        return "forward:/good/topublishProduct";
    }
}
