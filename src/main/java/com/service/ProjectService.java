package com.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.entity.OrganizationInfo;
import com.entity.ProjectInfo;
import com.entity.UserEntity;
import com.util.PageUtil;

public interface ProjectService {
	
	//创建项目
	int createProject(ProjectInfo pi);
	
	//获取签单人
	List<UserEntity> getSigner();
	
	//根据用户名查询组织名称
	OrganizationInfo getOrgNameById(Integer orgId);
	
	//获取项目列表
	List<ProjectInfo> getProjectList(PageUtil page,UserEntity ue);
	
	/**
     * @author：王小萌
     * @date: 2018-6-28 下午2:05:34
     * @param: {orgId:组织id}
     * @return: {项目数量}
     * @description: <获取项目数量>
     */
	Integer getProjectCount(Integer orgId);
}
