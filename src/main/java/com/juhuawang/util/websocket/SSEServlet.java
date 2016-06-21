package com.juhuawang.util.websocket;


import com.juhuawang.service.interfaces.IStockService;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author pwj
 *         SSE服务器推送事件的Servlet  用于服务器端主动推送数据消息到客户端（浏览器）
 */
//@WebServlet 用于将一个类声明为 Servlet，该注解将会在部署时被容器处理，容器将根据具体的属性配置将相应的类部署为 Servlet
@WebServlet("/SSEServlet")
public class SSEServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private IStockService stockService;

    //初始化方法
    @Override
    public void init() {
        //servlet容器获取spring容器管理service层bean
        WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
        stockService = (IStockService) context.getBean("stockServiceImpl");
    }

    //执行方法
    @Override
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.setContentType("text/event-stream");//设置事件流 必须的
        response.setCharacterEncoding("UTF-8");//设置编码

        getSSEUpdatePutawayStock(response);

        try {   //设置间隔时间
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }



    /**
     * 获取商家上架更新的信息 推送给所有用户
     */
    public void getSSEUpdatePutawayStock(HttpServletResponse response) throws ServletException, IOException {
        //获取上架信息
        Map map = stockService.getSSEUpdatePutawayStock();
        if (map != null && !map.isEmpty()) {
            // 获取输出流
            PrintWriter writer = response.getWriter();
            // 发送消息 SSE
            String message = "刚刚上架产品   牌号: " + map.get("MARK") + "   价格: ￥" + map.get("PRICEHASTAX") + "     数量: " + map.get("INITNUM");
            writer.write("data: " + message + "\n\n");
        }
    }
}
