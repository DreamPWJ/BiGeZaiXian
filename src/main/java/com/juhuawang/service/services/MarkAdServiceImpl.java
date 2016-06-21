package com.juhuawang.service.services;

import com.juhuawang.dao.interfaces.MarkAdMapper;
import com.juhuawang.service.interfaces.IMarkAdService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 1250052380@qq.com on 2014/11/14.
 */
@Service
public class MarkAdServiceImpl implements IMarkAdService{
    @Resource
    private MarkAdMapper markAdMapper;

    @Override
    public List queryMarkAdsHasPic(String type) {
        return markAdMapper.queryMarkAdsHasPic(type);
    }

    @Override
    public List queryMarkAdsByType(String type) {
        return markAdMapper.queryMarkAdsByType(type);
    }
}
