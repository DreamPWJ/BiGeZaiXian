package com.juhuawang.dao.interfaces;

import com.juhuawang.model.FinanceApply;

import java.math.BigDecimal;

public interface FinanceApplyMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(FinanceApply record);

    int insertSelective(FinanceApply record);

    FinanceApply selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(FinanceApply record);

    int updateByPrimaryKey(FinanceApply record);
}