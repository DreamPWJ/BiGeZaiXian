package com.juhuawang.service.interfaces;


import com.juhuawang.model.News;
import com.juhuawang.model.Stock;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * Created by pwj  on 2015/8/26 0026.
 */
public interface IStockService {
    int deleteByPrimaryKey(Long id);

    int insertSelective(Stock record);

    Stock selectByPrimaryKey(Long id);

    int updateByPrimaryKey(Stock record);

    // 根据主键获取库存对象
    Stock getStockByStockId(long stockId);

    // 库存表新增数据
    int addStock(String stockNo,long companyId,long storageId,long goodId,BigDecimal price,BigDecimal number,long userId,String ip,String stockCode);

    // 新增
    int addNewStock(long goodId,long companyId,long storageId,long userId,BigDecimal stockIn);

    // 更新库存记录
    int updateByPrimaryKeySelective(Stock record);

    // 根据库存编号查询库存Id
    long getStockIdByCodeNo(String codeNo);

    // 根据companyId、goodId、storageId查询商品入库数量、确认数量列表
    List queryInitNumAndAffirmNum(long companyId,long storageId,long goodId);

    // 查询商品入库和确认合计
    Object getInitSumAndAffirmSum(long companyId,long storageId,long goodId);

    // 查询当前用户下可用的上架数量
    Object getAvailableStockNum(long companyId,long storageId,long goodId);

    // 上架新增
    int addUpSell(String codeNo,long userId,long companyId,long storageId,long goodId,BigDecimal price,BigDecimal upSell,String ip);

    // 上架列表信息
    List getOnSellList(long companyId,long storageId,long goodId);

    // 上架总数
    List getUpSellDetails(long companyId,long storageId,long goodId);
    // 查询商品类型明细
    List queryDownSellDetails(long companyId,long storageId,long goodId,BigDecimal price,String typeCode);
    // 查询用户入库列表
    List queryStockInList(long userId);

    // 异步获取入库列表-用于搜索
    List getAjaxStockCenter(long userId,String condition);

    // 查询上架、下架记录
    List querySellList(long userId);

    // 异步获取上下架记录-用于搜索
    List getAjaxSellList(long userId,String condition);

    // 修改购物车数量
    int updateCartNum(BigDecimal number,long cartId);

    // 修改购物车表(rec_cart)设置没选中的为无效
    int updateCartStatus(long userId,String cartIds);

    /**
     * 添加库存获取仓库地址
     */

     List getStorageNames();

    /**
     * 增加库存方法
     */
     void addStock(Stock stock);

    /**
     * 获取库存信息根据商品和公司
     */
     List getStocksByGoodId(long companyId, long goodId);

    /**
     * 获取库存中心的列表信息
     */
    Map<String, Object> getStocks(int pageNow, int pageSize, long companyId);

    /**
     * pc商品详情查看仓库详情方法
     */
    Map<String, Object> getStorageDetail(int pageNow, int pageSize,Map argmap);
    /**
     * pc商品获取库存上架明细方法
     *
     */
     List getStockDetail(Map argmap);
    /**
     * 获取所有库存类型的公共方法
     */
     List getStockTypes();
    /**
     * pc首页PE PP PVC数据展示
     *
     */
    Map<String, Object>  getIndexPEPPPVC(Map argmap);
    /**
     * pc首页PE PP PVC数据成交情况展示
     *
     */
    Map<String, Object>  getIndexPEPPPVCDeal(Map argmap);

    /**
     * pc首页PE PP PVC顶部周成交数据情况展示
     *
     */

    Map<String, Object>  getIndexTopPEPPPVCDeal();

    /**
     * pc首页新闻数据展示
     *
     */

    Map<String, Object>  getIndexNews(Map map);

    /**
     * pc首页新闻数据详情展示
     *
     */
    News getIndexNewsdetails(long newsid);

    /**
     * pc获取上架信息是否有更新 用于SSE推送数据
     *
     */
    Map getSSEUpdatePutawayStock();
}
