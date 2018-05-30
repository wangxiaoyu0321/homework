package com.entity;

import java.util.Date;
/**
 * @author 王小萌
 * @description: <角色信息类>
 */
public class RoleInfo {
    private Integer roleid;	     //角色id

    private String rolename;	 //角色名称

    private String state;		//角色状态：1：使用  9：作废

    private Date createtime;	//创建时间

    private String datescope; 	//数据范围

    private String remark; 		//备注信息

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getDatescope() {
        return datescope;
    }

    public void setDatescope(String datescope) {
        this.datescope = datescope;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}