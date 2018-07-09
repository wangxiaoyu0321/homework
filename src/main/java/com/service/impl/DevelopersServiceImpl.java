package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.DevelopersInfoMapper;
import com.entity.DevelopersInfo;
import com.entity.DevelopersInfoExample;
import com.service.DevelopersService;
import com.util.PageUtil;
@Service("DevelopersService")
public class DevelopersServiceImpl implements DevelopersService {
	
	@Autowired
	DevelopersInfoMapper dm;
	
	@Override
	//获取开发商列表
	public List<DevelopersInfo> getAllDevelopers(PageUtil page) {
		return dm.getAllDevelopers(page);
	}

	@Override
	public int countByExample() {
		return dm.countByExample();
	}

}
