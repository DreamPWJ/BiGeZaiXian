package com.juhuawang.service.services;

import com.juhuawang.dao.interfaces.BaseMapper;
import com.juhuawang.dao.interfaces.NewsMapper;
import com.juhuawang.dao.interfaces.StockMapper;
import com.juhuawang.dao.interfaces.StorageMapper;
import com.juhuawang.model.FrontUser;
import com.juhuawang.model.Good;
import com.juhuawang.model.News;
import com.juhuawang.model.Stock;
import com.juhuawang.service.interfaces.IStockService;
import com.juhuawang.util.StringHelper;
import com.juhuawang.util.SysConstants;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by pwj  on 2015/8/26 0026.
 * 库存Service
 */
@Service
public class StockServiceImpl implements IStockService {

    @Resource
    BaseMapper baseMapper;
    @Resource
    StockMapper stockMapper;
    @Resource
    StorageMapper storageMapper;
    @Resource
    NewsMapper newsMapper;


    @Override
    public int deleteByPrimaryKey(Long id) {
        return stockMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(Stock record) {
        return stockMapper.insertSelective(record);
    }

    @Override
    public Stock selectByPrimaryKey(Long id) {
        return stockMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKey(Stock record) {
        return stockMapper.updateByPrimaryKey(record);
    }

    @Override
    public Stock getStockByStockId(long stockId) {
        return stockMapper.selectByPrimaryKey(stockId);
    }

    @Override
    public int addStock(String stockNo, long companyId, long storageId, long goodId, BigDecimal price, BigDecimal number, long userId, String ip, String stockCode) {
        Stock stockNew = new Stock();
        stockNew.setGoodid(goodId);
        stockNew.setCompanyid(companyId);
        stockNew.setStorageid(storageId);
        stockNew.setFrontuserid(userId);
        stockNew.setStockcode(stockCode);
        stockNew.setCodeno(stockNo);
        stockNew.setInitnum(number);
        stockNew.setAffirmnum(number);
//        stockNew.setPricenotax();
        stockNew.setPricehastax(price);
//        stockNew.setAmountnotax(BigDecimal.valueOf(stock.getPricenotax().doubleValue() * number.doubleValue()));
//        stockNew.setTaxmoney(BigDecimal.valueOf(stock.getPricehastax().doubleValue() * number.doubleValue() * good.getRate().doubleValue()));
//        stockNew.setFinalmoney(BigDecimal.valueOf(stock.getPricehastax().doubleValue() * number.doubleValue()));
        stockNew.setOperationip(ip);
        return stockMapper.insertSelective(stockNew);
    }

    @Override
    public int addNewStock(long goodId, long companyId, long storageId, long userId, BigDecimal stockIn) {
        Stock stock = new Stock();
        stock.setCodeno(StringHelper.getOrderNum());
        stock.setGoodid(goodId);
        stock.setCompanyid(companyId);
        stock.setStorageid(storageId);
        stock.setFrontuserid(userId);
        stock.setStockcode(SysConstants.STOCKCODE_STOCKIN);
        stock.setInitnum(stockIn);

        return stockMapper.insertSelective(stock);
    }

    @Override
    public int updateByPrimaryKeySelective(Stock record) {
        return stockMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public long getStockIdByCodeNo(String codeNo) {
        return stockMapper.getStockIdByCodeNo(codeNo);
    }

    @Override
    public List queryInitNumAndAffirmNum(long companyId, long storageId, long goodId) {
        return stockMapper.queryInitNumAndAffirmNum(companyId, storageId, goodId);
    }

    @Override
    public Object getInitSumAndAffirmSum(long companyId, long storageId, long goodId) {
        return stockMapper.getInitSumAndAffirmSum(companyId, storageId, goodId);
    }

    @Override
    public Object getAvailableStockNum(long companyId, long storageId, long goodId) {
        return stockMapper.getAvailableStockNum(companyId, storageId, goodId);
    }

    @Override
    public int addUpSell(String codeNo, long userId, long companyId, long storageId, long goodId, BigDecimal price, BigDecimal upSell, String ip) {
        Stock stockNew = new Stock();
        stockNew.setCodeno(codeNo);
        stockNew.setFrontuserid(userId);
        stockNew.setCompanyid(companyId);
        stockNew.setStorageid(storageId);
        stockNew.setGoodid(goodId);
        stockNew.setStockcode(SysConstants.STOCKCODE_INSELL);
        stockNew.setPricehastax(price);

//        stockNew.setPricenotax(price.divide(BigDecimal.valueOf(SysConstants.RATE_UPSELL),2));
//        stockNew.setPricenotax(price.divide(BigDecimal.valueOf(SysConstants.RATE_UPSELL)).setScale(2,RoundingMode.HALF_UP));
        stockNew.setInitnum(upSell);
        stockNew.setAffirmnum(upSell);
        stockNew.setOperationip(ip);
        return stockMapper.insertSelective(stockNew);
    }

    @Override
    public List getOnSellList(long companyId, long storageId, long goodId) {
        return stockMapper.getOnSellList(companyId, storageId, goodId);
    }

    @Override
    public List getUpSellDetails(long companyId, long storageId, long goodId) {
        return stockMapper.getUpSellDetails(companyId, storageId, goodId);
    }

    @Override
    public List queryDownSellDetails(long companyId, long storageId, long goodId, BigDecimal price, String typeCode) {
        return stockMapper.queryDownSellDetails(companyId, storageId, goodId, price, typeCode);
    }

    @Override
    public List queryStockInList(long userId) {
        return stockMapper.queryStockInList(userId);
    }

    @Override
    public List getAjaxStockCenter(long userId, String condition) {
        return stockMapper.getAjaxStockCenter(userId,condition);
    }

    @Override
    public List querySellList(long userId) {
        return stockMapper.querySellList(userId);
    }

    @Override
    public List getAjaxSellList(long userId, String condition) {
        return stockMapper.getAjaxSellList(userId,condition);
    }

    @Override
    public int updateCartNum(BigDecimal number, long cartId) {
        return stockMapper.updateCartNum(number,cartId);
    }

    @Override
    public int updateCartStatus(long userId, String cartIds) {
        return stockMapper.updateCartStatus(userId,cartIds);
    }

    /**
     * 添加库存获取仓库地址
     */
    @Override
    public List getStorageNames() {
        return storageMapper.getStorageNames();
    }


    /**
     * 增加库存方法
     */
    @Override
    public void addStock(Stock stock) {
        stockMapper.insertSelective(stock);
    }

    /**
     * 获取库存信息根据商品和公司
     */

    @Override
    public List getStocksByGoodId(long companyId, long goodId) {
        return stockMapper.getStocksByGoodId(companyId, goodId);
    }

    /**
     * 获取库存中心的列表信息
     */
    @Override
    public Map<String, Object> getStocks(int pageNow, int pageSize, long companyId) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("tableName", " DIC_GOOD g INNER JOIN REC_STOCK s ON g.ID = s.GOODID INNER JOIN DIC_STORAGE e ON e.ID = s.STORAGEID ");
        paramMap.put("fields", "g.ID as goodId,g.MARK,(select name from VIEW_DICTYPE where eng='goodKind' and LEVELCODE=g.GOODKINDCODE) as goodKindName,\n" +
                " g.PRODUCER,g.PRODUCINGAREA,\n" +
                "  SUM(case when s.stockcode=001  then s.INITNUM end) as INITNUM ,\n" +
                "  SUM(case when s.stockcode=001  then s.AFFIRMNUM end)  as AFFIRMNUM,\n" +
                "  SUM(case when s.stockcode=001  then s.AFFIRMNUM end) - nvl(SUM(case when s.stockcode=002  then s.AFFIRMNUM end ),0)\n" +
                "  + nvl(SUM(case when s.stockcode=003  then s.INITNUM end ),0) + nvl(SUM(case when s.stockcode=005  then s.INITNUM end ),0) as SURPLUSNUM,\n" +
                "  SUM(case when s.stockcode=002  then s.AFFIRMNUM end)-nvl(SUM(case when s.stockcode=003  then s.INITNUM end ) ,0)-nvl(SUM(case when s.stockcode=004  then s.INITNUM end ) ,0)  as SELLSURPLUSNUM,\n" +
                "  SUM(case when s.stockcode=004  then s.INITNUM end )  as selloutnum ,e.NAME,(select name from DIC_REGION where id=e.PROVCODE)\n" +
                "   ||(select name from DIC_REGION where id=e.CITYCODE)||\n" +
                "  (select name from DIC_REGION where id=e.COUNTYCODE) || e.ADDRESS as address");
        paramMap.put("pageNow", pageNow);
        paramMap.put("pageSize", pageSize);
        paramMap.put("wherecase", "s.COMPANYID=" + companyId + " GROUP BY g.id,g.createtime,e.id,g.MARK,g.PRODUCER,g.PRODUCINGAREA,g.GOODKINDCODE,e.NAME,e.PROVCODE,e.CITYCODE,e.COUNTYCODE,e.ADDRESS ");
        paramMap.put("orderField", "g.createtime");
        paramMap.put("orderFlag", 1);
        this.baseMapper.getPaging(paramMap);
        return paramMap;
    }

    /**
     * pc商品详情查看仓库详情方法
     */
    @Override
    public Map<String, Object> getStorageDetail(int pageNow, int pageSize, Map argmap) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("tableName", " ( select g.id as goodId,  e.id as storageId,g.mark,\n" +
                "  (select name from VIEW_DICTYPE where eng='goodKind' and LEVELCODE=g.GOODKINDCODE) as goodKindName,\n" +
                "  g.PRODUCER, e.NAME, s.PRICEHASTAX,\n" +
                "  SUM(case when s.stockcode=002  then s.AFFIRMNUM end) over (partition by g.ID,s.PRICEHASTAX,e.id)\n" +
                "  -nvl(SUM(case when s.stockcode=003  then s.INITNUM end ) over (partition by g.ID,s.PRICEHASTAX,e.id),0)\n" +
                "  -nvl(SUM(case when s.stockcode=004  then s.INITNUM end ) over (partition by g.ID,s.PRICEHASTAX,e.id) ,0)   as SELLSURPLUSNUM,\n" +
                "  nvl(SUM(case when s.stockcode=004  then s.INITNUM end ) over (partition by g.ID,s.PRICEHASTAX,e.id) ,0) as selloutnum, s.STOCKCODE,s.COMPANYID\n" +
                "from  DIC_GOOD g INNER JOIN REC_STOCK s ON g.ID = s.GOODID INNER JOIN  DIC_STORAGE e  ON e.ID = S.STORAGEID\n" +
                ") a ");
        paramMap.put("fields", " distinct a.* ");
        paramMap.put("pageNow", pageNow);
        paramMap.put("pageSize", pageSize);
        paramMap.put("wherecase", " a.STOCKCODE='002' and a.GOODID="+argmap.get("goodid")+" and a.storageId="+argmap.get("storageid")+"  and a.COMPANYID="+argmap.get("companyid"));
        paramMap.put("orderField", " a.goodId ");
        paramMap.put("orderFlag", 1);
        this.baseMapper.getPaging(paramMap);
        return paramMap;
    }

    /**
     * pc商品获取库存上架明细方法
     */
    public List getStockDetail(Map argmap) {
        return stockMapper.getStockDetail(argmap);
    }

    /**
     * 获取所有库存类型的公共方法
     */
    @Override
    public List getStockTypes() {
        return baseMapper.getStockTypes();
    }

    /**
     * pc首页PE PP PVC数据展示
     */
    @Override
    public Map<String, Object> getIndexPEPPPVC(Map argmap) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("tableName", "  (select  g.ID as goodId, min(s.id) over (partition by g.ID,s.PRICEHASTAX,e.id,s.companyid)  as stockid , s.companyid,g.MARK,\n" +
                "          (select name from VIEW_DICTYPE where eng='goodKind' and LEVELCODE=g.GOODKINDCODE) as GOODKINDNAME,\n" +
                "          (select name from VIEW_DICTYPE where eng='mea' and LEVELCODE=g.MEACODE) as meaName,g.PRODUCER,g.PRODUCINGAREA,\n" +
                "          SUM(case when s.stockcode=002  then s.AFFIRMNUM end) over (partition by g.ID,s.PRICEHASTAX,e.id,s.companyid)\n" +
                "          -nvl(SUM(case when s.stockcode=003  then s.INITNUM end ) over (partition by g.ID,s.PRICEHASTAX,e.id,s.companyid),0)\n" +
                "          -nvl(SUM(case when s.stockcode=004  then s.INITNUM end ) over (partition by g.ID,s.PRICEHASTAX,e.id,s.companyid) ,0)   as SELLSURPLUSNUM\n" +
                "     ,s.PRICEHASTAX,e.NAME as STORAGENAME,s.STOCKCODE ,g.createtime ,ceil((To_date(to_char(sysdate,'yyyy-mm-dd hh24-mi-ss') , 'yyyy-mm-dd hh24-mi-ss') - To_date(to_char(max(s.createtime) OVER (partition by g.ID,s.PRICEHASTAX,e.id,s.companyid),'yyyy-mm-dd hh24-mi-ss') , 'yyyy-mm-dd hh24-mi-ss')) * 24*60 ) as DIFFERHOURS ,  g.GOODKINDCODE ,c.name as companyname from\n" +
                "     DIC_GOOD g INNER JOIN REC_STOCK s ON g.ID = s.GOODID INNER JOIN DIC_STORAGE e ON e.ID = s.STORAGEID INNER JOIN rec_company c on c.id=s.companyid )  a ");
        paramMap.put("fields", " DISTINCT a.* ,case when a.DIFFERHOURS>=60 and a.DIFFERHOURS<1440 then floor(a.DIFFERHOURS/60)||'小时前' when a.DIFFERHOURS>=1440 then floor(a.DIFFERHOURS/1440) ||'天前' else a.DIFFERHOURS || '分钟前' end  as DIFFERTIME ");
        paramMap.put("pageNow", 1);
        paramMap.put("pageSize", 8);
        paramMap.put("wherecase", " a.STOCKCODE=002 and a.SELLSURPLUSNUM>0 and a.GOODKINDCODE like ''||(select levelcode from VIEW_DICTYPE where NAME=\'" + argmap.get("goodKindName") + "\')||'%' ");
        paramMap.put("orderField", " a.createtime desc,a.stockid ");
        paramMap.put("orderFlag", 1);
        this.baseMapper.getPaging(paramMap);
        return paramMap;
    }

    /**
     * pc首页PE PP PVC数据成交情况展示
     */
    @Override
    public Map<String, Object> getIndexPEPPPVCDeal(Map argmap) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("tableName", " (select g.MARK,s.INITNUM, s.PRICEHASTAX,(select name from VIEW_DICTYPE where eng='mea' and LEVELCODE=g.MEACODE) as MEANAME,o.createtime,\n" +
                "  ROUND(TO_NUMBER(sysdate -s.createtime ) * 24 * 60 ) as DIFFERHOURS\n" +
                "from REC_ORDER o INNER JOIN  REC_ORDER_STOCK os ON o.ID = os.ORDERID\n" +
                "  INNER JOIN  REC_STOCK s ON s.ID = os.STOCKID INNER JOIN  DIC_GOOD g ON g.ID = s.GOODID\n" +
                "WHERE g.GOODKINDCODE like ''||(select levelcode from VIEW_DICTYPE where NAME=\'" + argmap.get("goodKindName") + "\')||'%' ) a ");
        paramMap.put("fields", "  a.*, case when a.DIFFERHOURS>=60 and a.DIFFERHOURS<1440 then floor(a.DIFFERHOURS/60)||'小时' when a.DIFFERHOURS>=1440 then floor(a.DIFFERHOURS/1440) ||'天前' else a.DIFFERHOURS || '分钟' end  as differtime ");
        paramMap.put("pageNow", 1);
        paramMap.put("pageSize", 12);
        paramMap.put("orderField", " a.createtime");
        paramMap.put("orderFlag", 1);
        this.baseMapper.getPaging(paramMap);
        return paramMap;
    }

    /**
     * pc首页PE PP PVC顶部周成交数据情况展示
     */
    @Override
    public Map<String, Object> getIndexTopPEPPPVCDeal() {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("tableName", "  ( select g.MARK,o.createtime,  s.INITNUM,(select name from VIEW_DICTYPE where eng='mea' and LEVELCODE=g.MEACODE) as MEANAME, " +
                " ROUND(TO_NUMBER(sysdate -s.createtime )) as DIFFERHOURS\n" +
                " from REC_ORDER o INNER JOIN  REC_ORDER_STOCK os ON o.ID = os.ORDERID\n" +
                "INNER JOIN  REC_STOCK s ON s.ID = os.STOCKID INNER JOIN  DIC_GOOD g ON g.ID = s.GOODID\n" +
                " ) a ");
        paramMap.put("fields", "  a.*  ");
        paramMap.put("pageNow", 1);
        paramMap.put("pageSize", 6);
        paramMap.put("wherecase", " a.DIFFERHOURS<=7 ");
        paramMap.put("orderField", " a.createtime");
        paramMap.put("orderFlag", 1);
        this.baseMapper.getPaging(paramMap);
        return paramMap;
    }


    /**
     * pc首页新闻数据展示
     */
    @Override
    public Map<String, Object> getIndexNews(Map map) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("tableName", " rec_news n inner join view_dictype v on v.levelcode=n.newscode and eng='news' ");
        paramMap.put("fields", "  n.id,n.title,n.titleimage,v.levelcode,v.name,n.summary,n.createtime,n.updatetime  ");
        paramMap.put("pageNow", map.get("pageNow"));
        paramMap.put("pageSize", map.get("pageSize"));
        paramMap.put("wherecase", " n.statuscode='001' and n.newscode= " + map.get("newscode"));
        paramMap.put("orderField", " n.createtime");
        paramMap.put("orderFlag", 1);
        this.baseMapper.getPaging(paramMap);
        return paramMap;
    }

    /**
     * pc首页新闻数据详情展示
     */
    @Override
    public News getIndexNewsdetails(long newsid) {
        return newsMapper.getIndexNewsdetails(newsid);
    }


    /**
     * pc获取上架信息是否有更新 用于SSE推送数据
     *
     */
    @Override
    public Map getSSEUpdatePutawayStock(){
        return stockMapper.getSSEUpdatePutawayStock();
    }
}