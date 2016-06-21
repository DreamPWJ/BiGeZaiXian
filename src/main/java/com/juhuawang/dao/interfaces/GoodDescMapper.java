package com.juhuawang.dao.interfaces;

import com.juhuawang.model.GoodDesc;

public interface GoodDescMapper {
    int deleteByPrimaryKey(Long id);


    int insertSelective(GoodDesc record);

    GoodDesc selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(GoodDesc record);

    int updateByPrimaryKey(GoodDesc record);
}