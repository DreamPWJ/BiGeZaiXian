package com.juhuawang.service.services;

import com.juhuawang.dao.interfaces.GoodMapper;
import com.juhuawang.model.Good;
import com.juhuawang.service.interfaces.IGoodService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * Created by 1250052380@qq.com on 2014/11/14.
 */
@Service
public class GoodServiceImpl implements IGoodService {
    @Resource
    private GoodMapper goodMapper;

    @Override
    public Object getByGoodId(long id) {
        return goodMapper.getByGoodId(id);
    }

    @Override
    public List queryGoodsByMark(String mark) {
        return goodMapper.queryGoodsByMark(mark);
    }

    @Override
    public List searchGoodByMark(String mark) {
        return goodMapper.searchGoodByMark(mark);
    }

    @Override
    public BigDecimal getOnSellCount(long companyId, long storageId, long goodId, BigDecimal price) {
        return goodMapper.getOnSellCount(companyId,storageId,goodId,price);
    }

    @Override
    public List queryGoodPicsByGoodId(long goodId) {
        return goodMapper.queryGoodPicsByGoodId(goodId);
    }

    @Override
    public List getGoodByFrontUserId(long uid) {
        return goodMapper.getGoodByFrontUserId(uid);
    }

    @Override
    public List queryByUidAndMarkOrGoodKind(long uid, String mark) {
        return goodMapper.queryByUidAndMarkOrGoodKind(uid,mark);
    }

    @Override
    public List queryStoragesBycompanyIdAndGoodId(long companyId, long goodId) {
        return goodMapper.queryStoragesBycompanyIdAndGoodId(companyId,goodId);
    }

    @Override
    public List queryGoodKindList(String type) {
        return goodMapper.queryGoodKindList(type);
    }

    @Override
    public List queryGoodUseList(String type) {
        return goodMapper.queryGoodUseList(type);
    }

    @Override
    public List queryDefalultGoods(String type,int begin,int end) {
        return goodMapper.queryDefalultGoods(type,begin,end);
    }

    @Override
    public List queryCompanyList(long goodId) {
        return goodMapper.queryCompanyList(goodId);
    }

    @Override
    public List getAjaxComPanyListByPrice(String type,int begin,int end) {
        return goodMapper.getAjaxComPanyListByPrice(type,begin,end);
    }

    @Override
    public List getAjaxComPanyListByNumber(String type,int begin,int end) {
        return goodMapper.getAjaxComPanyListByNumber(type,begin,end);
    }

    @Override
    public List getAjaxComPanyListByCondition(String type, String condition) {
        return goodMapper.getAjaxComPanyListByCondition(type,condition);
    }

    @Override
    public List getAjaxSearch(String input) {
        return goodMapper.getAjaxSearch(input);
    }

    @Override
    public Map getGoodContentByGoodId(long goodId,long userId) {
        return goodMapper.getGoodContentByGoodId(goodId,userId);
    }

    @Override
    public Map getToOrderGoodContent(long goodId) {
        return goodMapper.getToOrderGoodContent(goodId);
    }

    @Override
    public List queryGoods(long companyId, long goodId) {
        return goodMapper.queryGoods(companyId, goodId);
    }

    @Override
    public List queryDownSellGoods(long companyId, long storageId, long goodId) {
        return goodMapper.queryDownSellGoods(companyId,storageId,goodId);
    }
}
