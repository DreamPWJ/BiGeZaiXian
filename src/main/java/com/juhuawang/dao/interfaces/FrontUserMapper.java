package com.juhuawang.dao.interfaces;

import com.juhuawang.model.FrontUser;

public interface FrontUserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(FrontUser record);

    int insertSelective(FrontUser record);

    FrontUser selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(FrontUser record);

    int updateByPrimaryKey(FrontUser record);

    // 根据用户名和密码判断该用户是否存在
    int selectByUserNameAndPwd(String login,String password);

    // 根据用户名获取用户对象
    FrontUser getByUserName(String login);

    // 根据用户名和密码获取用户对象
    FrontUser getByUserNameAndPwd(String login,String password);
}