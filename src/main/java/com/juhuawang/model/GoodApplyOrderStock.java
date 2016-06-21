package com.juhuawang.model;

import java.math.BigDecimal;
import java.util.Date;

public class GoodApplyOrderStock {
    private Long id;

    private Long goodapplyid;

    private Long orderstockid;

    private Long stockid;

    private Long addressid;

    private BigDecimal pricekeep;

    private BigDecimal priceload;

    private Long fareid;

    private BigDecimal fare;

    private String pickcode;

    private BigDecimal num;

    private Long operationid;

    private String operationip;

    private Date createtime;

    private String statuscode;

    private String memo;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getGoodapplyid() {
        return goodapplyid;
    }

    public void setGoodapplyid(Long goodapplyid) {
        this.goodapplyid = goodapplyid;
    }

    public Long getOrderstockid() {
        return orderstockid;
    }

    public void setOrderstockid(Long orderstockid) {
        this.orderstockid = orderstockid;
    }

    public Long getStockid() {
        return stockid;
    }

    public void setStockid(Long stockid) {
        this.stockid = stockid;
    }

    public Long getAddressid() {
        return addressid;
    }

    public void setAddressid(Long addressid) {
        this.addressid = addressid;
    }

    public BigDecimal getPricekeep() {
        return pricekeep;
    }

    public void setPricekeep(BigDecimal pricekeep) {
        this.pricekeep = pricekeep;
    }

    public BigDecimal getPriceload() {
        return priceload;
    }

    public void setPriceload(BigDecimal priceload) {
        this.priceload = priceload;
    }

    public Long getFareid() {
        return fareid;
    }

    public void setFareid(Long fareid) {
        this.fareid = fareid;
    }

    public BigDecimal getFare() {
        return fare;
    }

    public void setFare(BigDecimal fare) {
        this.fare = fare;
    }

    public String getPickcode() {
        return pickcode;
    }

    public void setPickcode(String pickcode) {
        this.pickcode = pickcode == null ? null : pickcode.trim();
    }

    public BigDecimal getNum() {
        return num;
    }

    public void setNum(BigDecimal num) {
        this.num = num;
    }

    public Long getOperationid() {
        return operationid;
    }

    public void setOperationid(Long operationid) {
        this.operationid = operationid;
    }

    public String getOperationip() {
        return operationip;
    }

    public void setOperationip(String operationip) {
        this.operationip = operationip == null ? null : operationip.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getStatuscode() {
        return statuscode;
    }

    public void setStatuscode(String statuscode) {
        this.statuscode = statuscode == null ? null : statuscode.trim();
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }
}