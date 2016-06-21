package com.juhuawang.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.juhuawang.service.interfaces.ITestService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;


/**
 * @author pwj on 2015/6/24 0024.
 *         测试Controller
 */
@Controller
@RequestMapping("/user")
public class TestController {
    @Resource
    private ITestService userService;

    @RequestMapping("/showUser")
    public String toIndex(HttpServletRequest request, Model model) {
/*      int userId = Integer.parseInt(request.getParameter("id"));
        TestUser user = this.userService.getUserById(userId);
        model.addAttribute("user", user);*/
       List<Map<String,Object>> userList = this.userService.getALL();
        model.addAttribute("userList", userList);
        return "test/showUser";
    }



}
