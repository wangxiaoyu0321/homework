package com.entity;

public class Permission {
	private Integer id;
	private String permissonname;
	private Role role;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPermissonname() {
		return permissonname;
	}
	public void setPermissonname(String permissonname) {
		this.permissonname = permissonname;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	
}
