package com.service.impl;

import javax.xml.registry.infomodel.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UserDao;
import com.entity.UserEntity;
import com.service.UserService;

import common.ThisSystemException;
import common.ThisSystemUtil;
//import static common.ThisSystemUtil.*;

@Service("UserService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao userDao;

	/**
	 * @Author: 王小萌
	 * @Date: 2018/5/1 下午5:49
	 * @Param: {用户名，密码 }
	 * @Return: {用户名和密码正确，返回User对象 }
	 * @Descripton: <用户名密码检测 >
	 */
	@Override
	public UserEntity checkLogin(String name, String password) throws Exception {
		//判定空
		name = ThisSystemUtil.throwIfBlank("用户名不能为空", name);
		password = ThisSystemUtil.throwIfBlank("密码不能为空", password);
		
		UserEntity ue = userDao.findUserByName(name);
		
		if(ue == null){
			throw new ThisSystemException("账号不存在");
		}
		if(!ue.getPassword().equals(password)){
			throw new ThisSystemException("密码错误！");
		}		
		return ue;
	}

	/**
	 * @author 王小萌
	 * @date 2018-3-20 下午4:43:58
	 * @param {user}
	 * @return 注册成功返回true，注册失败返回false。
	 * @description：注册
	 */
	public boolean regist(String name,String password) {
		int n = userDao.addUser(name,password);
		if(n != 0){
			return true;
		} else {
			return false;
		}		
	}

	/**
	 * @Author: 王小萌
	 * @Date: 2018/5/1 下午5:50
	 * @Param: {用户名：name }
	 * @Return: {用户名存在返回true，不存在返回false }
	 * @Descripton: <检查用户名是否存在 >
	 */
	@Override
	public boolean isExist(String name) {
		name = ThisSystemUtil.throwIfBlank("用户名不能为空", name);
		UserEntity ue = userDao.findUserByName(name);
		if(ue != null){
			return true;
		} else{
			return false;
		}
	}

	/**
	 * @Author: 王小萌
	 * @Date: 2018/5/1 下午6:06
	 * @Param: {用户名：name}
	 * @Return: {用户名更改成功返回true，更改失败返回false}
	 * @Descripton: <更改密码 >
	 */
	@Override
	public boolean updatePasswordByName(String name,String change) {
		UserEntity u = new UserEntity();
		u.setName(name);
		u.setPassword(change);
		int result = userDao.updatePasswordByName(u);
		if(result != 0){
			return true;
		} else {
			return false;
		}
	}

	/**
	 * @author 王小萌
	 * @date 2018-5-3 上午11:39:20
	 * @param: {用户名： name}
	 * @return: {修改成功返回true，修改失败返回false}
	 * @description：<修改头像>
	 */
	@Override
	public boolean updateImageByName(String name,String image) {
		int n = userDao.updateImageByName(name,image);
		if(n != 0){
			return true;
		} else {			
			return false;
		}
	}

	@Override
	public UserEntity findUserByName(String name) {
		return userDao.findUserByName(name);
	}


}
