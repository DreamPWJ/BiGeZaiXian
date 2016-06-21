package com.juhuawang.controller;

import com.juhuawang.service.interfaces.IStockService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by pwj  on 2015/11/2 0002.
 * 新闻资讯中心controler
 */
@RequestMapping("/news")
@Controller
public class NewsController {
    @Resource
    IStockService stockService;

    /**
     * pc资讯中心页面
     *
     * @return
     */
    @RequestMapping("/toinformationcenter")
    public String toinformationcenter(Model model, HttpServletRequest request) {
        int pageNow = request.getParameter("pageIndex") == null ? 1 : Integer.valueOf(request.getParameter("pageIndex"));//当前页
        int pageSize = 6;//每页显示多少条记录
        //新闻数据展示
        Map<String, Object> newsargmap = new HashMap<String, Object>();
        newsargmap.put("pageNow", pageNow);
        newsargmap.put("pageSize", pageSize);
        // 平台资讯
        newsargmap.put("newscode", "003001001");
        Map<String, Object> map = stockService.getIndexNews(newsargmap);
        model.addAttribute("news003001001", map.get("p_cursor"));
        model.addAttribute("totalcount", map.get("myrows"));//总记录数
        model.addAttribute("pageSize", pageSize);//每页显示记录数

        // 行情资讯(行情(二级))
        newsargmap.put("newscode", "003002");
        map = stockService.getIndexNews(newsargmap);
        model.addAttribute("news003002", map.get("p_cursor"));
        model.addAttribute("totalcount1", map.get("myrows"));//总记录数
        model.addAttribute("pageSize1", pageSize);//每页显示记录数

        // 行业资讯(行业(二级)A)
        newsargmap.put("newscode", "003003001");
        map = stockService.getIndexNews(newsargmap);
        model.addAttribute("news003003001", map.get("p_cursor"));
        model.addAttribute("totalcount2", map.get("myrows"));//总记录数
        model.addAttribute("pageSize2", pageSize);//每页显示记录数
        model.addAttribute("flag","资讯中心");
        return "pc/news/informationcenter";
    }

    @RequestMapping("/togetData")
    public void togetData(Model model, HttpServletRequest request,HttpServletResponse response,PrintWriter out) {
        response.setHeader("Access-Control-Allow-Origin", "*"); //允许哪些url可以跨域请求到本域
       // response.setHeader("Access-Control-Allow-Methods","GET"); //允许的请求方法，一般是GET,POST,PUT,DELETE,OPTIONS
       // response.setHeader("Access-Control-Allow-Headers","x-requested-with,content-type"); //允许哪些请求头可以跨域
        out.write("你好啊AngularJS!");
        out.close();
    }


}
