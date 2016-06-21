package com.juhuawang.util.authority;

import javax.servlet.http.HttpServletRequest;

/**
 * @author pwj  2015-07-20
 *         权限帮助类
 *         把用户权限保存到session中并提供获取方法  把权限菜单赋值到request请求中并提供获取方法
 */
public class AuthHelper {
    /**
     * 在request请求中获取用户权限对象 保存到session会话中
     */
    public static void setSessionAccountAuth(HttpServletRequest request, AccountAuth accountAuth) {
        request.getSession().setAttribute("accountAuth", accountAuth);
    }

    /**
     * 在request请求中从session会话中获取用户权限对象
     */
    public static AccountAuth getSessionAccountAuth(HttpServletRequest request) {
        return (AccountAuth) request.getSession().getAttribute("accountAuth");
    }

    /**
     * 在request请求中获取菜单权限对象 保存到request请求中
     */
    public static void setRequestPermissionMenu(HttpServletRequest request, PermissionMenu permissionMenu) {
        request.setAttribute("permissionMenu", permissionMenu);
    }

    /**
     * 在request请求中从request请求中获取菜单权限对象
     */
    public static PermissionMenu getRequestPermissionMenu(HttpServletRequest request) {
        return (PermissionMenu) request.getAttribute("permissionMenu");
    }

}