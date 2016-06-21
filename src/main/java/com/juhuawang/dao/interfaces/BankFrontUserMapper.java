package com.juhuawang.dao.interfaces;

import com.juhuawang.model.BankFrontUser;

public interface BankFrontUserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(BankFrontUser record);

    int insertSelective(BankFrontUser record);

    BankFrontUser selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(BankFrontUser record);

    int updateByPrimaryKey(BankFrontUser record);
}