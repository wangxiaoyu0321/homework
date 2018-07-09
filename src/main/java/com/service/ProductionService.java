package com.service;

import java.util.List;

import com.entity.ProductionInfo;

//制作内容
public interface ProductionService {
	//根据产品类型获取制作内容
	List<ProductionInfo> getProduction(Integer productType);
}
