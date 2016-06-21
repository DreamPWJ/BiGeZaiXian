package com.juhuawang.model;

import java.util.Date;

public class Comment {
    private Long id;

    private Long ordergoodid;

    private String title;

    private String content;

    private String stargoodid;

    private String starsell;

    private String starsend;

    private Long frontuserid;

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

    public Long getOrdergoodid() {
        return ordergoodid;
    }

    public void setOrdergoodid(Long ordergoodid) {
        this.ordergoodid = ordergoodid;
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

    public String getStargoodid() {
        return stargoodid;
    }

    public void setStargoodid(String stargoodid) {
        this.stargoodid = stargoodid == null ? null : stargoodid.trim();
    }

    public String getStarsell() {
        return starsell;
    }

    public void setStarsell(String starsell) {
        this.starsell = starsell == null ? null : starsell.trim();
    }

    public String getStarsend() {
        return starsend;
    }

    public void setStarsend(String starsend) {
        this.starsend = starsend == null ? null : starsend.trim();
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
}