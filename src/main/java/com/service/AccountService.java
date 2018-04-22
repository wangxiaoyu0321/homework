package com.service;

import java.util.List;
import java.util.Map;

import com.entity.Account;
import com.util.PageUtil;

public interface AccountService {
	/**
	 * @author 王小萌
	 * @date 2018-3-29 下午8:55:44
	 * @param {Account}
	 * @return 添加成功返回true，添加失败返回false。
	 * @description：添加员工
	 */
	public boolean addEmployee(Account account);
	/**
	 * @author 王小萌
	 * @date 2018-3-29 下午9:20:05
	 * @param {name}
	 * @return 名字重复返回true，不重复返回false
	 * @description：判断员工名字是否重复
	 */
	public boolean isExist(String name);
	//获取全部员工
	List<Account> getAllAccount(PageUtil page);
	//获取总条数
	public int getCountNum();
	/** @author 王小萌
	 * @date 2018-4-20 下午4:08:28
	 * @param : id
	 * @return : 删除成功返回true，删除失败返回false
	 * @description：<根据用户ID删除员工>
	 */
	boolean deleteByPrimaryKey(Integer id);
	/**
	 * @Author: 王小萌
	 * @Date: 2018/4/22 上午11:22
	 * @Param: { id}
	 * @Return: {更新成功返回true，更新失败返回false }
	 * @Descripton: <根据用户id更新员工信息>
	 */
	boolean updateAccountById(Integer id);
	/**
	 * @Author: 王小萌
	 * @Date: 2018/4/22 下午10:30
	 * @Param: { name}
	 * @Return: {查询成功返回true，查询失败返回false }
	 * @Descripton: <根据用户名获取用户信息>
	 */
	boolean searchByName(String name);
	
	
}
