package com.entity;

import java.util.List;
public class Role {
	private Integer id;
	private String rolename;
	private List<Permission> permissionList;
	private List<UserEntity> userList;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename; 	
	

}
}
