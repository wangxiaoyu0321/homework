/**
 * 
 */
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
import org.springframework.web.servlet.ModelAndView;

import com.entity.Todo;
import com.service.TodoService;
import com.util.PageUtil;

/**
 * @description：待办事项
 */
@Controller
@RequestMapping("/todo")
public class TodoController {
	Map<String,Object> resultMap = new HashMap<>();
	Logger log = Logger.getLogger(this.getClass());
	int pageSize =10;
	@Autowired
	TodoService ts;
	
	@RequestMapping("/getAllBacklog")
	public String getAllBacklog(HttpServletRequest request,PageUtil page,Model model){
		log.info("enter getAllBacklog()");
		List<Todo> list = ts.getAllBacklog(page);
//		ModelAndView m_oMa = new ModelAndView();
		model.addAttribute("tolist", list);
		log.info(list);
		return "todo";
		
	}
}
