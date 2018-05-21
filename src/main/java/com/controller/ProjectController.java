package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 王小萌
 * @description: <项目管理类>
 */
@Controller
@RequestMapping("/project")
public class ProjectController {
	@RequestMapping("/management")
	public String projectManagement(){
		return "projectManagement";
	}


}
