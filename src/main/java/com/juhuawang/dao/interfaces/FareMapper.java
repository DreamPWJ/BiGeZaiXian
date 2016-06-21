package com.juhuawang.dao.interfaces;

import com.juhuawang.model.Fare;

public interface FareMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Fare record);

    int insertSelective(Fare record);

    Fare selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Fare record);

    int updateByPrimaryKey(Fare record);
}