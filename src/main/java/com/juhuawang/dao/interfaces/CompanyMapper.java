package com.juhuawang.dao.interfaces;

import com.juhuawang.model.Company;

public interface CompanyMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Company record);

    int insertSelective(Company record);

    Company selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Company record);

    int updateByPrimaryKey(Company record);

    // 根据用户ID查询公司名称、法人、联系电话、地址等
    Company getByFrontUserId(long uid);
}