package com.juhuawang.model;

import java.util.Date;

public class RecOrder {
    private Long id;

    private String orderno;

    private Long guestid;

    private String orderstatuscode;

    private Long collectionid;

    private String paycode;

    private Long operationid;

    private String operationip;

    private Date createtime;

    private String srccode;

    private String memo;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOrderno() {
        return orderno;
    }

    public void setOrderno(String orderno) {
        this.orderno = orderno == null ? null : orderno.trim();
    }

    public Long getGuestid() {
        return guestid;
    }

    public void setGuestid(Long guestid) {
        this.guestid = guestid;
    }

    public String getOrderstatuscode() {
        return orderstatuscode;
    }

    public void setOrderstatuscode(String orderstatuscode) {
        this.orderstatuscode = orderstatuscode == null ? null : orderstatuscode.trim();
    }

    public Long getCollectionid() {
        return collectionid;
    }

    public void setCollectionid(Long collectionid) {
        this.collectionid = collectionid;
    }

    public String getPaycode() {
        return paycode;
    }

    public void setPaycode(String paycode) {
        this.paycode = paycode == null ? null : paycode.trim();
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

    public String getSrccode() {
        return srccode;
    }

    public void setSrccode(String srccode) {
        this.srccode = srccode == null ? null : srccode.trim();
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

}