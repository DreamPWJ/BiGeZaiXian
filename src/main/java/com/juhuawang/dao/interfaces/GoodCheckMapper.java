package com.juhuawang.dao.interfaces;

import com.juhuawang.model.GoodCheck;

public interface GoodCheckMapper {
    int deleteByPrimaryKey(Long id);

    int insert(GoodCheck record);

    int insertSelective(GoodCheck record);

    GoodCheck selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(GoodCheck record);

    int updateByPrimaryKey(GoodCheck record);
}