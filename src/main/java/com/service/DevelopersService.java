package com.service;

import java.util.List;

import com.entity.DevelopersInfo;
import com.entity.DevelopersInfoExample;
import com.util.PageUtil;

public interface DevelopersService {
	/**
	 * @author：王小萌
	 * @date: 2018-7-3 下午4:34:48
	 * @param: {}
	 * @return: {}
	 * @description: <获取开发商列表>
	 */
	List<DevelopersInfo> getAllDevelopers(PageUtil page);
	
	/**
	 * @author：王小萌
	 * @date: 2018-7-4 下午1:44:33
	 * @param: {}
	 * @return: {开发商总数}
	 * @description: <获取开发商总数>
	 */
	int countByExample();

}
