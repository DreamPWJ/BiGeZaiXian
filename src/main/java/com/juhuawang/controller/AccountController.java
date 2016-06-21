package com.juhuawang.controller;

import com.juhuawang.model.Annex;
import com.juhuawang.service.interfaces.IAccountService;
import com.juhuawang.util.StringHelper;
import com.juhuawang.util.SysConstants;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by pwj  on 2015/8/10 0010.
 * 账号管理的Controller
 */
@Controller
@RequestMapping("/account")
public class AccountController {

    @Resource
    IAccountService accountService;

    /**
     * pc首页个人中心跳转
     *
     * @return
     */
    @RequestMapping("/touserCenter")
    public String touserCenter(Model model, HttpServletRequest request) {
        model.addAttribute("usersinfo", accountService.getUserCenter(StringHelper.getFrontUserId(request)));
        model.addAttribute("flag", "我的聚化");
        return "pc/login/userCenter";
    }

    /**
     * pc账号管理基本资料跳转
     *
     * @return
     */
    @RequestMapping("/tobasicInformation")
    public String tomanager(Model model,HttpServletRequest request) {
        long userId=StringHelper.getFrontUserId(request);
        model.addAttribute("baseinfo",accountService.getBasicInformation(userId));
        model.addAttribute("flag", "基本资料");
        return "pc/account/basicInformation";
    }

    /**
     * pc账号管理我的服务跳转
     *
     * @return
     */
    @RequestMapping("/toservices")
    public String toservices() {
        return "pc/account/services";
    }

    /**
     * pc账号管理安全设置跳转
     *
     * @return
     */
    @RequestMapping("/tosecuritySettings")
    public String tosecuritySettings() {
        return "pc/account/securitySettings";
    }

    /**
     * pc账号管理认证附件跳转
     *
     * @return
     */
    @RequestMapping("/toattachment")
    public String toattachment(Model model, HttpServletRequest request) {
        long userid = StringHelper.getFrontUserId(request);//聚化网客户id
        List<Annex> annexlist = accountService.getAnnexByguestId(userid);
        if (annexlist.isEmpty()) {
            model.addAttribute("msg", null);
        } else {
            model.addAttribute("msg", true);
        }
        model.addAttribute("flag", "账号管理");
        return "pc/account/attachment";
    }

    /**
     * pc账号管理认证附件的三证图片多图片上传
     */
    @RequestMapping("/uploadCredentials")
    public String uploadCredentials(@RequestParam(value = "filepic") MultipartFile[] files, HttpServletRequest request, Model model) {
        //聚化网三证上传 按登录名建立文件夹 图片保存的路径
    /*  String path = SysConstants.THREE_CREDENTIALS_FILENAME + "/" + StringHelper.formartDate("yyyy-MM-dd") + "/";*/
        String path = SysConstants.THREE_CREDENTIALS_FILENAME + "/" + StringHelper.getFrontUserLoginName(request) + "/";
        List<String> urlList = new ArrayList<String>();//存储url集合
        //判断file数组不能为空并且长度大于0
        if (files != null && files.length > 0) {
            //循环获取file数组中得文件
            for (int i = 0; i < files.length; i++) {//多图片数组循环保存
                MultipartFile file = files[i];
                if(file.isEmpty()){
                    model.addAttribute("msg_file","请先上传三证图片");
                    return "forward:/account/toattachment";
                }
                String fileName =StringHelper.getOrderNum()+ file.getOriginalFilename();//获取图片文件原始名称
                File targetFile = new File(path, fileName);//创建目标文件
                if (!targetFile.exists()) {
                    targetFile.mkdirs();
                }
                //保存文件到制定的文件下
                try {
                    file.transferTo(targetFile);
                    //不同机器之间都可以访问图片
                    String pathstr = StringHelper.getIPAndPortURL(request) + path;
                    urlList.add(pathstr + fileName);//存储url加入集合
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        long userid = StringHelper.getFrontUserId(request);//聚化网客户id
        accountService.addBatchAnnex(urlList, userid);//批量增加三证信息
        return "forward:/account/toattachment";
    }


    /**
     * pc账号管理银行账号跳转
     *
     * @return
     */
    @RequestMapping("/tobankAccount")
    public String tobankAccount(Model model, HttpServletRequest request) {
        return "pc/account/bankAccount";
    }


    /**
     * pc账号管理修改密码跳转
     *
     * @return
     */
    @RequestMapping("/tochangePassword")
    public String tochangePassword(Model model, HttpServletRequest request) {
        return "pc/account/changePassword";
    }

    /**
     * pc账号管理我的积分跳转
     *
     * @return
     */
    @RequestMapping("/tomyIntegral")
    public String tomyIntegral(Model model, HttpServletRequest request) {
        return "pc/account/myIntegral";
    }

    /**
     * pc账号管理添加银行账号跳转
     *
     * @return
     */
    @RequestMapping("/tonewBankAccount")
    public String tonewBankAccount(Model model, HttpServletRequest request) {
        return "pc/account/newBankAccount";
    }

    /**
     * pc我的聚化充值跳转
     *
     * @return
     */
    @RequestMapping("/torecharge")
    public String torecharge(Model model, HttpServletRequest request) {
        return "pc/account/recharge";
    }
    /**
     * pc我的聚化提现跳转
     *
     * @return
     */
    @RequestMapping("/toextract")
    public String toextract(Model model, HttpServletRequest request) {
        return "pc/account/extract";
    }

    /**
     * pc我的聚化收支明细跳转
     *
     * @return
     */
    @RequestMapping("/topaymentsDetails")
    public String topaymentsDetails(Model model, HttpServletRequest request) {
        return "pc/account/paymentsDetails";
    }

}
