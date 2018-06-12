package com.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.entity.OrganizationInfo;
import com.entity.ProjectInfo;
import com.entity.UserEntity;

public interface ProjectService {
	
	//创建项目
	int createProject(ProjectInfo pi);
	
	//获取签单人
	List<UserEntity> getSigner();
	
	//根据用户名查询组织名称
	OrganizationInfo getOrgNameById(Integer orgId);
}
