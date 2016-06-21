package com.juhuawang.dao.interfaces;

import com.juhuawang.model.Cart;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public interface CartMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Cart record);

    int insertSelective(Cart record);

    Cart selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);

    // 检查用户当前加入购物车的商品是否已经存在
    Long getCount(long userId,long companyId,long storageId,long goodId,BigDecimal price);

    // 根据用户ID查询购物车中的商品列表
    List queryByFrontUserId(long uid);

    // 根据用户ID查询购物车中商品数量和总价
//    Map getAmountByUserId(long uid);
}