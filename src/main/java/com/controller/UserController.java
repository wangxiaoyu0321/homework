package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.util.Base64;
import com.util.MD5;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.entity.UserEntity;
import com.service.UserService;
import com.sun.corba.se.spi.servicecontext.UEInfoServiceContext;
import com.sun.mail.handlers.image_gif;

import common.ThisSystemException;


@Controller
@RequestMapping("/user")
public class UserController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	Map<String,Object> resultMap  =  new HashMap<String,Object>();

	@Autowired
	private UserService us;

	//用户登录
	@RequestMapping("/toLogin")
	public String toLogin(){
		return "login";
	}
	/**
	 * @date 2018-03-27
	 * @param request
	 * @return Map
	 * @description 用户登陆
	 */
	@ResponseBody
	@RequestMapping("/login")
	public Map<String,Object> login(HttpServletRequest request,String name,String password){
		
		log.info("---------------------------进入登录-----------------------------");
		Subject subject = SecurityUtils.getSubject();
//		String name =  request.getParameter("name");
//		String password = request.getParameter("password");
		// 登录后存放进shiro token 
		String password2 = MD5.MD5(password);
		password = Base64.encode(password2);
		try {
			UsernamePasswordToken token = new UsernamePasswordToken(name,password);
			UserEntity ue;
			log.info("--------------------进入安全认证方法--------------------");
			subject.login(token);
			//查到user放进去
			ue = us.checkLogin(name,password);
			HttpSession session = request.getSession();
			session.setAttribute("username",ue);
			resultMap.put("operFlag", "1000");
			resultMap.put("message", "登录完成");
			log.info("-------------------登录完成----------------------");
		} catch (UnknownAccountException e) {
			resultMap.put("operFlag", "1001");
			resultMap.put("errorMessage", "没有权限");
		} catch(Exception e1){
			log.error("11111111111111",e1);
		}
//		
//		/**
//		 * 防止多参数的情况，如果存在特别多的参数，方法参数放不下，或者直接使用实体类
//		 */
//		String name =  request.getParameter("name");
//		String password = Base64.encode(MD5.MD5(request.getParameter("password")));
//		try{
//			long startTime = System.currentTimeMillis();
//			UserEntity ue = us.checkLogin(name,password);
//
//			HttpSession session = request.getSession();
//			session.setAttribute("username", ue);
//			resultMap.put("operFlag", "1000");
//			log.info("登录耗时："+(System.currentTimeMillis()-startTime)+"毫秒");
//		} catch (ThisSystemException e1){
//			log.info(e1.getMessage());
//			resultMap.put("operFlag", "1001");
//			resultMap.put("errorMessage", e1.getMessage());
//		} catch (Exception e){
//			log.error("登录异常",e);
//			resultMap.put("operFlag", "1001");
//		}
//		
//		log.info("登录结束");
		return resultMap;		
	}
	//欢迎页
	@RequestMapping("/index")
	public String toWelcome(){
		return "index";
	}
	//用户注册
	@RequestMapping("/toRegist")
	public String toRegist(){
		return "regist";
	}
	/**
	 * @author 王小萌
	 * @date 2018-3-27 上午10:03:24
	 * @param request
	 * @return Map
	 * @description：用户注册
	 */
	@ResponseBody
	@RequestMapping("/regist")
	public Map<String,Object> regist(HttpServletRequest request){
		String name = request.getParameter("name");
		String password1 = request.getParameter("password");
		String password2 = MD5.MD5(password1);
		String password = Base64.encode(password2);
		log.info("明文密码"+password1);
		log.info("MD5:"+password2);
		log.info("Base64"+password);
		log.info("进入注册方法");
		try{
			boolean result = us.isExist(name);
			if(result){
				resultMap.put("operFlag", "1001");
				resultMap.put("errorMessage", "用户名已存在!");
				log.info("该账号已存在");
			} else {
				boolean n = us.regist(name,password);
				if(n){
					resultMap.put("operFlag", "1000");
					log.info("注册成功");
				} else {
					resultMap.put("errorMessage","注册异常");
				}				
			}			
		} catch (ThisSystemException e){
			log.error("注册异常");
			resultMap.put("operFlag", "1001");
			resultMap.put("errorMessage", "该用户已存在!");
			log.info("该用户已存在");
		}
		return resultMap;
		
	}
	/**
	 * @author 王小萌
	 * @date 2018-3-27 上午10:12:19
	 * @param
	 * @return 注册成功，跳转到成功页面。
	 * @description：注册成功
	 */
	@RequestMapping("/regist_success")
	public String toSuccess(){
		return "regist_success";
	}
	@RequestMapping("/account")
	public String toAccount(){
		return "account";
	}
	@RequestMapping("/todo")
	public String todolist(){
		return "todo";
	}
	@RequestMapping("/personal")
	public String topersonal(UserEntity user,HttpServletRequest request,Model model){
		log.info("-----------------------进入个人中心方法--------------------");
		HttpSession session = request.getSession();
		
		UserEntity ue=(UserEntity) session.getAttribute("username");
		model.addAttribute("name", ue.getName());
		model.addAttribute("image", ue.getImage()==null?"":ue.getImage().trim());
		return "personal";
	}
	@RequestMapping("/toRetrievePassword")
	public String toRetrievePassword(){
		return "retrievePassword";
	}
	/**
	 * @author 王小萌
	 * @date 2018-5-2 上午9:58:10
	 * @param
	 * @return
	 * @description：<修改密码>
	 */
	@SuppressWarnings("unused")
	@ResponseBody
	@RequestMapping("/retrievePassword")
	public Map<String, Object> retrievePassword(HttpServletRequest request){
		log.info("-----------------------------进入修改密码----------------------------");
		//获取用户名、初始密码和修改后的密码
		String name = request.getParameter("name");
		String password = Base64.encode(MD5.MD5(request.getParameter("password")));
		String change = Base64.encode(MD5.MD5(request.getParameter("change")));
		
		try {
			//1.判断用户名是否存在
			//用户存在/密码正确
			UserEntity ue = us.checkLogin(name, password);
			//修改密码
			boolean Flag = us.updatePasswordByName(name,change);
			if(Flag){
				resultMap.put("operFlag", "1000");
				log.info("--------------------------修改密码成功--------------------------");
			} else {
				resultMap.put("operFlag", "1001");
				resultMap.put("errorMessage", "修改密码失败");
				log.info("--------------------------修改密码失败--------------------------");
			}
		} catch (ThisSystemException e1){
			//用户名不存在或者密码错误
			log.info("----------------------------密码错误/用户名不存在------------------------");
			resultMap.put("operFlag", "1001");
			resultMap.put("errorMessage", e1.getMessage());
		}
		catch (Exception e) {
			resultMap.put("operFlag", "1001");
			resultMap.put("errorMessage", "修改密码异常");
			log.info("--------------------------修改密码异常--------------------------");
		}		
		return resultMap;		
	}
	
	@RequestMapping("/outLogin")
	public String outLogin(HttpSession session){
		session.invalidate();
		return "login";
	}
	/**
	 * 上传头像
	 */
	@ResponseBody
	@RequestMapping("/upload")
	public Map<String, Object> upload(MultipartFile file,UserEntity user,HttpServletRequest request,Model model){
		System.out.println("111");
		HttpSession session = request.getSession();
		UserEntity ue = (UserEntity)session.getAttribute("username");
		String name = ue.getName();
		session.setAttribute("name",name);
//		model.addAttribute("name",name);
		log.info("------------------------获取用户名"+user+"------------------------");
		//保存数据库的路径  
		String sqlPath = null;   
		//定义文件保存的本地路径  
		String localPath="F:\\head-image\\";  
		//定义文件名  
		String filename=null;
		if(!user.getFile().isEmpty()){    
		    //生成uuid作为文件名称    
			String uuid = UUID.randomUUID().toString().replaceAll("-","");    
			//获得文件类型（可以判断如果不是图片，禁止上传）    
			String contentType=user.getFile().getContentType();    
			//获得文件后缀名   
			String suffixName=contentType.substring(contentType.indexOf("/")+1);  
			//得到 文件名  
			filename=uuid+"."+suffixName;   
			System.out.println(filename);  
			//文件保存路径  
			try {
				user.getFile().transferTo(new File(localPath+filename));
				//文件保存到本地的路径
				//把图片的相对路径保存至数据库  
				sqlPath = "/images/"+filename;  
				ue.setImage(sqlPath);
				boolean result = us.updateImageByName(name,sqlPath);
				if(result){
					resultMap.put("operFlag", "1000");
					resultMap.put("image", sqlPath);
					ue.setImage(sqlPath);
					session.setAttribute("username", ue);
					model.addAttribute("image",sqlPath);
					session.setAttribute("image",sqlPath);
					log.info("---------------------头像上传成功--------------------------");
				} else {
					resultMap.put("operFlag", "1001");
					resultMap.put("errorMessage", "头像上传失败，请稍后再试");
					log.info("---------------------头像上传失败--------------------------");
				}
				System.out.println("-------------------数据库路径"+sqlPath);  
				user.setImage(sqlPath); 
			} catch (IllegalStateException e) {
				resultMap.put("operFlag", "1001");
				resultMap.put("errorMessage", "头像上传异常");
				log.info("---------------------头像上传异常--------------------------");
				e.printStackTrace();
			} catch (IOException e) {
				resultMap.put("operFlag", "1001");
				resultMap.put("errorMessage", "头像上传异常");
				log.info("---------------------头像上传异常--------------------------");
			}    
		}	
		return resultMap;
		
	}
	
}
