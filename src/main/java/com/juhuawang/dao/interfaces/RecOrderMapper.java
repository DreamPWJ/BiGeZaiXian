package com.juhuawang.dao.interfaces;

import com.juhuawang.model.RecOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface RecOrderMapper {
    int deleteByPrimaryKey(Long id);

    int insertSelective(RecOrder record);

    RecOrder selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(RecOrder record);

    int updateByPrimaryKey(RecOrder record);

    // 通过订单编号获取订单ID
    long getIdByOrderNo(String orderNo);

    // 根据用户ID、订单状态获取订单列表
    List queryOrderByUidAndStatus(long uid, String statusCode);

    // 根据用户ID获取待支付订单的个数
    long getCountByUidAndStatus(long uid, String status);

    // 根据用户ID获取待提货订单的个数
    long getNoTakeGood(long uid);

    // 根据用户ID、订单ID查询来自购物车的订单、商品信息
    List queryCartByUidAndOrderId(long uid, long orderId, String orderSource);

    // 根据供应商ID获取全部订单
    List querySellerOrders(long userId);

    // 根据订单状态异步获取订单数据
    List queryOrdersByStatus(long uid, String orderStatus);

    /**
     * PC 获取订单详情
     */
    Map<String, Object> getOrderDetail(long orderId);

    /**
     * PC 获取订单支付详情
     */
    Map<String, Object> getOrderPayDetail(long orderId);

    /**
     * Hybrid APP订单图表数据查询
     */
    List getOrderData();


    /**
     * 支付货款页面数据
     */
    public  Map getPayMoneyDetail(@Param("userId") long userId,@Param("goodId") long goodId);
}