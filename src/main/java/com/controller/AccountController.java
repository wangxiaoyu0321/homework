package com.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Account;
import com.service.AccountService;
import com.util.PageUtil;

/**
 * @description：员工
 */
@Controller
@RequestMapping("/account")
public class AccountController {
	
	Logger log = Logger.getLogger(this.getClass());
	Map<String,Object> resultMap = new HashMap<>();
	int pageSize =10;
	@Autowired
	public AccountService as;
	/**
	 * @Author: 王小萌
	 * @Date: 2018/4/17 下午10:19
	 * @Param: { }
	 * @Return: { }
	 * @Descripton: <添加员工>
	 */
	@ResponseBody
	@RequestMapping("/addAccount")
	public Map<String,Object> addEmployee(HttpServletRequest request){
		Account account1 = new Account();
		String account = request.getParameter("account");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String sex = request.getParameter("sex");
		String amount = request.getParameter("amount");
		account1.setAccount(account);
		account1.setName(name);
		account1.setAge(Integer.parseInt(age));
		account1.setSex(Integer.parseInt(sex));
		BigDecimal amount1=new BigDecimal(amount);
		account1.setAmount(amount1);
		log.info(account1);
		boolean result = as.addEmployee(account1);
		try {
			if(result){
				resultMap.put("operFlag","1000");
				log.info("添加员工成功！");
			} else {
				resultMap.put("operFlag","1001");
				resultMap.put("errorMessage","添加异常，请稍后再试！");
			}
		} catch (Exception e){
			log.info("添加员工异常");
			resultMap.put("operFlag","1001");
			resultMap.put("errorMessage","添加员工异常");
		}
		return resultMap;

	}
	
	/**
	 * @author 王小萌
	 * @date 2018-4-20 下午4:21:05
	 * @param
	 * @return
	 * @description：根据ID删除员工
	 */
	@ResponseBody
	@RequestMapping("/deleteAccount")
	public Map<String ,Object> deleteAccount(HttpServletRequest request){
		log.info("deleteAccount function()");
		String id = request.getParameter("id");
		boolean result = as.deleteByPrimaryKey(Integer.parseInt(id));
		try {			
			if(result) {
				resultMap.put("operFlag", "1000");
				log.info("Delete employee successfully");
			} else {
				resultMap.put("operFlag", "1001");
				log.info("Deleted employee failed!");
				resultMap.put("errorMessage", "Deleted employee failed");
			}
		} catch (Exception e) {
			log.info("Delete employee exception");
			resultMap.put("operFlag", "1001");
			resultMap.put("errorMessage", "Delete employee exception");
		}		
		return resultMap;		
	}
	
	/**
	 * @throws UnsupportedEncodingException 
	 * @Author: 王小萌
	 * @Date: 2018/4/16 下午10:15
	 * @Param: {page}
	 * @Return: { }
	 * @Descripton: <获取全部员工>
	 */
//	@ResponseBody
	@RequestMapping("/getAllAccount")
	public String getAllAccount(HttpServletRequest request,PageUtil page,Model model) throws UnsupportedEncodingException{
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", (page.getCurrentPage() - 1) * pageSize); // 起始记录
		log.info("获取account集合");
		page.setStartIndex((page.getCurrentPage() - 1) * pageSize);
		//获取全部员工，放入集合
		List<Account> accounts = null;				
		String name = request.getParameter("name");  			
		if(name != null && !"".equals(name.trim())){
			name = URLDecoder.decode(name, "UTF-8");  	
			accounts = as.searchByName(name,page);
		}else{
			accounts = as.getAllAccount(page);
		}
		log.info(accounts);
		int total = as.getCountNum(); // 总记录数
		int totalPage = total % pageSize == 0 ? total / pageSize : total / pageSize + 1;
		PageUtil page1 = new PageUtil(page.getCurrentPage(), pageSize, total);
		page1.setList(accounts);
		page1.setTotalPage(totalPage);
		page.setTotalRecord(total);
		if (accounts != null) {
			model.addAttribute("page",page1);
			return "account";
		}
		 return null;	
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
	/**
	 * @author 王小萌
	 * @date 2018-4-25 下午5:16:04
	 * @param
	 * @return
	 * @description：<更改员工信息>
	 */
	@ResponseBody
	@RequestMapping("/updateAccount")
	public Map<String,Object> updateAccount(HttpServletRequest request){
		log.info("updateAccount function()");
		String id = request.getParameter("id");
		Account account0 = new Account();
		String account = request.getParameter("account");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String sex = request.getParameter("sex");
		String amount = request.getParameter("amount");
		account0.setAccount(account);
		account0.setName(name);
		account0.setAge(Integer.parseInt(age));
		account0.setSex(Integer.parseInt(sex));
		BigDecimal amount1=new BigDecimal(amount);
		account0.setAmount(amount1);	
		account0.setId(Integer.parseInt(id));
		log.info(account0);
		boolean result = as.updateAccountById(account0);
		try {
			if(result){
				log.info("更新成功");
				resultMap.put("operFlag","1000");
			} else {
				log.info("Updated failed");
				resultMap.put("operFlag","1001");
				resultMap.put("errorMessage","更新失败，请稍后再试。");
			}
		} catch (Exception e){
			log.info("更新异常");
			resultMap.put("operFlage","1001");
			resultMap.put("errorMessage","更新异常");
		}
		return resultMap;

	}
	/**
	 * @Author: 王小萌
	 * @Date: 2018/4/24 下午10:26
	 * @Param: { }
	 * @Return: { }
	 * @Descripton: <根据用户id查询用户信息 >
	 */
	@ResponseBody
	@RequestMapping("/searchAccountById")
	public Map<String,Object> searchAccountById(HttpServletRequest request){
		log.info("Enter searchAccountById()");
		String id1 = request.getParameter("id");
		int id = Integer.parseInt(id1);
		List<Account> list = as.searchAccountById(id);
		log.info(list);
		try {
			if(list != null){			
				resultMap.put("operFlag","1000");
				resultMap.put("user",list.get(0));
			} else {
				resultMap.put("operFlag","1001");
				resultMap.put("errorMessage","没有找到");
			}
		} catch (Exception e){
			resultMap.put("operFlag","1001");
			resultMap.put("errorMessage","查找异常");
		}

		return resultMap;
	}
	/**
	 * @Author: 王小萌
	 * @Date: 2018/4/24 下午10:25
	 * @Param: { }
	 * @Return: { }
	 * @Descripton: <根据用户名查找员工 >
	 */
//	@RequestMapping("/searchByName")
//	public Map<String ,Object> searchByName(HttpServletRequest request){
//		log.info("searchByName function()");
//		String name = request.getParameter("name");
//		boolean result = as.searchByName(name);
//		try {
//			if(result){
//				log.info("Search success!");
//				resultMap.put("operFlag","1000");
//			} else {
//				log.info("Search failer!");
//				resultMap.put("operFlag","1001");
//				resultMap.put("errorMessage","Search failer!");
//			}
//		} catch (Exception e){
//			log.info("Search exception!");
//			resultMap.put("operFlag","1001");
//			resultMap.put("errorMessage","Search exception");
//		}
//		return resultMap;
//	}

}
