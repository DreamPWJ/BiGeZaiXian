package com.juhuawang.dao.interfaces;

import com.juhuawang.model.Region;

import java.util.List;

public interface RegionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Region record);

    int insertSelective(Region record);

    Region selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Region record);

    int updateByPrimaryKey(Region record);

    /**
     * pc地址管理省市信息获取
     * @return
     */
    public List getProvinces();

    /**
     * pc地址管理省市的下级城市的信息获取
     *
     * @return
     */

    public List getCitysByProvince(long provinceId);

    /**
     * pc地址管理城市下级的区县的信息获取
     * @return
     */

    public List getDistrictsByCity(long cityId);



    // 获取所有省份的集合
    List getAllProvinces();

    // 根据provinceId获取所有市
    List getCitysByPid(long pid);

    // 根据cityId获取所有市
    List getCountysByPid(long cityId);
}