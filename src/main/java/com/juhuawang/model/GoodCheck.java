package com.juhuawang.model;

import java.util.Date;

public class GoodCheck {
    private Long id;

    private Long goodApplyId;

    private String affirmstatuscode;

    private Long backuserid;

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

    public Long getGoodApplyId() {
        return goodApplyId;
    }

    public void setGoodApplyId(Long goodApplyId) {
        this.goodApplyId = goodApplyId;
    }

    public String getAffirmstatuscode() {
        return affirmstatuscode;
    }

    public void setAffirmstatuscode(String affirmstatuscode) {
        this.affirmstatuscode = affirmstatuscode == null ? null : affirmstatuscode.trim();
    }

    public Long getBackuserid() {
        return backuserid;
    }

    public void setBackuserid(Long backuserid) {
        this.backuserid = backuserid;
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