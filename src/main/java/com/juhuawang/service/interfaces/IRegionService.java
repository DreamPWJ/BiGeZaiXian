package com.juhuawang.service.interfaces;

import java.util.List;

/**
 * Created by 1250052380@qq.com on 2014/11/14.
 */
public interface IRegionService {
    // 获取所有的省
    List getAllProvinces();

    // 根据provinceId获取所有的市
    List getCitysByPid(long pid);

    // 根据cityId获取所有的县
    List getCountysByPid(long cityId);
}
