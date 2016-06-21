package com.juhuawang.dao.interfaces;

import com.juhuawang.model.SellDet;

public interface SellDetMapper {
    int deleteByPrimaryKey(Long id);

    int insert(SellDet record);

    int insertSelective(SellDet record);

    SellDet selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SellDet record);

    int updateByPrimaryKey(SellDet record);
}