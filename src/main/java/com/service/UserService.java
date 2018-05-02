package com.service;

import com.entity.UserEntity;

public interface UserService {
	/**
	 * @author 王小萌
	 * @param {name,password}
	 * @param password
	 * @return UserEntity
	 * @description:
	 */
	public UserEntity checkLogin(String name,String password)throws Exception;
	/**
	 * @author 王小萌
	 * @date 2018-3-21 下午3:00:03
	 * @param {User}
	 * @return 注册成功返回true，注册失败返回false
	 * @description：注册
	 */
	public boolean regist(String name,String password);
	
	/**
	 * @author 王小萌
	 * @date 2018-3-21 下午3:00:03
	 * @param name
	 * @return 用户已存在返回true，用户不存在返回false
	 * @description：判断用户名是否存在
	 */
	public boolean isExist(String name);
	/**
	 * @Author: 王小萌
	 * @Date: 2018/5/1 下午6:06
	 * @Param: {用户名：name}
	 * @Return: {用户名更改成功返回true，更改失败返回false}
	 * @Descripton: <更改密码 >
	 */
	public boolean updatePasswordByName(String name,String change);

}
