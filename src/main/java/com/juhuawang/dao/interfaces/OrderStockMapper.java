package com.juhuawang.dao.interfaces;

import com.juhuawang.model.OrderStock;

public interface OrderStockMapper {
    int deleteByPrimaryKey(Long id);

    int insert(OrderStock record);

    int insertSelective(OrderStock record);

    OrderStock selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(OrderStock record);

    int updateByPrimaryKey(OrderStock record);
}