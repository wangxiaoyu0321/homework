package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/system")
public class SystemManagementController {
	
	@RequestMapping("/SystemManagement")
	public String UserManagement(){
		return "SystemManagement";		
	}
	
	@RequestMapping("/user")
	public String toPlan(){
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

}
