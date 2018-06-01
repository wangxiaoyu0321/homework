package com.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ProjectInfoMapper;
import com.entity.ProjectInfo;
import com.service.ProjectService;
@Service("ProjectService")
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	ProjectInfoMapper pm;
	
	@Override
	public int createProject(ProjectInfo pi) {
		return pm.createProject(pi);
	}
}
