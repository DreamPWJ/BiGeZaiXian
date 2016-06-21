package com.juhuawang.service.services;

import com.juhuawang.dao.interfaces.OrderStockMapper;
import com.juhuawang.model.OrderStock;
import com.juhuawang.service.interfaces.IOrderStockService;
import com.juhuawang.util.SysConstants;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by 1250052380@qq.com on 2014/11/14.
 */
@Service
public class OrderStockServiceImpl implements IOrderStockService {
    @Resource
    OrderStockMapper orderStockMapper;
    @Override
    public int insertSelective(long stockId,long orderId,long userId,String ip) {
        OrderStock orderStock = new OrderStock();
        orderStock.setStockid(stockId);
        orderStock.setOrderid(orderId);
        orderStock.setOperationid(userId);
        orderStock.setOperationip(ip);
        orderStock.setStatuscode(SysConstants.STATUSCODE_VALID);
        return orderStockMapper.insertSelective(orderStock);
    }
}
