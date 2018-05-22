package com.dao;


import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.entity.Account;
import com.entity.Role;
import com.entity.UserEntity;
import com.util.PageUtil;

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
	 * @author：王小萌
	 * @date: 2018-5-17 上午11:25:56
	 * @param: {角色id}
	 * @return: {权限}
	 * @description: <根据角色id获取权限>
	 */
	public Set<String> findPermissionByRole(@Param("id")Integer id);
	/**
	 * 
	 * @param id
	 * @return 角色名称
	 */
	public Set<String> findRoleNameById(Integer id);
	/**
	 * @author：王小萌
	 * @date: 2018-5-22 下午2:40:12
	 * @param: {pageUtil}
	 * @return: {List}
	 * @description: <用户管理：获取全部用户列表>
	 */
	public List<UserEntity> getAllUser(PageUtil pageUtil);
	/**
	 * @author：王小萌
	 * @date: 2018-5-22 下午5:19:04
	 * @param: {}
	 * @return: {返回用户数量之和}
	 * @description: <获取用户总数>
	 */
	public int getUserNum();
	
}
