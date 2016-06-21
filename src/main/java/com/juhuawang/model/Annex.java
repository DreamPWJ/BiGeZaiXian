package com.juhuawang.model;

import java.util.Date;

public class Annex {
    private Long id;

    private Long guestid;

    private String annexcode;

    private String charterurl;

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

    public Long getGuestid() {
        return guestid;
    }

    public void setGuestid(Long guestid) {
        this.guestid = guestid;
    }

    public String getAnnexcode() {
        return annexcode;
    }

    public void setAnnexcode(String annexcode) {
        this.annexcode = annexcode == null ? null : annexcode.trim();
    }

    public String getCharterurl() {
        return charterurl;
    }

    public void setCharterurl(String charterurl) {
        this.charterurl = charterurl == null ? null : charterurl.trim();
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