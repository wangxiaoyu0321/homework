package com.entity;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class UserEntity implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7751308188457032196L;
	public Integer id;
	public String name;
	public String password;
    private String image;  
    private MultipartFile file;
    private Integer roleId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

    
	

}
