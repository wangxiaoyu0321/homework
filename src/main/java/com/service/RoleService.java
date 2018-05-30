package com.service;

import java.util.List;

import com.entity.RoleInfo;
import com.util.PageUtil;

public interface RoleService {
	
	public List<RoleInfo>getAllRole(PageUtil pageUtil);

}
