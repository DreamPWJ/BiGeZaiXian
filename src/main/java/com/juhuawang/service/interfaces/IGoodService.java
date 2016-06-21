package com.juhuawang.service.interfaces;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * Created by 1250052380@qq.com on 2014/11/14.
 */
public interface IGoodService {
    // 通过goodId查询商品信息
    Object getByGoodId(long id);

    // 根据牌号查询商品列表页面商品数据
    List queryGoodsByMark(String mark);

    // 根据牌号查询商品列表页面商品数据
    List searchGoodByMark(String mark);

    // 获取当前商品的在售数量
    BigDecimal getOnSellCount(long companyId,long storageId,long goodId,BigDecimal price);

    // 根据商品库存ID查询商品图片
    List queryGoodPicsByGoodId(long goodId);

    // 根据用户ID查询商品信息
    List getGoodByFrontUserId(long uid);

    // 根据用户ID、牌号或者品种获取商品信息
    List queryByUidAndMarkOrGoodKind(long uid,String mark);

    // 根据公司ID、商品ID查询仓库信息
    List queryStoragesBycompanyIdAndGoodId(long companyId,long goodId);

    // 查询所有的商品品种
    List queryGoodKindList(String type);

    // 查询所有的商品用途
    List queryGoodUseList(String type);

    // 查询综合排序下的商品列表
    List queryDefalultGoods(String type,int begin,int end);

    // 根据商品ID查询所有持有该商品信息的商家列表
    List queryCompanyList(long goodId);

    // 获取所有PE、PP、PVC商品按价格排序
    List getAjaxComPanyListByPrice(String type,int begin,int end);

    // 获取所有PE、PP、PVC商品按销量倒序
    List getAjaxComPanyListByNumber(String type,int begin,int end);

    // 根据条件获取商品列表
    List getAjaxComPanyListByCondition(String type,String condition);

    // 根据品种、牌号、厂商进行模糊查询
    List getAjaxSearch(String input);

    // 根据商品ID查询商品信息
    Map getGoodContentByGoodId(long goodId,long userId);

    // 提交订单页面查询商品信息
    Map getToOrderGoodContent(long goodId);

    // 根据companyId、goodId获取仓库id
    List queryGoods(long companyId,long goodId);

    // 查询下架页面商品信息
    List queryDownSellGoods(long companyId,long storageId,long goodId);
}
