package com.juhuawang.dao.interfaces;

import com.juhuawang.model.VirtualAccount;

public interface VirtualAccountMapper {
    int deleteByPrimaryKey(Long id);

    int insert(VirtualAccount record);

    int insertSelective(VirtualAccount record);

    VirtualAccount selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(VirtualAccount record);

    int updateByPrimaryKey(VirtualAccount record);
}