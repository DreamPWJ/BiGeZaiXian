package com.juhuawang.controller;

import com.alibaba.fastjson.JSON;

import com.juhuawang.model.Storage;
import com.juhuawang.service.interfaces.IAddressService;
import com.juhuawang.util.StringHelper;
import com.juhuawang.util.SysConstants;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
;
import java.io.PrintWriter;
import java.util.Map;

/**
 * Created by pwj  on 2015/8/24 0024.
 * 地址管理Controller
 */
@Controller
@RequestMapping("/address")
public class AddressController {


    @Resource
    IAddressService addressService;

    /**
     * pc地址管理跳转
     *
     * @return
     */
    @RequestMapping("/tomanageSite")
    public String tomanageSite(Model model, HttpServletRequest request) {
        int pageNow = request.getParameter("pageIndex") == null ? 1 : Integer.valueOf(request.getParameter("pageIndex"));//当前页
        int pageSize = SysConstants.DEFAULT_PAGE_SIZE;//每页显示多少条记录
        Map map = addressService.getStorages(pageNow, pageSize);
        model.addAttribute("storagesModel", map.get("p_cursor"));
        model.addAttribute("totalcount", map.get("myrows"));//总记录数
        model.addAttribute("pageSize", pageSize);//每页显示记录数
        model.addAttribute("flag","仓库地址");
        return "pc/address/manageSite";
    }

    /**
     * pc地址管理增加地址跳转
     *
     * @return
     */
    @RequestMapping("/toaddSite")
    public String toaddSite(Model model) {
        model.addAttribute("provinces", addressService.getProvinces());
        return "pc/address/addSite";
    }

    /**
     * pc地址管理增加地址保存跳转
     *
     * @return
     */
    @RequestMapping("/addSite")


    public String addSite(Storage storage, HttpServletRequest request) {
        storage.setCodeno(StringHelper.getOrderNum());//编号
        storage.setOperationid(StringHelper.getFrontUserId(request));//操作人id
        storage.setOperationip(StringHelper.getIpAddr(request));//操作ip
        addressService.addSite(storage);

        return "pc/address/addSite";
    }


    /**
     * pc地址管理省市的下级城市的信息获取
     *
     * @return
     */

    @RequestMapping("/getCitysByProvince")
    public void getCitysByProvince(long provinceId, PrintWriter out) {

        JSON json = (JSON) JSON.toJSON(addressService.getCitysByProvince(provinceId));
        out.print(json);
        out.close();


    }

    /**
     * pc地址管理城市下级的区县的信息获取
     *
     * @return
     */

    @RequestMapping("/getDistrictsByCity")
    public void getDistrictsByCity(long cityId, PrintWriter out) {
        JSON json = (JSON) JSON.toJSON(addressService.getDistrictsByCity(cityId));
        out.print(json);
        out.close();


    }


}
