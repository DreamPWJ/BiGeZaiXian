package com.juhuawang.dao.interfaces;

import com.juhuawang.model.GoodApply;

public interface GoodApplyMapper {
    int deleteByPrimaryKey(Long id);

    int insert(GoodApply record);

    int insertSelective(GoodApply record);

    GoodApply selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(GoodApply record);

    int updateByPrimaryKey(GoodApply record);
}