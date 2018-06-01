package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.OrganizationInfo;
import com.service.OrganazitionService;
@Controller
@RequestMapping("/library")
public class OrgnazitionController{
	Map<String,Object> resultMap = new HashMap<>();
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	OrganazitionService os;
	@ResponseBody
	@RequestMapping("/findAllLibrary")	
	public Map<String,Object> findAllLibrary(HttpServletRequest request,Model model){
		log.info("-----------------------组织管理-------------------------");
		List<OrganizationInfo> list = os.findAllLibrary();
		resultMap.put("orgList",list);
		return resultMap;
	}
	
}


