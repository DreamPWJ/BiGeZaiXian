package com.juhuawang.dao.interfaces;

import com.juhuawang.model.Dic;

public interface DicMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Dic record);

    int insertSelective(Dic record);

    Dic selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Dic record);

    int updateByPrimaryKey(Dic record);
}