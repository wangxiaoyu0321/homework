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
	/**
	 * @author 王小萌
	 * @date 2018-4-25 下午5:19:32
	 * @param：{page}
	 * @return：{返回一个list集合}
	 * @description：<分页：获取全部员工信息>
	 */
	List<Account> getAllAccount(PageUtil page);
	/**
	 * @author 王小萌
	 * @date 2018-4-25 下午5:18:46
	 * @param：null
	 * @return:{返回数据总数}
	 * @description：<分页：获取数据总数>
	 */
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
	 * @Param: {account对象}
	 * @Return: {更新成功返回true，更新失败返回false }
	 * @Descripton: <修改员工信息>
	 */
	boolean updateAccountById(Account account);
	/**
	 * @Author: 王小萌
	 * @Date: 2018/4/22 下午10:30
	 * @Param: { name}
	 * @Return: {查询成功返回true，查询失败返回false }
	 * @Descripton: <根据用户名获取用户信息>
	 */
	List<Account> searchByName(String name,PageUtil page);
	/**
	 * @author 王小萌
	 * @date 2018-4-25 下午5:17:30
	 * @param：{id}
	 * @return{Account对象}
	 * @description：<根据用户ID查询员工信息>
	 */
	List<Account> searchAccountById(int id);
	
}
