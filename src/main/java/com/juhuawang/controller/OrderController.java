package com.juhuawang.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.juhuawang.model.*;
import com.juhuawang.service.interfaces.*;
import com.juhuawang.util.StringHelper;
import com.juhuawang.util.SysConstants;
import com.juhuawang.util.pay.Dom4jUtils;
import com.juhuawang.util.pay.rizhao.RSAUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 1250052380@qq.com on 2014/11/14.
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    @Resource
    private ICartService cartService;
    @Resource
    private IOrderService orderService;
    @Resource
    private IGoodService goodService;
    @Resource
    private IStockService stockService;
    @Resource
    private IOrderStockService orderStockService;
    @Resource
    private IOrderGoodService orderGoodService;


    /**
     * 手机版直接下单页面
     */
    @RequestMapping("/toOrder")
    public String toOrder(Model model, HttpServletRequest request, long companyId, long storageId, long goodId, BigDecimal price, BigDecimal number, BigDecimal onsellNum, String source) {
        // 获取当前用户
        HttpSession session = request.getSession();
        FrontUser user = (FrontUser) session.getAttribute("frontUser");
        if (user == null) {
            // 去登录
            return "redirect:/user/toLogin";
        }

        model.addAttribute("companyId", companyId);
        model.addAttribute("storageId", storageId);
        model.addAttribute("goodId", goodId);
        model.addAttribute("price", price);
        if (!user.getGuestcode().equals(SysConstants.REGTYPE_BUYER)) {
            model.addAttribute("onsellNum", onsellNum);
            model.addAttribute("msg_guest", "您的账号属于供应商不能购买商品，请使用购买商账号进行购买");
            return "forward:/good/toDetail";
        }

        Object good = goodService.getToOrderGoodContent(goodId);// 根据商品ID查询订单页面商品详细信息

        // TODO 检查用户账户余额

        model.addAttribute("headTitle", "提交订单");
        model.addAttribute("good", good);
        model.addAttribute("number", number);
        model.addAttribute("source", source);
        model.addAttribute("account",10000);// 账户余额
        return "mobilephone/order/toOrder";
    }

    /**
     * 扣除保证金确认页面
     */
    @RequestMapping("/toConfirmMargin")
    public String toConfirmMargin(Model model){

        model.addAttribute("headTitle","冻结保证金");
        return "mobilephone/order/toConfirmMargin";
    }

    /**
     * 扣除保证金
     */
    @RequestMapping("/toPayMargin")
    public String toPayMargin(HttpServletRequest request,Model model,long companyId,long storageId,long goodId,BigDecimal price,BigDecimal number,String source){
        // 生成订单
        long userId = StringHelper.getFrontUserId(request);// 获取当前登录用户
        String ip = StringHelper.getIpAddr(request);

        // 订单表(rec_Order)新增数据
        String orderNo = StringHelper.getOrderNum();
        orderService.addOrder(orderNo, userId, ip, source, SysConstants.ORDERSTATUS_NOPAY);

        // 新增库存记录
        String stockNo = StringHelper.getOrderNum();
        stockService.addStock(stockNo, companyId, storageId, goodId, price, number, userId, ip, SysConstants.STOCKCODE_SELLOUT);

        // 新增订单_库存表记录
        long orderId = orderService.getIdByOrderNo(orderNo); // 查询订单ID
        long stockId_New = stockService.getStockIdByCodeNo(stockNo); // 查询库存ID
        orderStockService.insertSelective(stockId_New, orderId, userId, ip);// 订单_库存新增记录

        model.addAttribute("companyId", companyId);
        model.addAttribute("storageId", storageId);
        model.addAttribute("goodId", goodId);
        model.addAttribute("price", price);
        model.addAttribute("number", number);
        model.addAttribute("source", source);


        model.addAttribute("orderNo",orderNo);
        model.addAttribute("headTitle","支付货款");
        return "mobilephone/order/toPayMargin";
    }

    /**
     * 订单支付
     */
    @RequestMapping("/toPayOrder")
    public String toPayOrder(Model model,long companyId,long storageId,long goodId,BigDecimal price,BigDecimal number,String source){

        // 订单支付

        // 支付成功
        model.addAttribute("headTitle","支付成功");
        return "mobilephone/order/toPaySuccess";
    }

    /**
     * 购物车订单确认页面
     */
    @RequestMapping("/toCartOrder")
    public String toCartOrder(HttpServletRequest request,Model model,String num,String cartId_checked,String stockId_checked,String cartId_unchecked,String stockId_unchecked){
        // 获取购物车中选中的商品信息和数量
        String[] nums = num.split(",");
        String[] cartIds_checked = cartId_checked.split(",");
        String[] cartIds_unchecked = cartId_unchecked.split(",");
        String[] stockIds_unchecked = stockId_unchecked.split(",");

        // 遍历修改相关的购物车信息
        for (int i=0;i<nums.length;i++){
            for (int j=0;j<cartIds_checked.length;j++){
                if(i==j){
                    stockService.updateCartNum(new BigDecimal(nums[i]),Long.parseLong(cartIds_checked[j]));// 修改rec_stock表中的数量
                }
            }
        }
        // 设置没选中的购物车(rec_cart)记录为无效
        for (int i=0;i<cartIds_unchecked.length;i++){
            Cart cart = cartService.selectByPrimaryKey(Long.parseLong(cartIds_unchecked[i]));
            cart.setStatuscode(SysConstants.STATUSCODE_INVALID);
            cartService.updateByPrimaryKeySelective(cart);
        }
        // 设置没选中的库存表(rec_stock)记录为无效
        for (int i=0;i<stockIds_unchecked.length;i++){
            Stock stock = stockService.selectByPrimaryKey(Long.parseLong(stockIds_unchecked[i]));
            stock.setStatuscode(SysConstants.STATUSCODE_INVALID);
            stockService.updateByPrimaryKeySelective(stock);
        }
        model.addAttribute("headTitle","我的订单");
        return "mobilephone/order/toCartOrder";
    }

    /**
     * 直接下单
     */
    @RequestMapping("/order")
    public String order(Model model, HttpServletRequest request, long companyId, long storageId, long goodId, BigDecimal price, BigDecimal number, String source) {

        // 转移到扣除保证金方法(toPayMargin)中
        /*// 获取当前登录用户
        long userId = StringHelper.getFrontUserId(request);
        String ip = StringHelper.getIpAddr(request);

        // 订单表(rec_Order)新增数据
        String orderNo = StringHelper.getOrderNum();
        orderService.addOrder(orderNo, userId, ip, source, SysConstants.ORDERSTATUS_NOPAY);

        // 新增库存记录
        String stockNo = StringHelper.getOrderNum();
        stockService.addStock(stockNo, companyId, storageId, goodId, price, number, userId, ip, SysConstants.STOCKCODE_SELLOUT);

        // 新增订单_库存表记录
        long orderId = orderService.getIdByOrderNo(orderNo); // 查询订单ID
        long stockId_New = stockService.getStockIdByCodeNo(stockNo); // 查询库存ID
        orderStockService.insertSelective(stockId_New, orderId, userId, ip);// 订单_库存新增记录*/

        model.addAttribute("companyId", companyId);
        model.addAttribute("storageId", storageId);
        model.addAttribute("goodId", goodId);
        model.addAttribute("price", price);
        model.addAttribute("number", number);
        model.addAttribute("source", source);

        if (SysConstants.ORDER_SOURCE_SHOPCART.equals(source)) {
//            return "forward:/user/toCartHasGoods?orderNo=" + orderNo;
        } else if (SysConstants.ORDER_SOURCE_ORDERDIRECT.equals(source)) {
            // 进入确认冻结保证金页面
            return "forward:/order/toConfirmMargin";
        }
        return null;
    }

    /**
     * 加入购物车
     */
    @RequestMapping("/addToCart")
    public String addToCart(Model model, HttpServletRequest request, long companyId, long storageId, long goodId, BigDecimal price, BigDecimal number, BigDecimal onsellNum, String source) {
        // 获取当前用户
        HttpSession session = request.getSession();
        FrontUser user = (FrontUser) session.getAttribute("frontUser");
        if (user == null) {
            // 去登录
            return "redirect:/user/toLogin";
        }
        model.addAttribute("price", price);
        if (!user.getGuestcode().equals(SysConstants.REGTYPE_BUYER)) {
            model.addAttribute("companyId", companyId);
            model.addAttribute("storageId", storageId);
            model.addAttribute("goodId", goodId);
            model.addAttribute("onsellNum", onsellNum);
            model.addAttribute("msg_guest", "您的账号属于供应商不能购买商品，请使用购买商账号进行购买");
            return "forward:/good/toDetail";
        }

        // 是否已经存在，若存在则直接修改库存表的数量，不存在则进行新增
        Long stockId = cartService.getCount(user.getId(),companyId,storageId,goodId,price);
        if (stockId != null){
            // 修改库存表数量
            Stock stock = stockService.getStockByStockId(stockId);
            stock.setInitnum(BigDecimal.valueOf((stock.getAffirmnum()).doubleValue()+number.doubleValue()));
            stock.setAffirmnum(BigDecimal.valueOf((stock.getAffirmnum()).doubleValue()+number.doubleValue()));
            stockService.updateByPrimaryKeySelective(stock);
        } else {
            String ip = StringHelper.getIpAddr(request);
            // 新增库存记录
            String stockNo = StringHelper.getOrderNum();
            stockService.addStock(stockNo, companyId, storageId, goodId, price, number, user.getId(), ip, SysConstants.STOCKCODE_CART);// 新增库存表记录

            // 商品加入购物车
            stockId = stockService.getStockIdByCodeNo(stockNo); // 查询库存ID
            String cartNo = StringHelper.getOrderNum();//获取购物车编号
            cartService.newCart(cartNo, stockId, user.getId(), ip);
        }

        Object good = goodService.getToOrderGoodContent(goodId);

        // 查询该用户购物车所有商品信息
        List cartList = cartService.queryByFrontUserId(user.getId());
        JSONArray jsonArray = (JSONArray) JSONArray.toJSON(cartList);

        model.addAttribute("number", number);
        model.addAttribute("good", good);
        model.addAttribute("headTitle", "购物车");
        model.addAttribute("cartList", cartList);
        model.addAttribute("jsonArray", jsonArray);

        // 购物车商品列表页面
        return "mobilephone/user/toCartHasGoods";
    }

    /**
     * 待支付订单页面
     */
    @RequestMapping("/toOrderNoPay")
    public String toOrderNoPay(HttpServletRequest request, Model model) {
        long uid = StringHelper.getFrontUserId(request);
        // 根据用户ID查询待支付订单
        List orderList = orderService.queryOrderByUidAndStatus(uid, SysConstants.ORDERSTATUS_NOPAY);
        if (orderList != null) {
            model.addAttribute("orderList", orderList);
        }
        model.addAttribute("headTitle", "个人中心-待支付订单");
        return "/mobilephone/user/buyer/toOrderNoPay";
    }

    /**
     * 卖家订单中心
     */
    @RequestMapping("/toSellerOrderCenter")
    public String toSellerOrderCenter(Model model, HttpServletRequest request) {
        long userId = StringHelper.getFrontUserId(request);
        // 查询全部订单
        List orderList = orderService.querySellerOrders(userId);

        model.addAttribute("headTitle", "订单中心");
        model.addAttribute("orderList", orderList);
        return "/mobilephone/user/seller/toSellerOrderCenter";
    }

    /**
     * 根据订单状态异步或去订单数据
     */
    @RequestMapping("/getAjaxOrders")
    public void getAjaxOrders(String type, HttpServletRequest request, PrintWriter out) {
        long uid = StringHelper.getFrontUserId(request);
        JSONArray orderList = (JSONArray) JSONArray.toJSON(orderService.queryOrdersByStatus(uid, type));
        out.print(orderList);
        out.close();
    }

    /**
     * PC端 直接下单按钮后页面跳转
     */
    @RequestMapping("/tosubmitcart")
    public String tosubmitcart(Model model, long goodId, long stockId, long companyId, BigDecimal quantity, BigDecimal buyMoney) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("goodId", goodId);
        map.put("stockId", stockId);
        map.put("companyId", companyId);//卖方公司id
        model.addAttribute("orderDetail", orderGoodService.getOrderDetail(map));
        model.addAttribute("quantity", quantity);//购买数量
        model.addAttribute("buyMoney", buyMoney);//购买金额
        return "pc/order/submitcart";
    }


    /**
     * PC端 订单提交成功跳转
     */
    @RequestMapping("/toorderSuccess")
    public String toorderSuccess(Model model, HttpServletRequest request) {
        String username = StringHelper.getFrontUserName(request);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("username", username);
        map.put("ordernum", request.getParameter("ordernum"));
        map.put("lastDate", StringHelper.getDateDiffer(1440));//推迟一天24小时
        model.addAttribute("orderinfo",map);
        return "pc/order/orderSuccess";
    }


    /**
     * PC端 提交订单方法
     */
    @RequestMapping("/submitOrder")
    public String submitOrder(HttpServletRequest request,Model model, RecOrder recOrder, OrderStock orderStock, Stock stock, BigDecimal rate) {
        long userId = StringHelper.getFrontUserId(request);
        String operationip = StringHelper.getIpAddr(request);
        String ordernum=StringHelper.getOrderNum();
        //出库操作
        stock.setFrontuserid(userId);
        stock.setCodeno(ordernum);
        stock.setOperationip(StringHelper.getIpAddr(request));
        stock.setPricenotax(stock.getPricehastax().multiply(new BigDecimal(1).subtract(rate)));
        stock.setAmountnotax(stock.getPricenotax().multiply(stock.getInitnum()));
        stock.setTaxmoney(stock.getFinalmoney().subtract(stock.getAmountnotax()));//税额
        stock.setOperationip(operationip);

        recOrder.setOrderno(ordernum);
        recOrder.setGuestid(userId);
        recOrder.setOperationip(operationip);

        orderStock.setOperationip(operationip);
        orderService.submitOrder(stock, recOrder, orderStock);//service放在一个事务里面
        Map paymap=new HashMap();
        paymap.put("lastDate", StringHelper.getDateDiffer(1440));//推迟一天24小时
        paymap.put("ordernum", ordernum);
        paymap.put("finalmoney", stock.getFinalmoney());
        paymap.put("payMoneyDetail", orderService.getPayMoneyDetail(userId, stock.getGoodid()));
        model.addAttribute("paymap", paymap);
        return "pc/order/payMoney";
    }

    /**
     * pc首页登陆成功订单中心跳转
     *
     * @return
     */
    @RequestMapping("/toorderCenter")
    public String toorderCenter(HttpServletRequest request, Model model) {
        int pageNow = request.getParameter("pageIndex") == null ? 1 : Integer.valueOf(request.getParameter("pageIndex"));//当前页
        int pageSize = SysConstants.DEFAULT_PAGE_SIZE;//每页显示多少条记录
        long userId = StringHelper.getFrontUserId(request);
        long companyId = StringHelper.getCompanyID(request);
        Map map = orderService.getOrderList(pageNow, pageSize, userId, companyId);
        model.addAttribute("ordersModel", map.get("p_cursor"));
        model.addAttribute("totalcount", map.get("myrows"));//总记录数
        model.addAttribute("pageSize", pageSize);//每页显示记录数
        model.addAttribute("flag", "订单中心");
        return "pc/order/orderCenter";
    }

    /**
     * pc订单中心订单详情跳转
     *
     * @return
     */
    @RequestMapping("/toorderdetail")
    public String toorderdetail(HttpServletRequest request, Model model, long orderId) {
        model.addAttribute("orderdetail", orderService.getOrderDetail(orderId));
        return "pc/order/orderdetail";
    }

    /**
     * pc订单中心订单详情跳转
     *
     * @return
     */
    @RequestMapping("/toorderpay")
    public String toorderpay(HttpServletRequest request, Model model, long orderId) {
        model.addAttribute("paydetail", orderService.getOrderPayDetail(orderId));
        return "pc/order/orderpay";
    }


    /**
     * pc订单保证金跳转
     *
     * @return
     */
    @RequestMapping("/tomargin")
    public String tomargin(HttpServletRequest request, Model model) {
        return "pc/order/margin";
    }
    /**
     * pc订单支付货款跳转
     *
     * @return
     */
    @RequestMapping("/topayMoney")
    public String topayMoney(HttpServletRequest request, Model model) {
        return "pc/order/payMoney";
    }

    /**
     * Hybrid APP订单图表数据查询
     */
    @RequestMapping("/getOrderData")
    public void getOrderData(HttpServletRequest request, HttpServletResponse response,PrintWriter out) {
        response.setHeader("Access-Control-Allow-Origin", "*"); //允许哪些url可以跨域请求到本域
        JSON json = (JSON) JSON.toJSON(orderService.getOrderData());
        out.print(json);
        out.close();
    }
}
