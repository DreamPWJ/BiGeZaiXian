package com.juhuawang.dao.interfaces;

import com.juhuawang.model.GoodTrack;

public interface GoodTrackMapper {
    int deleteByPrimaryKey(Long id);

    int insert(GoodTrack record);

    int insertSelective(GoodTrack record);

    GoodTrack selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(GoodTrack record);

    int updateByPrimaryKey(GoodTrack record);
}