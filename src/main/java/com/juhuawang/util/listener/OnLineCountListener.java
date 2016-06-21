package com.juhuawang.util.listener;
/**
 * Created by pwj  on 2015/9/14 0014.
 * 统计在线人数的Servlet的监听器  需要时配置在web.xml中启动
 */

import javax.servlet.http.*;
import javax.servlet.*;

public class OnLineCountListener implements HttpSessionListener, ServletContextListener, ServletContextAttributeListener {
    private int count;
    private ServletContext context = null;

    public OnLineCountListener() {
        count = 0;
    }

    //创建一个session时激发
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        count++;
        setContext(se);
    }

    //当一个session失效时激发
    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        count--;
        setContext(se);
    }
    //设置context的属性，它将激发attributeReplaced或attributeAdded方法

    public void setContext(HttpSessionEvent se) {
        se.getSession().getServletContext().setAttribute("onLines", new Integer(count));
    }

    //增加一个新的属性时激发
    @Override
    public void attributeAdded(ServletContextAttributeEvent event) {
        log("===比格在线增加一个新的属性时激发attributeAdded('" + event.getName() + "', '" + event.getValue() + "')");
    }

    //删除一个新的属性时激发
    @Override
    public void attributeRemoved(ServletContextAttributeEvent event) {
        log("===比格在线删除一个新的属性时激发attributeRemoved('" + event.getName() + "', '" + event.getValue() + "')");
    }

    //属性被替代时激发
    @Override
    public void attributeReplaced(ServletContextAttributeEvent event) {
        log("===比格在线属性被替代时激发attributeReplaced('" + event.getName() + "', '" + event.getValue() + "')");
    }

    //context删除时激发
    @Override
    public void contextDestroyed(ServletContextEvent event) {
        log("===比格在线context删除时激发contextDestroyed()");
        this.context = null;
    }

    //context初始化时激发
    @Override
    public void contextInitialized(ServletContextEvent event) {
        this.context = event.getServletContext();
        log("===比格在线context初始化时激发contextInitialized()");
    }

    private void log(String message) {
        System.out.println("===比格在线监听器信息ContextListener: " + message);
    }
}
