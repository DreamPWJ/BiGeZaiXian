package com.juhuawang.util.filter;


import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by pwj  on 2015/9/1 0001.
 * xss跨站攻击 ,sql注入攻击的自定义过滤器类  web.xml进行配置引入
 * XssFilter 的实现方式是实现servlet的Filter接口
 */
public class XssFilter implements Filter {

    /**
     *初始化方法
     */
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    /**
     * request要通过filter时，filter中的doFilter()就执行
     * chain.doFilter方法会立即跳转到被拦截的servlet并且执行完还要再返回filter.chain相当于一扇门,
     * 从这扇门出去再从这扇门回来.调用filter的方法就是在web.xml中配置,
     * 需要配置一个与你需要拦截的servlet相同的url-pattern
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        chain.doFilter(new XssHttpServletRequestWrapper((HttpServletRequest) request), response);
    }
    /**
     *销毁方法
     */
    @Override
    public void destroy() {
    }
}
