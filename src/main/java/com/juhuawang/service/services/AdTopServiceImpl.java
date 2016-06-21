package com.juhuawang.service.services;

import com.juhuawang.dao.interfaces.AdTopMapper;
import com.juhuawang.service.interfaces.IAdTopService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 1250052380@qq.com on 2014/11/14.
 */
@Service
public class AdTopServiceImpl implements IAdTopService {
    @Resource
    private AdTopMapper adTopMapper;

    @Override
    public List queryAdTopsByType() {
        return adTopMapper.queryAdTopsByType();
    }
}
