package com.juhuawang.model;

import java.math.BigDecimal;
import java.util.Date;

public class GoodApply {
    private Long id;

    private Long frontuserid;

    private Long orderid;

    private String affirmgoodcode;

    private String getgoodcode;

    private String codeno;

    private String carno;

    private String linkman;

    private String mobphone;

    private BigDecimal meanum;

    private BigDecimal milnum;

    private BigDecimal price;

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

    public Long getFrontuserid() {
        return frontuserid;
    }

    public void setFrontuserid(Long frontuserid) {
        this.frontuserid = frontuserid;
    }

    public Long getOrderid() {
        return orderid;
    }

    public void setOrderid(Long orderid) {
        this.orderid = orderid;
    }

    public String getAffirmgoodcode() {
        return affirmgoodcode;
    }

    public void setAffirmgoodcode(String affirmgoodcode) {
        this.affirmgoodcode = affirmgoodcode == null ? null : affirmgoodcode.trim();
    }

    public String getGetgoodcode() {
        return getgoodcode;
    }

    public void setGetgoodcode(String getgoodcode) {
        this.getgoodcode = getgoodcode == null ? null : getgoodcode.trim();
    }

    public String getCodeno() {
        return codeno;
    }

    public void setCodeno(String codeno) {
        this.codeno = codeno == null ? null : codeno.trim();
    }

    public String getCarno() {
        return carno;
    }

    public void setCarno(String carno) {
        this.carno = carno == null ? null : carno.trim();
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

    public BigDecimal getMeanum() {
        return meanum;
    }

    public void setMeanum(BigDecimal meanum) {
        this.meanum = meanum;
    }

    public BigDecimal getMilnum() {
        return milnum;
    }

    public void setMilnum(BigDecimal milnum) {
        this.milnum = milnum;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
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