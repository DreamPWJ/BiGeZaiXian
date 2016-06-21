package com.juhuawang.dao.interfaces;

import com.juhuawang.model.Stock;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public interface StockMapper {
    int deleteByPrimaryKey(Long id);

    int insertSelective(Stock record);

    Stock selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Stock record);

    int updateByPrimaryKey(Stock record);

    /**
     * 获取库存信息根据商品和公司
     */
     List getStocksByGoodId(@Param("companyId") long companyId, @Param("goodId") long goodId);
    // 根据库存编号查询库存Id
    long getStockIdByCodeNo(String codeNo);

    // 根据companyId、goodId、storageId查询商品入库数量、确认数量列表
    List queryInitNumAndAffirmNum(long companyId,long storageId,long goodId);

    // 查询商品入库和确认合计
    Object getInitSumAndAffirmSum(long companyId,long storageId,long goodId);

    // 查询当前用户下可用的上架数量
    Object getAvailableStockNum(long companyId,long storageId,long goodId);

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
     * pc商品获取库存上架明细方法
     *
     */
    List getStockDetail(Map argmap);


    /**
     * pc商品获取库存上架明细方法
     *
     */
    Map getSSEUpdatePutawayStock();

}