package com.juhuawang.service.interfaces;

import com.juhuawang.model.Good;
import com.juhuawang.model.GoodDesc;
import com.juhuawang.model.GoodPic;
import com.juhuawang.model.Stock;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * Created by pwj.
 */
public interface IOrderGoodService {
    /**
     * 是否存在商品
     */

    Long getExistGoodId(Good good);

    /**
     * 商品中 品种的信息查询
     */
    public List getGoodKindCode();


    /**
     * 商品中 计量单位的信息查询
     */
    public List getMeaCode();

    /**
     * 商品中 用途级别的信息查询
     */
    public List getUseCode();

    /**
     * 商品中 加工级别的信息查询
     */
    public List getMacCode();

    /**
     * 商品中 商品类型的信息查询
     */
    public List getGoodTypeCode();

    /**
     * pc我的商品发布和入库保存方法
     *
     * @return
     */
    public void saveGoodandStock(Good good, Stock stock, GoodDesc goodDesc, GoodPic goodPic);

    /**
     * mobilephone发布商品
     *
     * @param good
     * @param stock
     * @param goodDesc
     */
    void saveGoodMob(Good good, Stock stock, GoodDesc goodDesc);

    /**
     * 获取商品分页列表
     */
    public Map<String, Object> getGoodList(int pageNo, int pageSize, long companyId);

    /**
     * 商品详情查询
     *
     * @return
     */
    public Map<String, Object> getGoodById(long goodId);

    /**
     * 获取库存上架页面信息
     */
//    public Map<String,Object> getOnShelveByStockId(long stockId,long priceId);

    /**
     * 订单详情页面数据查询
     */
    public Map<String, Object> getOrderDetail(Map<String, Object> map);

    /**
     * 获取字典表的包装类型
     */
    public List getPackTypeCode();

    /**
     * 获取字典表包装说明类型
     */

    public List getPackContent();

    /**
     * 获取字典表包装单位类型
     */
    public List getPackageCode();

    /**
     * 获取仓库地址下拉列表展示
     */
    public List getStoragesForSelect();

}
