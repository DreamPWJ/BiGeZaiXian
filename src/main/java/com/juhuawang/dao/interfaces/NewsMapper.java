package com.juhuawang.dao.interfaces;

import com.juhuawang.model.News;

import java.util.Map;

public interface NewsMapper {
    int deleteByPrimaryKey(Long id);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKeyWithBLOBs(News record);

    int updateByPrimaryKey(News record);
    /**
     * pc首页新闻数据详情展示
     *
     */
    News getIndexNewsdetails(long newsid);
}