package com.juhuawang.service.services;

import com.juhuawang.dao.interfaces.BaseMapper;
import com.juhuawang.dao.interfaces.OrderStockMapper;
import com.juhuawang.dao.interfaces.RecOrderMapper;
import com.juhuawang.dao.interfaces.StockMapper;
import com.juhuawang.model.OrderStock;
import com.juhuawang.model.RecOrder;
import com.juhuawang.model.Stock;
import com.juhuawang.service.interfaces.IOrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 1250052380@qq.com on 2014/11/14.
 * 订单实现类
 */

@Service
public class OrderServiceImpl implements IOrderService {
    @Resource
    private RecOrderMapper recOrderMapper;
    @Resource
    private OrderStockMapper recStockMapper;
    @Resource
    private BaseMapper baseMapper;
    @Resource
    private StockMapper stockMapper;

    @Override
    public int addOrder(String orderNo, long userId, String ip, String srcCode, String orderStatusCode) {
        RecOrder order = new RecOrder();
        order.setOrderno(orderNo);
        order.setGuestid(userId);
        order.setOperationip(ip);
        order.setSrccode(srcCode);
        order.setOrderstatuscode(orderStatusCode);

        return recOrderMapper.insertSelective(order);
    }

    @Override
    public long getIdByOrderNo(String orderNo) {
        return recOrderMapper.getIdByOrderNo(orderNo);
    }

    @Override
    public List queryOrderByUidAndStatus(long uid, String statusCode) {
        return recOrderMapper.queryOrderByUidAndStatus(uid, statusCode);
    }

    @Override
    public long getCountByUidAndStatus(long uid, String status) {
        return recOrderMapper.getCountByUidAndStatus(uid, status);
    }

    @Override
    public long getNoTakeGood(long uid) {
        return recOrderMapper.getNoTakeGood(uid);
    }

    @Override
    public List queryCartByUidAndOrderId(long uid, long orderId, String orderSource) {
        return recOrderMapper.queryCartByUidAndOrderId(uid, orderId, orderSource);
    }

    @Override
    public List querySellerOrders(long uid) {
        return recOrderMapper.querySellerOrders(uid);
    }

    @Override
    public List queryOrdersByStatus(long uid, String orderStatus) {
        return recOrderMapper.queryOrdersByStatus(uid,orderStatus);
    }

    /**
     * PC端 提交订单保存方法
     */
    @Override
    public int submitOrder(Stock stock, RecOrder recOrder, OrderStock orderStock) {
        stockMapper.insertSelective(stock);//出库
        long stockId = stock.getId();
        recOrderMapper.insertSelective(recOrder);
        long orderId = recOrder.getId();
        orderStock.setOrderid(orderId);
        orderStock.setStockid(stockId);
        return recStockMapper.insertSelective(orderStock);
    }


    /**
     * PC 获取订单分页列表
     */
    @Override
    public Map<String, Object> getOrderList(int pageNow, int pageSize, long userId,long companyId) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("tableName", "  REC_ORDER o INNER JOIN  REC_ORDER_STOCK os ON o.ID = os.ORDERID  INNER JOIN  REC_STOCK s ON s.ID = os.STOCKID ");
        paramMap.put("fields", " o.id as orderId,o.ORDERNO,o.CREATETIME,s.INITNUM,s.FINALMONEY ");
        paramMap.put("pageNow", pageNow);
        paramMap.put("pageSize", pageSize);
        paramMap.put("wherecase", " s.COMPANYID="+companyId+" or o.GUESTID="+userId);
        paramMap.put("orderField", "o.id");
        paramMap.put("orderFlag", 1);
        this.baseMapper.getPaging(paramMap);
        return paramMap;
    }

    /**
     * PC 获取订单详情
     */
    @Override
    public Map<String, Object> getOrderDetail(long orderId) {
        return recOrderMapper.getOrderDetail(orderId);
    }

    /**
     * PC 获取订单支付详情
     */
    @Override
    public Map<String, Object> getOrderPayDetail(long orderId){
        return recOrderMapper.getOrderPayDetail(orderId);
    }

    /**
     * Hybrid APP订单图表数据查询
     */
    @Override
    public List getOrderData(){
        return recOrderMapper.getOrderData();
    }

    /**
     * 支付货款页面数据
     */
    @Override
    public  Map getPayMoneyDetail(long userId,long goodId){
        return  recOrderMapper.getPayMoneyDetail(userId,goodId);
    }
}
