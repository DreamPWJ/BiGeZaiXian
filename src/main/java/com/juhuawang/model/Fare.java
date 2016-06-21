package com.juhuawang.model;

import java.math.BigDecimal;
import java.util.Date;

public class Fare {
    private Long id;

    private String goodkindcode;

    private String codeno;

    private String name;

    private String meacode;

    private BigDecimal fareper;

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

    public String getGoodkindcode() {
        return goodkindcode;
    }

    public void setGoodkindcode(String goodkindcode) {
        this.goodkindcode = goodkindcode == null ? null : goodkindcode.trim();
    }

    public String getCodeno() {
        return codeno;
    }

    public void setCodeno(String codeno) {
        this.codeno = codeno == null ? null : codeno.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getMeacode() {
        return meacode;
    }

    public void setMeacode(String meacode) {
        this.meacode = meacode == null ? null : meacode.trim();
    }

    public BigDecimal getFareper() {
        return fareper;
    }

    public void setFareper(BigDecimal fareper) {
        this.fareper = fareper;
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