package com.juhuawang.model;

import java.math.BigDecimal;
import java.util.Date;

public class Sell {
    private Long id;

    private Long supid;

    private Long goodid;

    private String codeno;

    private String title;

    private String content;

    private String linkman;

    private String mobphone;

    private String phone;

    private BigDecimal pricebegin;

    private BigDecimal priceper;

    private BigDecimal priceone;

    private BigDecimal pricesucc;

    private BigDecimal num;

    private Long operationid;

    private String operationip;

    private Date begintime;

    private Date endtime;

    private Date succtime;

    private String dealcode;

    private String memo;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getSupid() {
        return supid;
    }

    public void setSupid(Long supid) {
        this.supid = supid;
    }

    public Long getGoodid() {
        return goodid;
    }

    public void setGoodid(Long goodid) {
        this.goodid = goodid;
    }

    public String getCodeno() {
        return codeno;
    }

    public void setCodeno(String codeno) {
        this.codeno = codeno == null ? null : codeno.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getLinkman() {
        return linkman;
    }

    public void setLinkman(String linkman) {
        this.linkman = linkman == null ? null : linkman.trim();
    }

    public String getMobphone() {
        return mobphone;
    }

    public void setMobphone(String mobphone) {
        this.mobphone = mobphone == null ? null : mobphone.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public BigDecimal getPricebegin() {
        return pricebegin;
    }

    public void setPricebegin(BigDecimal pricebegin) {
        this.pricebegin = pricebegin;
    }

    public BigDecimal getPriceper() {
        return priceper;
    }

    public void setPriceper(BigDecimal priceper) {
        this.priceper = priceper;
    }

    public BigDecimal getPriceone() {
        return priceone;
    }

    public void setPriceone(BigDecimal priceone) {
        this.priceone = priceone;
    }

    public BigDecimal getPricesucc() {
        return pricesucc;
    }

    public void setPricesucc(BigDecimal pricesucc) {
        this.pricesucc = pricesucc;
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

    public Date getBegintime() {
        return begintime;
    }

    public void setBegintime(Date begintime) {
        this.begintime = begintime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public Date getSucctime() {
        return succtime;
    }

    public void setSucctime(Date succtime) {
        this.succtime = succtime;
    }

    public String getDealcode() {
        return dealcode;
    }

    public void setDealcode(String dealcode) {
        this.dealcode = dealcode == null ? null : dealcode.trim();
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }
}