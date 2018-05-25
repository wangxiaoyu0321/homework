package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.UserEntity;
import com.service.UserService;
import com.util.PageUtil;

@Controller
@RequestMapping("/system")
public class SystemManagementController {
	
	Map<String,Object> resultMap  =  new HashMap<String,Object>();
	
	Logger log = Logger.getLogger(this.getClass());
	int pageSize=10;
	
	@Autowired
	UserService us;
	@RequestMapping("/SystemManagement")
	public String UserManagement(){
		return "SystemManagement";		
	}
	/**
	 * @author：王小萌
	 * @date: 2018-5-22 下午2:45:05
	 * @param: {}
	 * @return: {}
	 * @description: <系统管理——用户管理>
	 */
	@RequestMapping("/user")
	public String toUser(PageUtil pageUtil,Model model,HttpServletRequest request){
		log.info("----------------------获取user集合------------------");
		pageUtil.setPageSize(pageSize);
		//员工总数
		pageUtil = new PageUtil();
		int userNum = us.getUserNum();
		int currentPage = pageUtil.getCurrentPage();
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}		
		log.info("--------------------当前页"+request.getParameter("currentPage")+"-----------------------------");
		pageUtil.setCurrentPage(currentPage);
		int startIndex = getStartIndexByCurrentPage(currentPage);
		pageUtil.setStartIndex(startIndex);
		List<UserEntity> lists = null;
		lists = us.getAllUser(pageUtil);
		PageUtil pageUtil1 = new PageUtil();
		pageUtil1.setCurrentPage(currentPage);
		pageUtil1.setStartIndex(startIndex);
		pageUtil1.setList(lists);
		pageUtil1.setTotalRecord(userNum);
		int totalPage = userNum % pageSize == 0 ? userNum/pageSize : userNum/pageSize +1;
		pageUtil1.setTotalPage(totalPage);
		pageUtil1.setPageSize(pageSize);
		log.info("-----------------------"+lists+"----------------------------");
		model.addAttribute("pageUtil",pageUtil1);
		return "usermanagement";
	}
	
	
	@RequestMapping("/role")
	public String toRole(){
		return "rolemanagement";
	}
	
	@RequestMapping("/organization")
	public String toOrganization(){
		
		return "organizationmanagement";
	}
	
	@RequestMapping("/permission")
	public String toPermission(){
		return "permissionmanagement";
	}
	//根据当前页获取起始下标
	public int getStartIndexByCurrentPage(int currentPage){
		int startIndex = 0;
		if(currentPage==1){
			return startIndex=0;
		}
		startIndex = (currentPage -1) * pageSize;
		return startIndex;
	}
}
