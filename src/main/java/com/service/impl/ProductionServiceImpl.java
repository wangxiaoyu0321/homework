package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ProductionInfoMapper;
import com.dao.ProjectInfoMapper;
import com.entity.ProductionInfo;
import com.service.ProductionService;
@Service("ProductionService")
public class ProductionServiceImpl implements ProductionService {

	@Autowired
	ProductionInfoMapper pim;
	
	/**
	 * 根据产品类型获取对应的制作内容
	 */
	@Override
	public List<ProductionInfo> getProduction(Integer productType) {
		return pim.getProduction(productType);
	}

}
