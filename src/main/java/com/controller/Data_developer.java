package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.DevelopersInfo;
import com.entity.DevelopersInfoExample;
import com.service.DevelopersService;
import com.util.PageUtil;

@Controller
@RequestMapping("/data")
public class Data_developer {
	@Autowired
	DevelopersService ds;
	Logger log = Logger.getLogger(this.getClass());
	Map<String, Integer> resultMap = new HashMap<String,Integer>();
	int pageSize = 10;
	@RequestMapping("/developerMaintenance")
	public String toDeveloper(Model model,PageUtil page){
		page.setPageSize(pageSize);
		int totalRecord = ds.countByExample(); 
		log.info(totalRecord);
		page.setTotalRecord(totalRecord);
		int totalPage = totalRecord%10 == 0 ? totalRecord%10 : totalRecord%10+1;
		int currentPage = page.getCurrentPage();
		page.setCurrentPage(currentPage);
		page.setStartIndex(getStartIndexByCurrentPage(currentPage));
		log.info("currentPage:---------------------"+currentPage);
		Map<String, Integer> map = getStartByCurrentPage(currentPage, totalPage);
		Integer start =  map.get("start");
		page.setStart(start);
		Integer end =  map.get("end");
		page.setEnd(end);
		log.info("--------------"+start);
		page.setTotalPage(totalPage);
		List<DevelopersInfo> developers = ds.getAllDevelopers(page);
		model.addAttribute("developers",developers);
		model.addAttribute("page",page);
		log.info(developers);
		return "data/developer";
	}
	
	/**
	 * @author：王小萌
	 * @date: 2018-7-4 下午2:27:12
	 * @param: {currentPage：当前页}
	 * @return: {startIndex：起始下标}
	 * @description: <根据当前页获取起始下标>
	 */
	public int getStartIndexByCurrentPage(int currentPage){
		int startIndex = 0;
		if(currentPage==1){
			return startIndex=0;
		}
		startIndex = (currentPage -1) * pageSize;
		return startIndex;
	}
	public Map<String, Integer> getStartByCurrentPage(int currentPage,int totalPage){
		int start = 1;
		int end = 5;
		if(totalPage < 5){
			start = 1;
			end = totalPage;
		} else {
			start = currentPage - 2;
			end = currentPage + 2;
			if(start<1){
				start = 1;
				end = 5;
			} 
			if(end > totalPage){
				end = totalPage;
				start = totalPage-4;
			}
		}
		resultMap.put("start", start);
		resultMap.put("end", end);
		return resultMap;
	}
}
