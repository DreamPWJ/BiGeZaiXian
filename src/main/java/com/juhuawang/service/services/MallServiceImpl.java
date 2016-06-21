package com.juhuawang.service.services;

import com.juhuawang.dao.interfaces.BaseMapper;
import com.juhuawang.dao.interfaces.FindGoodMapper;
import com.juhuawang.model.FindGood;
import com.juhuawang.model.searchmodel.SearchMall;
import com.juhuawang.service.interfaces.IMallService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created  by pwj  on 2015/8/4 0004.
 */
@Service
public class MallServiceImpl implements IMallService {

    @Resource
    BaseMapper baseMapper;

    @Resource
    FindGoodMapper findGoodMapper;
    /**
     * 获取聚化商城信息
     *
     * @return
     */
    @Override
    public Map<String, Object> getMallList(int pageNow, int pageSize,SearchMall searchMall) {
        //搜索条件动态追加
        StringBuilder searchWhere=new StringBuilder("");
        //首页左侧边栏搜索
        if(searchMall.getGoodKindName()!=null&&(searchMall.getMark()==null||"".equals(searchMall.getMark()))&&(searchMall.getProducer()==null||"".equals(searchMall.getProducer()))){
            searchWhere.append(" AND a.GOODKINDCODE like ''|| nvl((select levelcode from VIEW_DICTYPE where NAME=\'"+searchMall.getGoodKindName()+"\' and rownum<=1),' ')||'%' ");
        }
        //主页全局搜索
        if((searchMall.getGoodKindName()!=null&&!"".equals(searchMall.getGoodKindName()))&&(searchMall.getMark()!=null && !"".equals(searchMall.getMark()))&&(searchMall.getProducer()!=null&&!"".equals(searchMall.getProducer()))){
            searchWhere.append(" AND ( a.GOODKINDCODE like ''|| nvl((select levelcode from VIEW_DICTYPE where NAME=\'"+searchMall.getGoodKindName()+"\' and rownum<=1),' ')||'%'  OR a.mark like \'%"+searchMall.getMark()+"%\'  OR a.PRODUCER like \'%"+searchMall.getProducer()+"%\')");
        }
        //聚化商城搜索
        if(searchMall.getGoodKindName()!=null||searchMall.getMark()!=null||searchMall.getProducer()!=null){
            searchWhere.append(" AND ( a.GOODKINDCODE like ''|| nvl((select levelcode from VIEW_DICTYPE where NAME=\'"+searchMall.getGoodKindName()+"\' and rownum<=1),' ')||'%'  OR a.mark like \'%"+("".equals(searchMall.getMark())?"  ":searchMall.getMark())+"%\'  OR a.PRODUCER like \'%"+("".equals(searchMall.getProducer())?" ":searchMall.getProducer())+"%\')");
        }
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("tableName", " ( select g.ID as goodId,min(s.id) over (partition by g.ID,s.PRICEHASTAX,e.id,s.companyid)  as stockid ,s.companyid,g.MARK, g.GOODKINDCODE ,\n" +
                " (select name from VIEW_DICTYPE where eng='goodKind' and LEVELCODE=g.GOODKINDCODE) as goodKindName,\n" +
                "(select name from VIEW_DICTYPE where eng='mea' and LEVELCODE=g.MEACODE) as meaName,g.PRODUCER,g.PRODUCINGAREA,\n" +
                "SUM(case when s.stockcode=002  then s.AFFIRMNUM end) over (partition by g.ID,s.PRICEHASTAX,e.id,s.companyid)\n" +
                "-nvl(SUM(case when s.stockcode=003  then s.INITNUM end ) over (partition by g.ID,s.PRICEHASTAX,e.id,s.companyid),0)\n" +
                "-nvl(SUM(case when s.stockcode=004  then s.INITNUM end ) over (partition by g.ID,s.PRICEHASTAX,e.id,s.companyid) ,0)   as SELLSURPLUSNUM\n" +
                ",s.PRICEHASTAX,e.NAME as STORAGENAME,s.STOCKCODE ,g.createtime,c.name as companyname  from\n" +
                "DIC_GOOD g INNER JOIN REC_STOCK s ON g.ID = s.GOODID INNER JOIN DIC_STORAGE e ON e.ID = s.STORAGEID INNER JOIN rec_company c on c.id=s.companyid ) a ");
        paramMap.put("fields", " DISTINCT a.*  ");
        paramMap.put("pageNow", pageNow);
        paramMap.put("pageSize", pageSize);
        paramMap.put("wherecase", " a.STOCKCODE=002 and a.SELLSURPLUSNUM>0 "+searchWhere);
        paramMap.put("orderField", " a.createtime desc,a.stockid ");
        paramMap.put("orderFlag", 1);
        this.baseMapper.getPaging(paramMap);
        return paramMap;
    }

    /**
     *帮你找货数据保存存储
     */
    @Override
    public void saveFindGood(FindGood findGood){
      findGoodMapper.insertSelective(findGood);
    }
}
