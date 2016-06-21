package com.juhuawang.service.services;


import com.juhuawang.dao.interfaces.*;
import com.juhuawang.model.Good;
import com.juhuawang.model.GoodDesc;
import com.juhuawang.model.GoodPic;
import com.juhuawang.model.Stock;
import com.juhuawang.service.interfaces.IOrderGoodService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by pwj.
 * 订单商品实现类
 */

@Service("orderGoodService")
public class OrderGoodServiceImpl implements IOrderGoodService {


    @Resource
    private GoodMapper goodMapper;

    @Resource
    private BaseMapper baseMapper;

    @Resource
    private GoodDescMapper goodDescMapper;

    @Resource
    private GoodPicMapper goodPicMapper;

    @Resource
    private StockMapper stockMapper;


    /**
     * 是否存在商品
     *
     * @param good
     * @return
     */

    @Override
    public Long getExistGoodId(Good good) {
        return goodMapper.getExistGoodId(good);
    }

    /**
     * 商品中 品种的信息查询
     */
    @Override
    public List getGoodKindCode() {
        return baseMapper.getGoodKindCode();
    }


    /**
     * 商品中 计量单位的信息查询
     */
    @Override
    public List getMeaCode() {
        return baseMapper.getMeaCode();
    }

    /**
     * 商品中 用途级别的信息查询
     */
    @Override
    public List getUseCode() {
        return baseMapper.getUseCode();
    }

    /**
     * 商品中 加工级别的信息查询
     */
    @Override
    public List getMacCode() {
        return baseMapper.getMacCode();
    }

    /**
     * 商品中 商品类型的信息查询
     */
    @Override
    public List getGoodTypeCode() {
        return baseMapper.getGoodTypeCode();
    }

    /**
     * pc我的商品发布入库保存方法
     *
     * @return
     */
    @Override
    public void saveGoodandStock(Good good, Stock stock, GoodDesc goodDesc, GoodPic goodPic) {
        goodMapper.insertSelective(good);
        long  goodId = good.getId();
        goodDesc.setGoodid(goodId);
        goodDescMapper.insertSelective(goodDesc);
        goodPic.setGoodid(goodId);
        goodPicMapper.insertSelective(goodPic);
        stock.setGoodid(goodId);
        stock.setStockcode("001");//入库
        stockMapper.insertSelective(stock);

    }

    /**
     * mobilephone发布商品
     */
    @Override
    public void saveGoodMob(Good good, Stock stock, GoodDesc goodDesc) {
        goodMapper.insertSelective(good);
        long  goodId = good.getId();
        goodDesc.setGoodid(goodId);
        goodDescMapper.insertSelective(goodDesc);
        stock.setGoodid(goodId);
        stock.setStockcode("001");//入库
        stockMapper.insertSelective(stock);

    }

    /**
     * 获取商品分页列表
     */
    @Override
    public Map<String, Object> getGoodList(int pageNow, int pageSize, long companyId) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("tableName", "DIC_GOOD g INNER JOIN REC_STOCK s ON g.ID = s.GOODID ");
        paramMap.put("fields", " g.ID as goodId,g.MARK,\n" +
                "  (select name from VIEW_DICTYPE where eng='goodKind' and LEVELCODE=g.GOODKINDCODE) as goodKindName,\n" +
                "  g.PRODUCER,g.PRODUCINGAREA,(select name from VIEW_DICTYPE where eng='packType' and LEVELCODE=g.packTypeCode) as packTypeName,\n" +
                "  (select name from VIEW_DICTYPE where eng='packageMemo' and LEVELCODE=g.packContent) as packContentName,\n" +
                "  SUM(case when s.stockcode=001  then s.INITNUM end) as INITNUM ,\n" +
                "  SUM(case when s.stockcode=001  then s.AFFIRMNUM end)  as AFFIRMNUM,\n" +
                "  SUM(case when s.stockcode=001  then s.AFFIRMNUM end) - nvl(SUM(case when s.stockcode=002  then s.AFFIRMNUM end ),0)\n" +
                "  + nvl(SUM(case when s.stockcode=003  then s.INITNUM end ),0) + nvl(SUM(case when s.stockcode=005  then s.INITNUM end ),0) as SURPLUSNUM,\n" +
                "  SUM(case when s.stockcode=002  then s.AFFIRMNUM end)-nvl(SUM(case when s.stockcode=003  then s.INITNUM end ) ,0)-nvl(SUM(case when s.stockcode=004  then s.INITNUM end ) ,0)  as SELLSURPLUSNUM,\n" +
                "  SUM(case when s.stockcode=004  then s.INITNUM end )  as selloutnum ");
        paramMap.put("pageNow", pageNow);
        paramMap.put("pageSize", pageSize);
        paramMap.put("wherecase", "s.COMPANYID=" + companyId + " GROUP BY g.ID,g.createtime,g.MARK,g.GOODKINDCODE ,g.PRODUCER,g.PRODUCINGAREA,g.packTypeCode,g.packContent");
        paramMap.put("orderField", "g.createtime ");
        paramMap.put("orderFlag", 1);
        this.baseMapper.getPaging(paramMap);
/*      List list = (List) paramMap.get("p_cursor");//表的结果集
        int myrows = (Integer) paramMap.get("myrows");//总记录数
        int myPageCount = (Integer) paramMap.get("myPageCount");//总分页数*/

        return paramMap;
    }

    /**
     * 商品详情查询
     *
     * @return
     */
    @Override
    public Map<String, Object> getGoodById(long goodId) {
        return goodMapper.getGoodById(goodId);
    }


    /**
     * 获取库存上架页面信息
     */
   /* @Override
    public Map<String, Object> getOnShelveByStockId(long stockId,long priceId) {
        return recPriceMapper.getOnShelveByStockId(stockId, priceId);
    }*/

    /**
     * 订单详情页面数据查询
     */
    @Override
    public Map<String, Object> getOrderDetail(Map<String, Object> map) {
        return goodMapper.getOrderDetail(map);
    }

    /**
     * 获取字典表的包装类型
     */
    @Override
    public List getPackTypeCode() {
        return baseMapper.getPackTypeCode();
    }

    /**
     * 获取字典表包装说明类型
     */
    @Override
    public List getPackContent() {
        return baseMapper.getPackContent();
    }

    /**
     * 获取字典表包装单位类型
     */
    @Override
    public List getPackageCode() {
        return baseMapper.getPackageCode();
    }

    /**
     * 获取仓库地址下拉列表展示
     */
    @Override
    public List getStoragesForSelect() {
        return baseMapper.getStoragesForSelect();
    }

}
