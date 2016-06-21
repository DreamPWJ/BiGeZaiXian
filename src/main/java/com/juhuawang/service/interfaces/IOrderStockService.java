package com.juhuawang.service.interfaces;

/**
 * Created by 1250052380@qq.com on 2014/11/14.
 */
public interface IOrderStockService {
    int insertSelective(long stockId,long orderId,long userId,String ip);
}
