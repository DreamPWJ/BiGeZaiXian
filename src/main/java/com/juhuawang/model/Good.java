package com.juhuawang.model;

import java.math.BigDecimal;
import java.util.Date;

public class Good {
    private Long id;

    private String mark;

    private String goodkindcode;

    private String usecode;

    private String maccode;

    private String goodtypecode;

    private BigDecimal rate;

    private String producingarea;

    private String producer;

    private String packtypecode;

    private String packcontent;

    private String packagecode;

    private String meacode;

    private BigDecimal convertnum;

    private Long frontuserid;

    private String operationip;

    private String statuscode;

    private Date createtime;

    private String memo;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark == null ? null : mark.trim();
    }

    public String getGoodkindcode() {
        return goodkindcode;
    }

    public void setGoodkindcode(String goodkindcode) {
        this.goodkindcode = goodkindcode == null ? null : goodkindcode.trim();
    }

    public String getUsecode() {
        return usecode;
    }

    public void setUsecode(String usecode) {
        this.usecode = usecode == null ? null : usecode.trim();
    }

    public String getMaccode() {
        return maccode;
    }

    public void setMaccode(String maccode) {
        this.maccode = maccode == null ? null : maccode.trim();
    }

    public String getGoodtypecode() {
        return goodtypecode;
    }

    public void setGoodtypecode(String goodtypecode) {
        this.goodtypecode = goodtypecode == null ? null : goodtypecode.trim();
    }

    public BigDecimal getRate() {
        return rate;
    }

    public void setRate(BigDecimal rate) {
        this.rate = rate;
    }

    public String getProducingarea() {
        return producingarea;
    }

    public void setProducingarea(String producingarea) {
        this.producingarea = producingarea == null ? null : producingarea.trim();
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer == null ? null : producer.trim();
    }

    public String getPacktypecode() {
        return packtypecode;
    }

    public void setPacktypecode(String packtypecode) {
        this.packtypecode = packtypecode == null ? null : packtypecode.trim();
    }

    public String getPackcontent() {
        return packcontent;
    }

    public void setPackcontent(String packcontent) {
        this.packcontent = packcontent == null ? null : packcontent.trim();
    }

    public String getPackagecode() {
        return packagecode;
    }

    public void setPackagecode(String packagecode) {
        this.packagecode = packagecode == null ? null : packagecode.trim();
    }

    public String getMeacode() {
        return meacode;
    }

    public void setMeacode(String meacode) {
        this.meacode = meacode == null ? null : meacode.trim();
    }

    public BigDecimal getConvertnum() {
        return convertnum;
    }

    public void setConvertnum(BigDecimal convertnum) {
        this.convertnum = convertnum;
    }

    public Long getFrontuserid() {
        return frontuserid;
    }

    public void setFrontuserid(Long frontuserid) {
        this.frontuserid = frontuserid;
    }

    public String getOperationip() {
        return operationip;
    }

    public void setOperationip(String operationip) {
        this.operationip = operationip == null ? null : operationip.trim();
    }

    public String getStatuscode() {
        return statuscode;
    }

    public void setStatuscode(String statuscode) {
        this.statuscode = statuscode == null ? null : statuscode.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }
}