package com.juhuawang.service.interfaces;

import com.juhuawang.model.OrderStock;
import com.juhuawang.model.RecOrder;
import com.juhuawang.model.Stock;
import com.juhuawang.util.SysConstants;

import java.util.List;
import java.util.Map;

/**
 * Created by 1250052380@qq.com on 2014/11/14.
 */
public interface IOrderService {
    // 新增订单记录
    int addOrder(String orderNo, long userId,String ip,String srcCode,String orderStatusCode);

    // 根据订单编号查询订单Id
    long getIdByOrderNo(String orderNo);

    // 根据用户ID、订单状态查询订单列表
    List queryOrderByUidAndStatus(long uid, String statusCode);

    // 根据用户ID获取待支付订单的个数
    long getCountByUidAndStatus(long uid, String status);

    // 根据用户ID获取待提货订单的个数
    long getNoTakeGood(long uid);

    // 查询购物车来源订单、商品信息
    List queryCartByUidAndOrderId(long uid,long orderId,String orderSource);

    // 根据供应商ID查询所有订单
    List querySellerOrders(long uid);

    // 根据订单状态异步获取订单数据
    List queryOrdersByStatus(long uid,String orderStatus);

    /**
     * PC端 提交订单保存方法
     */
   int submitOrder(Stock stock,RecOrder recOrder, OrderStock orderStock);

    /**
     * PC 获取订单分页列表
     */

     Map<String, Object> getOrderList(int pageNow, int pageSize,long userId,long companyId);

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
    Map getPayMoneyDetail(long userId,long goodId);

}
