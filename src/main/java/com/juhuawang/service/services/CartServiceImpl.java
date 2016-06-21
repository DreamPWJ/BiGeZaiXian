package com.juhuawang.service.services;

import com.juhuawang.dao.interfaces.CartMapper;
import com.juhuawang.model.Cart;
import com.juhuawang.service.interfaces.ICartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * Created by 1250052380@qq.com on 2014/11/14.
 */

@Service("cartService")
public class CartServiceImpl implements ICartService{
    @Resource
    private CartMapper cartMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return cartMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Cart record) {
        return cartMapper.insert(record);
    }

    @Override
    public int insertSelective(Cart record) {
        return cartMapper.insertSelective(record);
    }

    @Override
    public Cart selectByPrimaryKey(Long id) {
        return cartMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Cart record) {
        return cartMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Cart record) {
        return cartMapper.updateByPrimaryKey(record);
    }

    @Override
    public Long getCount(long userId, long companyId, long storageId, long goodId, BigDecimal price) {
        return cartMapper.getCount(userId,companyId,storageId,goodId,price);
    }

    @Override
    public List queryByFrontUserId(long uid) {
        return cartMapper.queryByFrontUserId(uid);
    }

    @Override
    public Map getAmountByUserId(long uid) {
        return null;
    }

    @Override
    public int newCart(String codeNo, long stockId, long buyerId, String ip) {
        // 商品加入购物车
        Cart cart = new Cart();
        cart.setCodeno(codeNo);
        cart.setFrontuserid(buyerId);
        cart.setStockid(stockId);
        cart.setOperationip(ip);
        return cartMapper.insertSelective(cart);
    }
}
