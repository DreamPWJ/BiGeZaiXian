package com.juhuawang.service.interfaces;

import com.juhuawang.model.Cart;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * Created by 1250052380@qq.com on 2014/11/14.
 */
public interface ICartService {
    int deleteByPrimaryKey(Long id);

    int insert(Cart record);

    int insertSelective(Cart record);

    Cart selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);

    // 检查用户当前加入购物车的商品是否已经存在
    Long getCount(long userId,long companyId,long storageId,long goodId,BigDecimal price);

    // 根据用户ID查询购物车中的商品
    List queryByFrontUserId(long uid);

    // 根据用户ID查询购物车中商品数量和总价
    Map getAmountByUserId(long uid);

    int newCart(String codeNo,long stockId,long buyerId,String ip);


}
