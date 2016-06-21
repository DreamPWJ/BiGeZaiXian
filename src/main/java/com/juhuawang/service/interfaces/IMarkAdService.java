package com.juhuawang.service.interfaces;

import java.util.List;

/**
 * Created by 1250052380@qq.com on 2014/11/14.
 */
public interface IMarkAdService {
    // 根据品种（PE、PP、PVC）查询含有图片的两个广告位数据
    List queryMarkAdsHasPic(String type);
    // 根据品种（PE、PP、PVC）查询热门牌号列表
    List queryMarkAdsByType(String type);
}
