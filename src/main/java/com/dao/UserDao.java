package com.dao;


import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.entity.Account;
import com.entity.UserEntity;

@Service
public interface UserDao {
	/**
	 * @param name
	 * @return User
	 * @description 根据用户名查询用户
	 */
	public UserEntity findUserByName(String name);
	/**
	 * @param {user}
	 * @return 
	 * @description 添加用户
	 */
	public int addUser(@Param("name")String name, @Param("password")String password);
	/**
	 * @param name
	 * @return 
	 * @description 
	 */
	public boolean check(String name);
	/**
	 * @Author: 王小萌
	 * @Date: 2018/5/1 下午6:03
	 * @Param: {用户名：name }
	 * @Return: {用户密码更改成功返回true，更改失败返回false }
	 * @Descripton: <更改密码 >
	 */
	public int updatePasswordByName(UserEntity u);
	/**
	 * @author 王小萌
	 * @date 2018-5-3 上午11:30:09
	 * @param: {用户名： name,图片路径地址}
	 * @return:
	 * @description：<修改头像>
	 */
	public int updateImageByName(@Param("name")String name,@Param("image")String image);
	/**
	 * 
	 * @param name
	 * @return  权限集合
	 */
	public List findPermissonByName(@Param("name")String name);
	/**
	 * 
	 * @param id
	 * @return 角色名称
	 */
	public Set<String> findRoleNameById(@Param("id")Integer id);

	
}
