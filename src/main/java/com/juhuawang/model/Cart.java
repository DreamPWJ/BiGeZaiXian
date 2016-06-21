package com.juhuawang.model;

import java.math.BigDecimal;
import java.util.Date;

public class Cart {
    private Long id;

    private String codeno;

    private Long frontuserid;

    private String operationip;

    private Date createtime;

    private String statuscode;

    private String memo;

    private Long stockid;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCodeno() {
        return codeno;
    }

    public void setCodeno(String codeno) {
        this.codeno = codeno == null ? null : codeno.trim();
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

    public Long getStockid() {
        return stockid;
    }

    public void setStockid(Long stockid) {
        this.stockid = stockid;
    }
}