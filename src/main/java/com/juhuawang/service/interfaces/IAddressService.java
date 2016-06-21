package com.juhuawang.service.interfaces;

import com.juhuawang.model.RecAddress;
import com.juhuawang.model.Storage;

import java.util.List;
import java.util.Map;


/**
 * Created by pwj  on 2015/8/24 0024.
 */
public interface IAddressService {

    /**
     * pc库存地址管理信息获取
     *
     * @return
     */

    public Map<String, Object> getStorages(int pageNow, int pageSize);

    /**
     * pc地址管理省市信息获取
     *
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
     *
     * @return
     */

    public List getDistrictsByCity(long cityId);

    /**
     * pc地址管理增加地址保存
     *
     * @return
     */

    public void addSite(Storage storage);

    // 根据用户ID查询所有地址
    List queryListByUid(long uid);

    // 根据主键查询地址对象
    Map getByAddressId(long addressId);

    // 保存收货地址
    int saveAddress(int type,long addressId,String ip, long uid, String codeNo, String postcode, String name_province, String name_city, String name_county, String linkMan, String mobphone, String addressDetail, String defaultAddress);

    // 根据主键删除
    int deleteByAddressId(long addressId);

}
