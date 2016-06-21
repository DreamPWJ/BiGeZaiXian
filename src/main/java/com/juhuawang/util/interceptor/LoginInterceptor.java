package com.juhuawang.util.interceptor;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * Created by 1250052380@qq.com on 2014/11/14.
 * 记录上次的url
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

        String requestUri = request.getRequestURI();
//        System.out.println("requestUri=================================="+requestUri);
        String contextPath = request.getContextPath();
        String url;
        if(requestUri.contains(";")){
            url = requestUri.substring(contextPath.length(),requestUri.indexOf(";"));
        } else if (requestUri.contains("?")){
            url = requestUri.substring(contextPath.length(),requestUri.indexOf("?"));
        } else if (requestUri.contains(".")) {
//            System.out.println("含有.的url========================================="+requestUri);
            url = null;
        } else {
            url = requestUri.substring(contextPath.length());
        }
//        System.out.println("请求中获取的url=========================================="+url);
        HttpSession session = request.getSession();
        // 登录、注册、注销等方法不记录
        // TODO :后面新增的需要登陆跳转的一些待过滤的方法需要手动进行添加比如：获取验证码、查询图片、异步请求的一些方法等等
        if(!url.equals("/user/toLogin")&& !url.equals("/index/tologin")&& !url.equals("/good/showPicture") && !url.equals("/user/getCode") && !url.equals("/user/login") && !url.equals("/user/exit") && !url.equals("/user/toReg")&& !url.equals("/index/toregister") && !url.equals("/user/reg")){
            Map<String,  String[]> map =request.getParameterMap();
            if(map.isEmpty()){
                session.setAttribute("url",url);
//                System.out.println("放到session中的url===================================="+url);
            } else {
                String arg="";
                for (Map.Entry<String, String[]>  entry : map.entrySet()) {
                    arg+=entry.getKey()+"="+entry.getValue()[0]+"&";
                }
                arg=arg.substring(0,arg.length()-1);
                session.setAttribute("url",url+"?"+arg);
//                System.out.println("放到session中的url===================================="+url+"?"+arg);
            }

        }
    }
}
