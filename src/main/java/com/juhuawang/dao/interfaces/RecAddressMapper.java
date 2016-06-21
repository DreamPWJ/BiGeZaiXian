package com.juhuawang.dao.interfaces;

import com.juhuawang.model.RecAddress;

import java.util.List;
import java.util.Map;

public interface RecAddressMapper {
    int deleteByPrimaryKey(Long id);

    int insert(RecAddress record);

    int insertSelective(RecAddress record);

    RecAddress selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(RecAddress record);

    int updateByPrimaryKey(RecAddress record);

    // 根据用户ID查询所有的收货地址
    List queryListByUid(long uid);

    // 根据地址ID查询地址对象（多表联查）
    Map getByAddressId(long addressId);

}