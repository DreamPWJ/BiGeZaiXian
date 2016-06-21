package com.juhuawang.dao.interfaces;

import com.juhuawang.model.Storage;

import java.util.List;

public interface StorageMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Storage record);

    int insertSelective(Storage record);

    Storage selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Storage record);

    int updateByPrimaryKey(Storage record);

    /**
     * 添加库存获取仓库地址
     *
     */
    public List getStorageNames();

}