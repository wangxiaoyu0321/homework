package com.entity;

import java.util.Date;

public class DevelopersInfo {
    private Integer developerid;

    private String developername;

    private Integer state;

    private Date createtime;

    public Integer getDeveloperid() {
        return developerid;
    }

    public void setDeveloperid(Integer developerid) {
        this.developerid = developerid;
    }

    public String getDevelopername() {
        return developername;
    }

    public void setDevelopername(String developername) {
        this.developername = developername;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}