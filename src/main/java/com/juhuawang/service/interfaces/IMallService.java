package com.juhuawang.service.interfaces;

import com.juhuawang.model.FindGood;
import com.juhuawang.model.searchmodel.SearchMall;

import java.util.Map;

/**
 * Created by pwj  on 2015/8/4 0004.
 * 聚化商城service接口
 */
public interface IMallService {

    /**
     * 获取聚化商城信息
     *
     * @return
     */
    Map<String, Object> getMallList(int pageNow, int pageSize,SearchMall searchMall);

    /**
     *帮你找货数据保存存储
     */
    void saveFindGood(FindGood findGood);
}
