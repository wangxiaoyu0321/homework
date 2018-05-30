package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.RoleInfoMapper;
import com.entity.RoleInfo;
import com.service.RoleService;
import com.util.PageUtil;

@Service("RoleService")
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	RoleInfoMapper rm;
	@Override
	public List<RoleInfo> getAllRole(@SuppressWarnings("rawtypes") PageUtil pageUtil) {	
		return rm.getAllRole(pageUtil);
	}

}
