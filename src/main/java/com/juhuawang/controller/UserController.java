package com.juhuawang.controller;


import com.alibaba.fastjson.JSONArray;
import com.juhuawang.model.*;
import com.juhuawang.service.interfaces.*;
import com.juhuawang.util.StringHelper;
import com.juhuawang.util.SysConstants;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.POST;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Random;


/**
 * @author pwj on 2015/6/24 0024.
 *         用户Controller
 */
@Controller
@RequestMapping("/user")
public class UserController {
    String sRand = "";
    @Resource
    private IFrontUserService frontUserService;
    @Resource
    private IOrderService orderService;
    @Resource
    private ICompanyService companyService;
    @Resource
    private IRegionService regionService;
    @Resource
    private ICartService cartService;
    @Resource
    private IAddressService addressService;
    @Resource
    private IOrderGoodService orderGoodService;
    @Resource
    private IStockService stockService;

    /**
     * 手机版注册页面
     */
    @RequestMapping("/toReg")
    public String toReg(Model model) {
        model.addAttribute("headTitle", "新手注册");
        return "mobilephone/user/toReg";
    }

    /**
     * 手机版登录页面
     */
    @RequestMapping("/toLogin")
    public String toLogin(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        model.addAttribute("headTitle", "用户登录");

        return "mobilephone/user/toLogin";
    }

    /**
     * 手机版忘记密码
     */
    @RequestMapping("/toLostPwd")
    public String toLostPwd() {
        return "mobilephone/user/toLostPwd";
    }

    /**
     * 手机版购物车---跳转有无商品的页面
     */
    @RequestMapping("/toCart")
    public String toCart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        FrontUser user = (FrontUser) session.getAttribute("frontUser");
        // 没登录跳转购物车无商品页面
        if (user == null) {
            return "redirect:/user/toCartNoGoods";
        } else {
            List goodList = cartService.queryByFrontUserId(user.getId());
            if (goodList == null) {
                return "redirect:/user/toCartNoGoods";// 无商品
            } else {
                return "redirect:/user/toCartHasGoods";// 有商品
            }

        }
    }

    /**
     * 手机版购物车---无商品
     */
    @RequestMapping("/toCartNoGoods")
    public String toCartNoGoods(Model model) {
        model.addAttribute("headTitle", "购物车");
        return "mobilephone/user/toCartNoGoods";
    }

    /**
     * 手机版购物车---有商品
     */
    @RequestMapping("/toCartHasGoods")
    public String toCartHasGoods(HttpServletRequest request, Model model) {
        long userId = StringHelper.getFrontUserId(request);
        // 根据用户ID获取购物车中商品列表
        List cartList = cartService.queryByFrontUserId(userId);

        model.addAttribute("cartList", cartList);
        model.addAttribute("headTitle", "购物车");
        return "mobilephone/user/toCartHasGoods";
    }

    /**
     * 购物车删除操作
     */
    @RequestMapping("/updateCartByAjax")
    public void updateCartByAjax(long cartId,long stockId,HttpServletRequest request,PrintWriter out){
        // 修改rec_cart表中数据为无效
        Cart cart = cartService.selectByPrimaryKey(cartId);
        cart.setStatuscode(SysConstants.STATUSCODE_INVALID);
        cartService.updateByPrimaryKeySelective(cart);

        // 修改rec_stock表中数据为无效
        Stock stock = stockService.selectByPrimaryKey(stockId);
        stock.setStatuscode(SysConstants.STATUSCODE_INVALID);
        stockService.updateByPrimaryKeySelective(stock);

        // 查询当前用户下购物车数据
        List cartList = cartService.queryByFrontUserId(StringHelper.getFrontUserId(request));
        JSONArray jsonArray = (JSONArray) JSONArray.toJSON(cartList);
        out.print(jsonArray);
    }

    /**
     * 注册
     */
    @RequestMapping(value = "/reg",method = RequestMethod.POST)
    public String reg(FrontUser frontUser, Model model, int flag,HttpServletRequest request) throws NoSuchAlgorithmException {
        // 查询用户名是否被占用
        FrontUser user = frontUserService.getByUserName(frontUser.getLogin());
        if (user != null) {
            model.addAttribute("msg_userName", "用户名已经被占用");
            model.addAttribute("frontUser", frontUser);
            if (SysConstants.SYS_MOBILEPHONE == flag) {
                return "forward:/user/toReg";
            } else if (SysConstants.SYS_PC == flag) {
                return "forward:/index/toregister";
            }
        }

        // 密码md5加密
        frontUser.setPassword(StringHelper.md5(frontUser.getPassword()));
        frontUser.setOperationip(StringHelper.getIpAddr(request));
        frontUserService.addFrontUser(frontUser);
        model.addAttribute("success",true); //是否注册成功
        if (SysConstants.SYS_MOBILEPHONE == flag) {
            return "redirect:/index/index";
        } else if (SysConstants.SYS_PC == flag) {
            return "forward:/index/tologin";
        }

        return null;
    }

    /**
     * 获取验证码
     */
    @RequestMapping("/getCode")
    public String getCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //禁止缓存
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "No-cache");
        response.setDateHeader("Expires", 0);
        // 指定生成的响应是图片
        response.setContentType("image/jpeg");
        int width = 200;
        int height = 60;
        BufferedImage image = new BufferedImage(width, height,
                BufferedImage.TYPE_INT_RGB);    //创建BufferedImage类的对象
        Graphics g = image.getGraphics();     //创建Graphics类的对象
        Graphics2D g2d = (Graphics2D) g;      //通过Graphics类的对象创建一个Graphics2D类的对象
        Random random = new Random();      //实例化一个Random对象
        Font mFont = new Font("华文宋体", Font.BOLD, 20);  //通过Font构造字体
        g.setColor(getRandColor(200, 250));     //改变图形的当前颜色为随机生成的颜色
        g.fillRect(0, 0, width, height);     //绘制一个填色矩形
        sRand = "";
        //画一条折线
        BasicStroke bs = new BasicStroke(2f, BasicStroke.CAP_BUTT, BasicStroke.JOIN_BEVEL); //创建一个供画笔选择线条粗细的对象
        g2d.setStroke(bs);     //改变线条的粗细
        g.setColor(Color.DARK_GRAY);  //设置当前颜色为预定义颜色中的深灰色
        int[] xPoints = new int[3];
        int[] yPoints = new int[3];
        for (int j = 0; j < 3; j++) {
            xPoints[j] = random.nextInt(width - 1);
            yPoints[j] = random.nextInt(height - 1);
        }
        g.drawPolyline(xPoints, yPoints, 3);
        //生成并输出随机的验证文字
        g.setFont(mFont);

        int itmp = 0;
        for (int i = 0; i < 4; i++) {
            if (random.nextInt(2) == 1) {
                itmp = random.nextInt(26) + 65; //生成A~Z的字母
            } else {
                itmp = random.nextInt(10) + 48; //生成0~9的数字
            }
            char ctmp = (char) itmp;
            sRand += String.valueOf(ctmp);

            Color color = new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110));
            g.setColor(color);
            /****随机缩放文字并将文字旋转指定角度**/
            //将文字旋转指定角度
            Graphics2D g2d_word = (Graphics2D) g;
            AffineTransform trans = new AffineTransform();
            trans.rotate(random.nextInt(45) * 3.14 / 180, 15 * i + 10, 7);
            //缩放文字
            float scaleSize = random.nextFloat() + 0.8f;
            if (scaleSize > 1.1f) scaleSize = 1f;
            trans.scale(scaleSize, scaleSize);
            g2d_word.setTransform(trans);
            /************************/
            g.drawString(String.valueOf(ctmp), 30 * i + 40, 16);

        }
//        System.out.println("随机数字是=========================：" + sRand);
        //将生成的验证码保存到Session中
        HttpSession session = request.getSession(true);
        session.setAttribute("randCheckCode", sRand);
        g.dispose();
        ImageIO.write(image, "JPEG", response.getOutputStream());
        return null;
    }

    public Color getRandColor(int s, int e) {
        Random random = new Random();
        if (s > 255) s = 255;
        if (e > 255) e = 255;
        int r = s + random.nextInt(e - s);
        int g = s + random.nextInt(e - s);
        int b = s + random.nextInt(e - s);
        return new Color(r, g, b);
    }

    /**
     * 登录功能
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(HttpServletRequest request, Model model, @RequestParam("userName") String userName, @RequestParam("password") String password, @RequestParam("captcha") String captcha, int flag) throws NoSuchAlgorithmException {
        // 验证码是否正确
/*      if (!sRand.toLowerCase().equals(captcha.toLowerCase())) {
            model.addAttribute("userName", userName);
            model.addAttribute("password", password);
            model.addAttribute("msg_captcha", "验证码错误");
            if (SysConstants.SYS_MOBILEPHONE == flag) {
                return "forward:/user/toLogin";
            } else if (SysConstants.SYS_PC == flag) {
                return "forward:/index/tologin";
            }

        }*/

        FrontUser user = frontUserService.getByUserNameAndPwd(userName, StringHelper.md5(password));
        if (user == null) {
            model.addAttribute("msg_exist", "用户名或密码错误");
            if (SysConstants.SYS_MOBILEPHONE == flag) {
                return "forward:/user/toLogin";
            } else if (SysConstants.SYS_PC == flag) {
                return "forward:/index/tologin";
            }
        }

        // 保存用户和用户公司的ID到session
        HttpSession session = request.getSession();
        session.setAttribute("frontUser", user);
        long companyID = frontUserService.getCompayIdByUser(user.getId());
        session.setAttribute("companyID", companyID);//获取当前用户所在公司id存放在session

        // 获取上一次url
        String url = (String) request.getSession().getAttribute("url");
        if (url == null) {
            if (SysConstants.SYS_MOBILEPHONE == flag) {
                url = "/index/index";
            } else if (SysConstants.SYS_PC == flag) {
                url = "/index/pcindex";
            }
        }
        return "forward:" + url;
    }

    /**
     * 个人中心--mobilephone
     */
    @RequestMapping("/toMyCenter")
    public String toMyCenter(HttpServletRequest request, Model model) {
        FrontUser user = StringHelper.getFrontUser(request);
        if (user == null) {
            return "redirect:/user/toLogin";
        }
        // 获取用户注册类型
        String regType = user.getGuestcode();
        model.addAttribute("headTitle", "个人中心").addAttribute("user", user);
        // 买家个人中心首页
        if (SysConstants.REGTYPE_BUYER.equals(regType)) {
            // 获取待支付订单的个数
            long count_noPay = orderService.getCountByUidAndStatus(user.getId(), SysConstants.ORDERSTATUS_NOPAY);
            model.addAttribute("count_noPay", count_noPay);
            // 获取待提货订单的个数
            long count_noTakeGood = orderService.getCountByUidAndStatus(user.getId(), SysConstants.ORDERSTATUS_NOTAKEGOODS);
            model.addAttribute("count_noTakeGood", count_noTakeGood);
            // 待收货
            long count_sentGood = orderService.getCountByUidAndStatus(user.getId(), SysConstants.ORDERSTATUS_SENTGOOD);
            model.addAttribute("count_sentGood", count_sentGood);
            // 待评价
            long count_noEvaluate = orderService.getCountByUidAndStatus(user.getId(), SysConstants.ORDERSTATUS_NOEVALUATE);
            model.addAttribute("count_noEvaluate", count_noEvaluate);

            // 售后
            return "/mobilephone/user/buyer/toBuyerCenter";
        } else if (SysConstants.REGTYPE_SELLER.equals(regType)) {
            // 卖家个人中心首页
//            FrontUser user = StringHelper.getFrontUser(request);
            // 获取前台用户的认证状态
            String affirmReg = user.getAffirmregcode();
            // 未通过认证
            if (!SysConstants.AFFIRMREG_PASS.equals(affirmReg)) {
                model.addAttribute("msg_affirmReg", "尚未认证通过，暂时不能发布商品");
            }
            return "/mobilephone/user/seller/toSellerCenter";
        }
        return null;
    }

    /**
     * 银行账户列表
     */
    @RequestMapping("/toBankList")
    public String toBankList(Model model){

        model.addAttribute("headTitle","银行账号");
        return "/mobilephone/user/buyer/toBankList";
    }

    /**
     * 添加银行账户
     */
    @RequestMapping("/toAddBank")
    public String toAddBank(Model model){

        model.addAttribute("headTitle","添加银行账号");
        return "/mobilephone/user/buyer/toAddBank";
    }

    /**
     * 采购竞价
     */
    @RequestMapping("/toPurchaseBid")
    public String toPurchaseBid(Model model, HttpServletRequest request) {
        /*HttpSession session = request.getSession();
        FrontUser user = (FrontUser)session.getAttribute("frontUser");
        if (user == null){
            return "redirect:/user/toLogin";
        }*/
        model.addAttribute("headTitle", "采购竞价");
        return "/mobilephone/user/buyer/toPurchaseBid";
    }

    /**
     * 待自提订单列表
     */
    @RequestMapping("/toListTakeBySelf")
    public String toListTakeBySelf(Model model, HttpServletRequest request) {
        long userId = StringHelper.getFrontUserId(request);
        List goodList = orderService.queryOrderByUidAndStatus(userId, SysConstants.ORDERSTATUS_NOTAKEGOODS);

        model.addAttribute("headTitle", "个人中心-待自提订单");
        model.addAttribute("goodList", goodList);

        return "/mobilephone/user/buyer/toListTakeBySelf";
    }

    /**
     * 待收货
     */
    @RequestMapping("/noGoodsReceipt")
    public String noGoodsReceipt(Model model, HttpServletRequest request) {
        long userId = StringHelper.getFrontUserId(request);
        List goodList = orderService.queryOrderByUidAndStatus(userId, SysConstants.ORDERSTATUS_SENTGOOD);

        model.addAttribute("headTitle", "个人中心-待收货订单");
        model.addAttribute("goodList", goodList);

        return "/mobilephone/user/buyer/noGoodsReceipt";
    }

    /**
     * 待评价
     */
    @RequestMapping("/noEvaluation")
    public String noEvaluation(Model model, HttpServletRequest request) {
        long userId = StringHelper.getFrontUserId(request);
        List goodList = orderService.queryOrderByUidAndStatus(userId, SysConstants.ORDERSTATUS_NOEVALUATE);

        model.addAttribute("headTitle", "个人中心-待评价");
        model.addAttribute("goodList", goodList);

        return "/mobilephone/user/buyer/noEvaluation";
    }

    /**
     * 售后
     */
    @RequestMapping("/toAfterSale")
    public String toAfterSale(Model model) {
        model.addAttribute("headTitle", "售后");
        return "/mobilephone/user/buyer/toAfterSale";
    }

    /**
     * 修改密码
     */
    @RequestMapping("/toEditPwd")
    public String toEditPwd(Model model) {
        model.addAttribute("headTitle", "修改密码");
        return "/mobilephone/user/buyer/toEditPwd";
    }

    /**
     * 修改地址
     */
    @RequestMapping("/toEditAddress")
    public String toEditAddress(Model model, HttpServletRequest request) {
        long uid = StringHelper.getFrontUserId(request);

        // 根据用户ID查询公司名称、地址、联系人的姓名、电话等
        Company company = companyService.getByFrontUserId(uid);

        // 根据用户ID查询用户的收货地址信息
        List addressList = addressService.queryListByUid(uid);

        model.addAttribute("headTitle", "修改地址");
        model.addAttribute("company", company);
        model.addAttribute("addressList", addressList);

        return "/mobilephone/user/buyer/toEditAddress";
    }

    /**
     * 编辑公司地址
     */
    @RequestMapping("/toEditCompanyAddress")
    public String toEditCompanyAddress(Model model, HttpServletRequest request, long companyId) {
        // 获取公司信息
        Company company = companyService.getByCompanyId(companyId);
        model.addAttribute("company", company);
        model.addAttribute("headTitle", "修改公司地址");
        // 获取所有的省份
        List provinceList = regionService.getAllProvinces();
        model.addAttribute("provinceList", provinceList);
        return "/mobilephone/user/toEditCompanyAddress";
    }

    /**
     * 新增或编辑收货地址
     */
    @RequestMapping("/toEditReceiptAddress")
    public String toEditReceiptAddress(int type, Model model, long addressId) {
        if (type == 1) {
            model.addAttribute("headTitle", "新增收货地址");
        } else if (type == 2) {
            Object address = addressService.getByAddressId(addressId);// 根据地址ID获取地址对象

            model.addAttribute("address", address);
            model.addAttribute("headTitle", "修改收货地址");
        }
        // 获取所有省份列表
        List provinceList = regionService.getAllProvinces();

        model.addAttribute("type", type);
        model.addAttribute("provinceList", provinceList);
        return "/mobilephone/user/toEditReceiptAddress";
    }

    /**
     * 根据省ID异步获取所有的市
     */
    @RequestMapping("/getAjaxCity")
    public void getAjaxCity(long provinceId, PrintWriter out) {
        JSONArray cityList = (JSONArray) JSONArray.toJSON(regionService.getCitysByPid(provinceId));
        out.print(cityList);
        out.close();
    }

    /**
     * 根据市ID异步获取所有的县
     */
    @RequestMapping("/getAjaxCounty")
    public void getAjaxCounty(long cityId, PrintWriter out) {
        JSONArray cityList = (JSONArray) JSONArray.toJSON(regionService.getCountysByPid(cityId));
//        System.out.println(cityList);
        out.print(cityList);
        out.close();
    }

    /**
     * 保存公司地址
     */
    @RequestMapping("/editCompanyAddress")
    public String editCompanyAddress(Model model, long companyId, String linkMan, String mobphone, String name_province, String name_city, String name_county, String addressDetail) {
        Company company = companyService.getByCompanyId(companyId);
        company.setLinkman(linkMan);
        company.setMobphone(mobphone);
        String address = name_province + name_city + name_county + addressDetail;
        company.setAddress(address);
        companyService.updateCompany(company);
        model.addAttribute("msg_update", "修改公司地址成功！");
        model.addAttribute("company", company);
        return "forward:/user/toEditCompanyAddress";
    }

    /**
     * 保存收货地址
     */
    @RequestMapping("/editReceiptAddress")
    public String editReceiptAddress(HttpServletRequest request, int type, Model model,
                                     String postal, String name_province, String name_city, String name_county, long addressId,
                                     String linkMan, String mobphone, String addressDetail, String defaultAddress) {
        String ip = StringHelper.getIpAddr(request);
        FrontUser user = StringHelper.getFrontUser(request);
        String codeNo = StringHelper.getOrderNum();
        addressService.saveAddress(type, addressId, ip, user.getId(), codeNo, postal, name_province, name_city, name_county, linkMan, mobphone, addressDetail, defaultAddress);
        if (type == 1) {
            // 新增
            model.addAttribute("msg_info", "新增收货地址成功！");
        }
        if (type == 2) {
            // 修改
            model.addAttribute("msg_info", "修改收货地址信息成功！");
        }

        return "forward:/user/toEditAddress";
    }

    /**
     * 删除收货地址
     */
    @RequestMapping("/deleteReceiptAddress")
    public String deleteReceiptAddress(long addressId, Model model) {
        addressService.deleteByAddressId(addressId);//删除

        model.addAttribute("msg_info", "删除成功");
        return "forward:/user/toEditAddress";
    }

    /**
     * 修改手机号
     */
    @RequestMapping("/toEditPhone")
    public String toEditPhone(Model model) {
        model.addAttribute("headTitle", "修改手机号");
        return "/mobilephone/user/buyer/toEditPhone";
    }

    /**
     * 修改邮箱
     */
    @RequestMapping("/toEditEmail")
    public String toEditEmail(Model model) {
        model.addAttribute("headTitle", "修改邮箱");
        return "/mobilephone/user/buyer/toEditEmail";
    }

    /**
     * 发布商品
     */
    @RequestMapping("/toReleaseGood")
    public String toReleaseGood(Model model) {
        model.addAttribute("goodKindCode", orderGoodService.getGoodKindCode());
        model.addAttribute("goodTypeCode", orderGoodService.getGoodTypeCode());
        model.addAttribute("macCode", orderGoodService.getMacCode());
        model.addAttribute("meaCode", orderGoodService.getMeaCode());
        model.addAttribute("useCode", orderGoodService.getUseCode());
        model.addAttribute("packTypeCode", orderGoodService.getPackTypeCode());
        model.addAttribute("packContent", orderGoodService.getPackContent());
        model.addAttribute("packageCode", orderGoodService.getPackageCode());
        model.addAttribute("storage", orderGoodService.getStoragesForSelect());

        model.addAttribute("headTitle", "商品发布");
        return "/mobilephone/user/seller/toReleaseGood";
    }

    /**
     * 保存商品
     */
    @RequestMapping("/saveGood")
    public String saveGood(HttpServletRequest request, Good good, Stock stock, GoodDesc goodDesc, Model model) {
        long fontUserId = StringHelper.getFrontUserId(request);
        long comanyID = StringHelper.getCompanyID(request);
        /*if (comanyID == 0) {
        }*/
        String operationIP = StringHelper.getIpAddr(request);
        //组装对象属性
        good.setFrontuserid(fontUserId);
        good.setOperationip(operationIP);
        goodDesc.setSelluserid(fontUserId);
        stock.setCompanyid(comanyID);
        stock.setFrontuserid(fontUserId);
        stock.setCodeno(StringHelper.getOrderNum());
        orderGoodService.saveGoodMob(good, stock, goodDesc);

        model.addAttribute("msg_good", "发布成功");
        return "forward:/user/toReleaseGood";
    }

    /**
     * 保存密码
     */
    @RequestMapping("/editPwd")
    public String editPwd(Model model, HttpServletRequest request, String oldPwd, String newPwd, String confirmPwd) throws NoSuchAlgorithmException {
        // 验证旧密码是否正确
        FrontUser user = StringHelper.getFrontUser(request);
        if (!StringHelper.md5(oldPwd).equals(user.getPassword())) {
            model.addAttribute("msg_oldPwd", "旧密码输入错误");
            model.addAttribute("oldPwd", oldPwd).addAttribute("newPwd", newPwd).addAttribute("confirmPwd", confirmPwd);
            return "forward:/user/toEditPwd";
        }
        // 修改密码
        user.setPassword(StringHelper.md5(newPwd));
        frontUserService.updateFrontUser(user);

        model.addAttribute("msg_pwd", "密码修改成功");
        model.addAttribute("oldPwd", oldPwd).addAttribute("newPwd", newPwd).addAttribute("confirmPwd", confirmPwd);
        return "forward:/user/toEditPwd";
    }

    /**
     * 退出登录
     */
    @RequestMapping("/exit")
    public String exit(HttpServletRequest request, int flag) {
        HttpSession session = request.getSession(false);
        session.removeAttribute("frontUser");
        if (SysConstants.SYS_MOBILEPHONE == flag) {
            return "redirect:/index/index";
        } else if (SysConstants.SYS_PC == flag) {
            return "redirect:/index/pcindex";
        }
        return null;
    }
}
