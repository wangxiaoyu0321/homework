package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.OrganizationInfoMapper;
import com.entity.OrganizationInfo;
import com.service.OrganazitionService;
@Service
public class OrganizationImpl implements OrganazitionService {
	@Autowired
	OrganizationInfoMapper om;
	
	@Override
	public List<OrganizationInfo> findAllLibrary() {
		return om.findAllLibrary();
	}

}
