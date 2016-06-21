package com.juhuawang.dao.interfaces;

import com.juhuawang.model.BuyDet;

public interface BuyDetMapper {
    int deleteByPrimaryKey(Long id);

    int insert(BuyDet record);

    int insertSelective(BuyDet record);

    BuyDet selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(BuyDet record);

    int updateByPrimaryKey(BuyDet record);
}