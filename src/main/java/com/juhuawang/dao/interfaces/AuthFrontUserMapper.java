package com.juhuawang.dao.interfaces;

import com.juhuawang.model.AuthFrontUser;

public interface AuthFrontUserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(AuthFrontUser record);

    int insertSelective(AuthFrontUser record);

    AuthFrontUser selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(AuthFrontUser record);

    int updateByPrimaryKey(AuthFrontUser record);
}