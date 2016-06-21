package com.juhuawang.model;

import java.util.Date;

public class Company {
    private Long id;

    private String guestcode;

    private String unitno;

    private String name;

    private String linkman;

    private String phone;

    private String mobphone;

    private String email;

    private String address;

    private String companytypecode;

    private String affirmregcode;

    private Long backuserid;

    private Long agentid;

    private String taxno;

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

    public String getGuestcode() {
        return guestcode;
    }

    public void setGuestcode(String guestcode) {
        this.guestcode = guestcode == null ? null : guestcode.trim();
    }

    public String getUnitno() {
        return unitno;
    }

    public void setUnitno(String unitno) {
        this.unitno = unitno == null ? null : unitno.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getLinkman() {
        return linkman;
    }

    public void setLinkman(String linkman) {
        this.linkman = linkman == null ? null : linkman.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getMobphone() {
        return mobphone;
    }

    public void setMobphone(String mobphone) {
        this.mobphone = mobphone == null ? null : mobphone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getCompanytypecode() {
        return companytypecode;
    }

    public void setCompanytypecode(String companytypecode) {
        this.companytypecode = companytypecode == null ? null : companytypecode.trim();
    }

    public String getAffirmregcode() {
        return affirmregcode;
    }

    public void setAffirmregcode(String affirmregcode) {
        this.affirmregcode = affirmregcode == null ? null : affirmregcode.trim();
    }

    public Long getBackuserid() {
        return backuserid;
    }

    public void setBackuserid(Long backuserid) {
        this.backuserid = backuserid;
    }

    public Long getAgentid() {
        return agentid;
    }

    public void setAgentid(Long agentid) {
        this.agentid = agentid;
    }

    public String getTaxno() {
        return taxno;
    }

    public void setTaxno(String taxno) {
        this.taxno = taxno == null ? null : taxno.trim();
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