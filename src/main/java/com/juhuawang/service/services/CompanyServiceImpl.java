package com.juhuawang.service.services;

import com.juhuawang.dao.interfaces.CompanyMapper;
import com.juhuawang.model.Company;
import com.juhuawang.service.interfaces.ICompanyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by 1250052380@qq.com on 2014/11/14.
 */
@Service
public class CompanyServiceImpl implements ICompanyService {
    @Resource
    private CompanyMapper companyMapper;
    @Override
    public Company getByFrontUserId(long uid) {
        return companyMapper.getByFrontUserId(uid);
    }

    @Override
    public Company getByCompanyId(long companyId) {
        return companyMapper.selectByPrimaryKey(companyId);
    }

    @Override
    public int updateCompany(Company company) {
        return companyMapper.updateByPrimaryKeySelective(company);
    }
}
