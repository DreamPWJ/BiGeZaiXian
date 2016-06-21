package com.juhuawang.util.authority;

import java.net.URLEncoder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.juhuawang.util.exception.PermissionException;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


/**
 * @author pwj  2015-07-20
 *         权限拦截器类  每个的方法权限控制   拦截器相当于AOP切面编程
 */
public class AuthInterceptor extends HandlerInterceptorAdapter {

    /**
     * preHandle此处仅调用方法之前拦截器处理
     * 返回值：true表示继续流程（如调用下一个拦截器或处理器）；
     * false表示流程中断（如登录检查失败），不会继续调用其他的拦截器或处理器，此时我们需要通过response来产生响应
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 是用来判断一个类Class1和另一个类Class2是否相同或是另一个类的超类或接口
        if (handler.getClass().isAssignableFrom(HandlerMethod.class)) {
            //获取AuthPassport注解类
            AuthPassport authPassport = ((HandlerMethod) handler).getMethodAnnotation(AuthPassport.class);
            //没有声明需要权限,或者声明不验证权限    如果方法没有声明@AuthPassport或者AuthPassport的validate是false(不验证) 时 直接跳过拦截器
            if (authPassport == null || authPassport.validate() == false) {
                return true;
            } else {
                //从session中获取客户权限对象
                AccountAuth accountAuth = AuthHelper.getSessionAccountAuth(request);
                if (accountAuth != null) {
                    //是否有当前权限标示
                    boolean hasPermission = false;
                    //获取request请求的servlet的路径  用于路径匹配验证
                    String requestServletPath = request.getServletPath();

/*                    for(PermissionMenu permissionMenu : accountAuth.getAccountRole().getPermissionMenus()){

                        Pattern pattern = Pattern.compile(permissionMenu.getPermission(),Pattern.CASE_INSENSITIVE);*、
                        Matcher matcher = pattern.matcher(requestServletPath);
                        if(matcher.find()){
                            hasPermission=true;
                            AuthHelper.setRequestPermissionMenu(request, permissionMenu);//如果有权限 放在request中
                        }
                    }*/
                    if (hasPermission)
                        return true;
                    else
                        throw new PermissionException("没有权限异常！");
                } else {
                    StringBuilder urlBuilder = new StringBuilder(request.getContextPath());
                    urlBuilder.append("/index/pcindex");//聚化网PC主页面
                    if (request.getServletPath() != null && !request.getServletPath().isEmpty()) {
                        urlBuilder.append("?returnUrl=");

                        StringBuilder pathAndQuery = new StringBuilder(request.getServletPath());
                        if (request.getQueryString() != null && !request.getQueryString().isEmpty()) {
                            pathAndQuery.append("?");
                            pathAndQuery.append(request.getQueryString());
                        }

                        urlBuilder.append(URLEncoder.encode(pathAndQuery.toString(), "UTF-8"));
                    }

                    response.sendRedirect(urlBuilder.toString());
                    return false;
                }

            }
        } else
            return true;
    }
}