package com.juhuawang.dao.interfaces;

import com.juhuawang.model.Sell;

public interface SellMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Sell record);

    int insertSelective(Sell record);

    Sell selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Sell record);

    int updateByPrimaryKey(Sell record);
}