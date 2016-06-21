package com.juhuawang.dao.interfaces;

import com.juhuawang.model.MarkAd;

import java.util.List;

public interface MarkAdMapper {

    int deleteByPrimaryKey(Long id);

    int insert(MarkAd record);

    int insertSelective(MarkAd record);

    MarkAd selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(MarkAd record);

    int updateByPrimaryKey(MarkAd record);

    // 根据品种（PE、PP、PVC）查询含有图片的两个广告位数据
    List queryMarkAdsHasPic(String type);

    // 根据品种（PE、PP、PVC）查询热门牌号列表
    List queryMarkAdsByType(String type);
}