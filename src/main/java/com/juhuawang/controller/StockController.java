package com.juhuawang.controller;

import com.alibaba.fastjson.JSON;
import com.juhuawang.model.Log;
import com.juhuawang.model.Stock;
import com.juhuawang.service.interfaces.IFrontUserService;
import com.juhuawang.service.interfaces.IOrderGoodService;
import com.juhuawang.service.interfaces.IStockService;
import com.juhuawang.util.StringHelper;
import com.juhuawang.util.SysConstants;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by pwj  on 2015/8/26 0026.
 * 库存相关Controller
 */
@Controller
@RequestMapping("/stock")
public class StockController {

    @Resource
    IStockService stockService;

    @Resource
    IOrderGoodService orderGoodService;

    @Resource
    private IFrontUserService frontUserService;

    /**
     * 添加库存获取仓库地址
     */

    @RequestMapping("/getStorageNames")
    public void getStorageNames(PrintWriter out) {
        /*JSON json = (JSON) JSON.toJSON(stockService.getStorageNames());
        out.print(json);
        out.close();*/

    }


    /**
     * pc商品添加库存上架方法
     *
     * @return
     */
    @RequestMapping("/addStock")
    public void addStock(HttpServletRequest request, Stock stock, PrintWriter out, BigDecimal rate) {
        long userId = StringHelper.getFrontUserId(request);
//        long companyId = StringHelper.getCompanyID(request);
        long companyId = frontUserService.getCompayIdByUser(userId);
        stock.setCompanyid(companyId);
        stock.setFrontuserid(userId);
       /* if ("001".equals(stock.getStockcode())) {//入库操作

        }*/
        stock.setCodeno(StringHelper.getOrderNum());
        stock.setOperationip(StringHelper.getIpAddr(request));
        if ("002".equals(stock.getStockcode())) {//上架操作
            stock.setAffirmnum(stock.getInitnum());
            stock.setPricenotax(stock.getPricehastax().multiply(new BigDecimal(1).subtract(rate)));
            stock.setAmountnotax(stock.getPricenotax().multiply(stock.getInitnum()));
            stock.setFinalmoney(stock.getPricehastax().multiply(stock.getInitnum()));
            stock.setTaxmoney(stock.getFinalmoney().subtract(stock.getAmountnotax()));
        }
        stockService.addStock(stock);
        JSON json = (JSON) JSON.toJSON(stockService.getStocksByGoodId(companyId, stock.getGoodid()));
        out.print(json);
        out.close();
    }

    /**
     * pc商品获取库存上架明细方法
     *
     * @return
     */
    @RequestMapping("/getStockDetail")
    public void getStockDetail(HttpServletRequest request, PrintWriter out, long goodid, long storageid, String stockcode) {
        long companyId = StringHelper.getCompanyID(request);
        Map<String, Object> argmap = new HashMap<String, Object>();
        argmap.put("goodid", goodid);
        argmap.put("storageid", storageid);
        argmap.put("stockcode", stockcode);
        argmap.put("companyId", companyId);
        JSON json = (JSON) JSON.toJSON(stockService.getStockDetail(argmap));
        out.print(json);
        out.close();
    }

    /**
     * pc库存中心跳转
     *
     * @return
     */
    @RequestMapping("/tostockCenter")
    public String tostockCenter(Model model, HttpServletRequest request) {
        int pageNow = request.getParameter("pageIndex") == null ? 1 : Integer.valueOf(request.getParameter("pageIndex"));//当前页
        int pageSize = SysConstants.DEFAULT_PAGE_SIZE;//每页显示多少条记录
        long companyId = StringHelper.getCompanyID(request);
        Map map = stockService.getStocks(pageNow, pageSize, companyId);
        model.addAttribute("stocksModel", map.get("p_cursor"));
        model.addAttribute("totalcount", map.get("myrows"));//总记录数
        model.addAttribute("pageSize", pageSize);//每页显示记录数
        model.addAttribute("flag", "库存中心");
        return "pc/good/stockCenter";
    }


    /**
     * pc商品详情查看仓库详情方法
     * @return
     */
   @RequestMapping("/tostoragedetail")
    public String tostoragedetail(HttpServletRequest request,Model model, long goodid, long storageid) {
       int pageNow = request.getParameter("pageIndex") == null ? 1 : Integer.valueOf(request.getParameter("pageIndex"));//当前页
       int pageSize = SysConstants.DEFAULT_PAGE_SIZE;//每页显示多少条记录
       long companyid = StringHelper.getCompanyID(request);
       Map<String,Object> argmap=new HashMap<>();
       argmap.put("companyid",companyid);
       argmap.put("goodid",goodid);
       argmap.put("storageid",storageid);
       Map map = stockService.getStorageDetail(pageNow, pageSize, argmap);
       model.addAttribute("stocksdetailModel", map.get("p_cursor"));
       model.addAttribute("totalcount", map.get("myrows"));//总记录数
       model.addAttribute("pageSize", pageSize);//每页显示记录数
        return "pc/good/storagedetail";
    }


}
