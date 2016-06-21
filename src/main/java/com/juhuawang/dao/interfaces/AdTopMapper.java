package com.juhuawang.dao.interfaces;

import com.juhuawang.model.AdTop;

import java.util.List;

public interface AdTopMapper {
    int deleteByPrimaryKey(Long id);

    int insert(AdTop record);

    int insertSelective(AdTop record);

    AdTop selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(AdTop record);

    int updateByPrimaryKey(AdTop record);

    // 查询首页广告图片
    List queryAdTopsByType();
}