package com.juhuawang.model.searchmodel;

/**
 * Created by pwj  on 2015/10/28 0028.
 * 自定义聚化商城搜索model 用于接受封装各种查询条件  方便添加
 */
public class SearchMall {
    private  String mark;//牌号
    private  String goodKindName;//品种
    private  String producer;//厂商

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark.trim();
    }

    public String getGoodKindName() {
        return goodKindName;
    }

    public void setGoodKindName(String goodKindName) {
        this.goodKindName = goodKindName.trim();
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer.trim();
    }
}
