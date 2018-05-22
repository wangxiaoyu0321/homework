package com.service;

import java.util.List;
import java.util.Set;

import com.entity.Role;
import com.entity.UserEntity;
import com.util.PageUtil;

public interface UserService {
	/**
	 * @author 王小萌
	 * @param {name,password}
	 * @param name,password
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
	/**
	 * @author 王小萌
	 * @date 2018-5-3 上午11:39:20
	 * @param: {用户名： name}
	 * @return: {修改成功返回true，修改失败返回false}
	 * @description：<修改头像>
	 */
	public boolean updateImageByName(String name,String image);
	/**
	 * 
	 * @param name
	 * @return 
	 */
	public UserEntity findUserByName(String name);
	
	public Set<String> findPermissionByRole(Integer id);
	/**
	 * 
	 * @param 用户id
	 * @return 角色名称
	 */
	public Set<String> findRoleNameById(Integer id);
	
	public List<UserEntity> getAllUser(PageUtil pageUtil);
	/**
	 * @author：王小萌
	 * @date: 2018-5-22 下午5:20:39
	 * @param: {null}
	 * @return: {返回数量和}
	 * @description: <获取员工数量>
	 */
	public int getUserNum();

}
