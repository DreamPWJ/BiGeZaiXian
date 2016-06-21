package com.juhuawang.model;

public class Authority {
    private Long id;

    private Long version;

    private Short enable;

    private String name;

    private String levelcode;

    private Long position;

    private String thevalue;

    private String url;

    private String matchurl;

    private String itemicon;

    private Long parentid;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getVersion() {
        return version;
    }

    public void setVersion(Long version) {
        this.version = version;
    }

    public Short getEnable() {
        return enable;
    }

    public void setEnable(Short enable) {
        this.enable = enable;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getLevelcode() {
        return levelcode;
    }

    public void setLevelcode(String levelcode) {
        this.levelcode = levelcode == null ? null : levelcode.trim();
    }

    public Long getPosition() {
        return position;
    }

    public void setPosition(Long position) {
        this.position = position;
    }

    public String getThevalue() {
        return thevalue;
    }

    public void setThevalue(String thevalue) {
        this.thevalue = thevalue == null ? null : thevalue.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getMatchurl() {
        return matchurl;
    }

    public void setMatchurl(String matchurl) {
        this.matchurl = matchurl == null ? null : matchurl.trim();
    }

    public String getItemicon() {
        return itemicon;
    }

    public void setItemicon(String itemicon) {
        this.itemicon = itemicon == null ? null : itemicon.trim();
    }

    public Long getParentid() {
        return parentid;
    }

    public void setParentid(Long parentid) {
        this.parentid = parentid;
    }
}