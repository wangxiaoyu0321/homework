/**
 * 
 */
package com.service;

import java.util.List;

import com.entity.Todo;
import com.util.PageUtil;

/**
 * @description：待办事项
 */
public interface TodoService {
	List<Todo> getAllBacklog(PageUtil page);
}
