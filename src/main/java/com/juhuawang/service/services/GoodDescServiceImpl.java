package com.juhuawang.service.services;

import com.juhuawang.dao.interfaces.GoodDescMapper;
import com.juhuawang.model.GoodDesc;
import com.juhuawang.service.interfaces.IGoodDescService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by 1250052380@qq.com on 2014/11/14.
 */
@Service
public class GoodDescServiceImpl implements IGoodDescService {
    @Resource
    private GoodDescMapper goodDescMapper;
    @Override
    public int addGoodDesc(long goodId,long userId,String goodDesc,String ip) {
        GoodDesc desc = new GoodDesc();
        desc.setGoodid(goodId);
        desc.setSelluserid(userId);
        desc.setContent(goodDesc);
        desc.setOperationip(ip);
        return goodDescMapper.insertSelective(desc);
    }
}
