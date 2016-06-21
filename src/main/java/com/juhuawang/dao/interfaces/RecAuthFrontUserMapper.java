package com.juhuawang.dao.interfaces;

import com.juhuawang.model.RecAuthFrontUser;

public interface RecAuthFrontUserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(RecAuthFrontUser record);

    int insertSelective(RecAuthFrontUser record);

    RecAuthFrontUser selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(RecAuthFrontUser record);

    int updateByPrimaryKey(RecAuthFrontUser record);
}