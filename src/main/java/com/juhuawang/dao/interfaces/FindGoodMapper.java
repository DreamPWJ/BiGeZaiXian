package com.juhuawang.dao.interfaces;

import com.juhuawang.model.FindGood;

public interface FindGoodMapper {
    int deleteByPrimaryKey(Long id);

    int insert(FindGood record);

    int insertSelective(FindGood record);

    FindGood selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(FindGood record);

    int updateByPrimaryKey(FindGood record);
}