package com.juhuawang.dao.interfaces;

import com.juhuawang.model.DicType;

public interface DicTypeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(DicType record);

    int insertSelective(DicType record);

    DicType selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(DicType record);

    int updateByPrimaryKey(DicType record);
}