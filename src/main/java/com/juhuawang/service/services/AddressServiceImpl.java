package com.juhuawang.service.services;

import com.juhuawang.dao.interfaces.BaseMapper;
import com.juhuawang.dao.interfaces.RecAddressMapper;
import com.juhuawang.dao.interfaces.RegionMapper;
import com.juhuawang.dao.interfaces.StorageMapper;
import com.juhuawang.model.RecAddress;
import com.juhuawang.model.Storage;
import com.juhuawang.service.interfaces.IAddressService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by pwj  on 2015/8/24 0024.
 * 地址管理Service
 */
@Service
public class AddressServiceImpl implements IAddressService {

    @Resource
    RegionMapper regionMapper;
    @Resource
    StorageMapper storageMapper;

    @Resource
    BaseMapper baseMapper;

    @Resource
    RecAddressMapper recAddressMapper;

    /**
     * pc库存地址管理列表信息获取
     *
     * @return
     */
    @Override
    public Map<String ,Object>  getStorages(int pageNow, int pageSize) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("tableName", " dic_storage ");
        paramMap.put("fields", " * ");
        paramMap.put("pageNow", pageNow);
        paramMap.put("pageSize", pageSize);
        paramMap.put("orderField", "id");
        paramMap.put("orderFlag", 1);
        this.baseMapper.getPaging(paramMap);
        return paramMap;
    }

    /**
     * pc地址管理省市信息获取
     *
     * @return
     */
    @Override
    public List getProvinces() {
        return regionMapper.getProvinces();
    }

    /**
     * pc地址管理省市的下级城市的信息获取
     *
     * @return
     */
    @Override
    public List getCitysByProvince(long provinceId) {
        return regionMapper.getCitysByProvince(provinceId);
    }

    /**
     * pc地址管理城市下级的区县的信息获取
     *
     * @return
     */
    @Override
    public List getDistrictsByCity(long cityId) {
        return regionMapper.getDistrictsByCity(cityId);
    }

    /**
     * pc地址管理增加地址保存
     *
     * @return
     */
    @Override
    public void addSite(Storage storage) {
        storageMapper.insertSelective(storage);
    }

    @Override
    public List queryListByUid(long uid) {
        return recAddressMapper.queryListByUid(uid);
    }

    @Override
    public Map getByAddressId(long addressId) {
        return recAddressMapper.getByAddressId(addressId);
    }

    @Override
    public int saveAddress(int type,long addressId,String ip,long uid,String codeNo,String postcode,String name_province,String name_city,String name_county,String linkMan,String mobphone,String addressDetail,String defaultAddress) {
        RecAddress address = null;
        if (type == 1){
            address= new RecAddress();// 新增
            address.setFrontuserid(uid);
            address.setCodeno(codeNo);// 编号
        }
        if (type == 2){
            address=recAddressMapper.selectByPrimaryKey(addressId);// 修改
            address.setFrontuserid(address.getFrontuserid());
            address.setCodeno(address.getCodeno());// 编号
        }
        address.setAddress(addressDetail);
        address.setPostal(postcode);
        address.setLinkman(linkMan);
        address.setMobphone(mobphone);
        address.setAddrdefaultcode(defaultAddress);
        address.setProvcode(name_province);
        address.setCitycode(name_city);
        address.setCountycode(name_county);
        address.setOperationid(uid);
        address.setOperationip(ip);
        if (type==1){
            return recAddressMapper.insertSelective(address);// 新增
        }
        if (type==2){
            return recAddressMapper.updateByPrimaryKeySelective(address);// 修改
        }
        return 0;
    }

    @Override
    public int deleteByAddressId(long addressId) {
        return recAddressMapper.deleteByPrimaryKey(addressId);
    }
}
