package com.juhuawang.dao.interfaces;

import com.juhuawang.model.Buy;

public interface BuyMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Buy record);

    int insertSelective(Buy record);

    Buy selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Buy record);

    int updateByPrimaryKey(Buy record);
}