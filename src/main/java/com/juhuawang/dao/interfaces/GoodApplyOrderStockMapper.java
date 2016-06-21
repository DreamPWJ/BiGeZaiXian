package com.juhuawang.dao.interfaces;

import com.juhuawang.model.GoodApplyOrderStock;

public interface GoodApplyOrderStockMapper {
    int deleteByPrimaryKey(Long id);

    int insert(GoodApplyOrderStock record);

    int insertSelective(GoodApplyOrderStock record);

    GoodApplyOrderStock selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(GoodApplyOrderStock record);

    int updateByPrimaryKey(GoodApplyOrderStock record);
}