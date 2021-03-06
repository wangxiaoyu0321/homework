package com.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.OrganizationInfoMapper;
import com.dao.ProjectInfoMapper;
import com.dao.UserDao;
import com.entity.OrganizationInfo;
import com.entity.ProjectInfo;
import com.entity.UserEntity;
import com.service.ProjectService;
import com.util.PageUtil;
@Service("ProjectService")
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	ProjectInfoMapper pm;
	@Autowired
	UserDao userDao;
	@Autowired
	OrganizationInfoMapper om;
	
	@Override
	public int createProject(ProjectInfo pi) {
		return pm.createProject(pi);
	}

	@Override
	public List<UserEntity> getSigner() {
		return userDao.getSigner();
	}

	//根据用户名查询组织名称
	public OrganizationInfo getOrgNameById(Integer orgId) {
		return om.getOrgNameById(orgId);
	}
	
	//获取项目列表
	public List<ProjectInfo> getProjectList(PageUtil page,UserEntity ue) {		
		return pm.getProjectList(page,ue);
	}

	//获取项目总数
	public Integer getProjectCount(Integer orgId) {
		return pm.getProjectCount(orgId);
	}

}
