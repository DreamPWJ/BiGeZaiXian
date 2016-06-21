package com.juhuawang.controller;


import com.juhuawang.model.FindGood;
import com.juhuawang.model.searchmodel.SearchMall;
import com.juhuawang.service.interfaces.IMallService;
import com.juhuawang.service.interfaces.IOrderGoodService;
import com.juhuawang.util.StringHelper;
import com.juhuawang.util.SysConstants;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.Map;

/**
 * @author pwj 2015/7/31 0031.
 *         聚化商城的controller
 */

@Controller
@RequestMapping("/mall")
public class MallController {

    @Resource
    IMallService mallService;
    @Resource
    IOrderGoodService orderGoodService;

    /**
     *聚化商城数据展示
     */
    @RequestMapping("/toMall")
    public String toMall(HttpServletRequest request, Model model,SearchMall searchMall) {
        model.addAttribute("goodKindCode", orderGoodService.getGoodKindCode());
        //model.addAttribute("goodTypeCode", orderGoodService.getGoodTypeCode());
       // model.addAttribute("macCode", orderGoodService.getMacCode());
        model.addAttribute("useCode", orderGoodService.getUseCode());

        int pageNow = request.getParameter("pageIndex") == null ? 1 : Integer.valueOf(request.getParameter("pageIndex"));//当前页
        int pageSize = SysConstants.DEFAULT_PAGE_SIZE;//每页显示多少条记录
        Map map = mallService.getMallList(pageNow, pageSize,searchMall);

        model.addAttribute("mallsModel", map.get("p_cursor"));
        model.addAttribute("totalcount", map.get("myrows"));//总记录数
        model.addAttribute("pageSize", pageSize);//每页显示记录数
        model.addAttribute("flag","聚化商城");
        return "pc/mall/mall";
    }


    /**
     *帮你找货数据保存存储
     */
    @RequestMapping("/saveFindGood")
    public void saveFindGood(HttpServletRequest request, FindGood findGood,PrintWriter out) {
        findGood.setOperationid(StringHelper.getFrontUserId(request));
        findGood.setOperationip(StringHelper.getIpAddr(request));
        mallService.saveFindGood(findGood);
        out.print("您的找货信息已录入，我们会第一时间帮您找货！");
        out.close();
    }
}
