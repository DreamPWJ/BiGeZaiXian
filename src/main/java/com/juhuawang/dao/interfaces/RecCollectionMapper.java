package com.juhuawang.dao.interfaces;

import com.juhuawang.model.RecCollection;

public interface RecCollectionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(RecCollection record);

    int insertSelective(RecCollection record);

    RecCollection selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(RecCollection record);

    int updateByPrimaryKey(RecCollection record);
}