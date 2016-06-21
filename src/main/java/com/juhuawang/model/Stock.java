package com.juhuawang.model;

import java.math.BigDecimal;
import java.util.Date;

public class Stock {
    private Long id;

    private Long goodid;

    private Long companyid;

    private Long storageid;

    private Long frontuserid;

    private String affirmstockcode;

    private String codeno;

    private BigDecimal initnum;

    private BigDecimal affirmnum;

    private String stockcode;

    private BigDecimal pricenotax;

    private BigDecimal pricehastax;

    private BigDecimal amountnotax;

    private BigDecimal taxmoney;

    private BigDecimal finalmoney;

    private Long stockuserid;

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

    public Long getGoodid() {
        return goodid;
    }

    public void setGoodid(Long goodid) {
        this.goodid = goodid;
    }

    public Long getCompanyid() {
        return companyid;
    }

    public void setCompanyid(Long companyid) {
        this.companyid = companyid;
    }

    public Long getStorageid() {
        return storageid;
    }

    public void setStorageid(Long storageid) {
        this.storageid = storageid;
    }

    public Long getFrontuserid() {
        return frontuserid;
    }

    public void setFrontuserid(Long frontuserid) {
        this.frontuserid = frontuserid;
    }

    public String getAffirmstockcode() {
        return affirmstockcode;
    }

    public void setAffirmstockcode(String affirmstockcode) {
        this.affirmstockcode = affirmstockcode == null ? null : affirmstockcode.trim();
    }

    public String getCodeno() {
        return codeno;
    }

    public void setCodeno(String codeno) {
        this.codeno = codeno == null ? null : codeno.trim();
    }

    public BigDecimal getInitnum() {
        return initnum;
    }

    public void setInitnum(BigDecimal initnum) {
        this.initnum = initnum;
    }

    public BigDecimal getAffirmnum() {
        return affirmnum;
    }

    public void setAffirmnum(BigDecimal affirmnum) {
        this.affirmnum = affirmnum;
    }

    public String getStockcode() {
        return stockcode;
    }

    public void setStockcode(String stockcode) {
        this.stockcode = stockcode == null ? null : stockcode.trim();
    }

    public BigDecimal getPricenotax() {
        return pricenotax;
    }

    public void setPricenotax(BigDecimal pricenotax) {
        this.pricenotax = pricenotax;
    }

    public BigDecimal getPricehastax() {
        return pricehastax;
    }

    public void setPricehastax(BigDecimal pricehastax) {
        this.pricehastax = pricehastax;
    }

    public BigDecimal getAmountnotax() {
        return amountnotax;
    }

    public void setAmountnotax(BigDecimal amountnotax) {
        this.amountnotax = amountnotax;
    }

    public BigDecimal getTaxmoney() {
        return taxmoney;
    }

    public void setTaxmoney(BigDecimal taxmoney) {
        this.taxmoney = taxmoney;
    }

    public BigDecimal getFinalmoney() {
        return finalmoney;
    }

    public void setFinalmoney(BigDecimal finalmoney) {
        this.finalmoney = finalmoney;
    }

    public Long getStockuserid() {
        return stockuserid;
    }

    public void setStockuserid(Long stockuserid) {
        this.stockuserid = stockuserid;
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