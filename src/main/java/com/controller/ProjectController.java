package com.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.ProductionInfo;
import com.entity.ProjectInfo;
import com.entity.UserEntity;
import com.mysql.jdbc.StringUtils;
import com.service.ProductionService;
import com.service.ProjectService;
import com.util.PageUtil;

//项目类
@Controller
@RequestMapping("/project")
public class ProjectController {
	
	int pageSize = 10;
	Logger log = Logger.getLogger(this.getClass());
	Map<String,Object> resultMap = new HashMap();
	@Autowired
	ProjectService ps;
	@Autowired
	ProductionService prods;
	@RequestMapping("/createProject")
	public String toCreateProject(Model model){
		List<UserEntity> signer = ps.getSigner();
		log.info("------------------------"+signer+"-------------------------");
		model.addAttribute("signer",signer);
		model.addAttribute("flag",0);
		return "project/createproject";

	}
	
	//创建项目
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
	
	//获取产品类型
	@RequestMapping("/getProductType")
	public String toGetProductType(HttpServletRequest request,Model model){
		String productType=request.getParameter("product");
		log.info(productType);
		request.setAttribute("productType", productType);
		request.getSession().setAttribute("productType", productType);
		model.addAttribute("productType",productType);
		model.addAttribute("flag",1);
		return "project/createproject";		
	}
	
	//获取产品类型对应的制作内容
	@ResponseBody
	@RequestMapping("/getProduction")
	public Map<String,Object> toGetProduction(HttpServletRequest request,Model model,HttpSession session){
		String productType =request.getParameter("productType");
		String a1 = String.valueOf(productType);
		char[] a = productType.toCharArray();
		List<ProductionInfo> productions = prods.getProduction(Integer.parseInt(productType));
		if(productions != null){
			resultMap.put("operFlag", "1000");
		} else {
			resultMap.put("operFlag", "1001");
			resultMap.put("errorMessage", "获取制作内容失败");
		}
		model.addAttribute("productions",productions);
		return resultMap;
	}
	
	//项目管理
	@RequestMapping("/projectManagement")
	public String toProjectManagement(Model model,@SuppressWarnings("rawtypes") PageUtil page,HttpServletRequest request){
		HttpSession session = request.getSession();
		UserEntity ue1 = (UserEntity) session.getAttribute("username");
		Integer orgId = ue1.getOrgId();
		page.setCurrentPage(page.getCurrentPage());
		//根据组织id查询项目总数
		int totalCount = ps.getProjectCount(orgId);
		page.setTotalRecord(totalCount);
		page.setPageSize(pageSize);
		//每页显示10条数据
		page.setPageSize(pageSize);
		//总页数
		int totalPage = totalCount % pageSize == 0 ? totalCount/pageSize : totalCount/pageSize + 1;
		page.setTotalPage(totalPage);
		//起始下标
		page.setStartIndex((page.getCurrentPage()-1)*page.getPageSize());
		//获取项目列表
		List<ProjectInfo> list = ps.getProjectList(page,ue1);
		//获取开发商列表		
		log.info("-------------------"+session.getAttribute("username"));
		model.addAttribute("projectList",list);
		session.setAttribute("projectList", list);
		model.addAttribute("page",page);
		return "project/projectManagement";
	}
	
	@RequestMapping("projectInfo")
	public String toProjectInfo(HttpServletRequest request){
		String id = request.getParameter("projectId");
		log.info("---------------------------------获取项目id："+id+"---------------------------------");
		return "project/projectInfo";
	}

}
