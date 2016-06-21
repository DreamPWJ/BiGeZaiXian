package com.juhuawang.service.interfaces;

import com.juhuawang.model.Company;

/**
 * Created by 1250052380@qq.com on 2014/11/14.
 */
public interface ICompanyService {
    // 根据用户ID查询公司名称、法人、联系电话、地址等
    Company getByFrontUserId(long uid);
    // 根据公司Id获取公司对象
    Company getByCompanyId(long companyId);
    // 更新当前当前对象
    int updateCompany(Company company);
}
