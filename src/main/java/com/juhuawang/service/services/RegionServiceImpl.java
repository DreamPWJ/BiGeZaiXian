package com.juhuawang.service.services;

import com.juhuawang.dao.interfaces.RegionMapper;
import com.juhuawang.service.interfaces.IRegionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 1250052380@qq.com on 2014/11/14.
 */
@Service
public class RegionServiceImpl implements IRegionService {
    @Resource
    private RegionMapper regionMapper;
    @Override
    public List getAllProvinces() {
        return regionMapper.getAllProvinces();
    }

    @Override
    public List getCitysByPid(long pid) {
        return regionMapper.getCitysByPid(pid);
    }

    @Override
    public List getCountysByPid(long cityId) {
        return regionMapper.getCountysByPid(cityId);
    }
}
