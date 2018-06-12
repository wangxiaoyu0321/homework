package com.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.ProjectInfo;
import com.entity.UserEntity;
import com.service.ProjectService;

//项目类
@Controller
@RequestMapping("/project")
public class ProjectController {
	
	Logger log = Logger.getLogger(this.getClass());
	Map<String,Object> resultMap = new HashMap();
	@Autowired
	ProjectService ps;
	@RequestMapping("/createProject")
	public String toCreateProject(Model model){
		List<UserEntity> signer = ps.getSigner();
		log.info("------------------------"+signer+"-------------------------");
		model.addAttribute("signer",signer);
		return "project/createproject";

	}
	@ResponseBody
	@RequestMapping("/create")
	public Map<String,Object> toCreate(HttpServletRequest request,Model model){
		log.info("-------------------------开始创建项目---------------------------------");
		String ProjectName = request.getParameter("name");	//项目名
		String money = request.getParameter("money");		//项目金额
		BigDecimal bd = new BigDecimal(money);				
		String developer = request.getParameter("developer");//开发商
		Integer area = Integer.parseInt(request.getParameter("area"));
		String province = request.getParameter("province");	//项目所在省
		String city = request.getParameter("city");			//项目所在市
		String district = request.getParameter("district"); //项目所在区
		String remark = request.getParameter("remark");
		String productType=request.getParameter("product");
		ProjectInfo pi = new ProjectInfo();
		pi.setArea(area);
		pi.setDeveloper(developer);
		pi.setProname(ProjectName);
		pi.setQuoteprice(bd);
		pi.setProvince(province);
		pi.setCity(city);
		pi.setDistrict(district);
		pi.setRemark(remark);
		pi.setProducttype(productType);
		log.info(pi);
		int result = ps.createProject(pi);
		try{			
			if(result>0){			
				resultMap.put("operFlag",1000);
			} else {
				resultMap.put("operFlag", 1001);
				resultMap.put("errorMessage", "项目创建失败");
			}
		} catch (Exception e) {
			resultMap.put("operFlag", 1001);
			resultMap.put("errorMessage", "项目创建异常");
		}
		
		return resultMap;
	}
	@RequestMapping("/demo")
	public String toDemo(){
		return "demo";
		
	}

}
