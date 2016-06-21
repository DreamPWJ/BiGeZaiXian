package com.juhuawang.dao.interfaces;

import java.util.List;
import java.util.Map;

/**
 * @author pwj on 2015/8/20
 *         公共的Dao接口类  定义常用方法实现代码复用
 */
public interface BaseMapper<Entity> {

    /**
     * 公用分页存储过程方法
     * map存储过程传入的参数
     */
    public List getPaging(Map map);

    /**
     * 根据当前用户获取公司的Id
     */
    public long getCompayIdByUser(long userId);

    /**
     * 获取所有库存类型的公共方法
     */
    public List getStockTypes();

    /**
     * 商品中 品种的信息查询
     */
    public List getGoodKindCode();

    /**
     * 商品中 计量单位的信息查询
     */
    public List getMeaCode();

    /**
     * 商品中 用途级别的信息查询
     */
    public List getUseCode();

    /**
     * 商品中 加工级别的信息查询
     */
    public List getMacCode();

    /**
     * 商品中 商品类型的信息查询
     */
    public List getGoodTypeCode();

    /**
     * 获取字典表的包装类型
     */
    public List getPackTypeCode();
    /**
     * 获取字典表包装说明类型
     */

    public List getPackContent();

    /**
     * 获取字典表包装单位类型
     */
    public List getPackageCode();

    /**
     * 获取仓库地址下拉列表展示
     */
    public List getStoragesForSelect();

}
