package com.juhuawang.dao.interfaces;

import com.juhuawang.model.GoodPic;

public interface GoodPicMapper {
    int deleteByPrimaryKey(Long id);

    int insertSelective(GoodPic record);

    GoodPic selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(GoodPic record);

    int updateByPrimaryKey(GoodPic record);
}