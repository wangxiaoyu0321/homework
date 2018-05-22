/**
 * 
 */
package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Todo;
import com.dao.TodoMapper;
import com.service.TodoService;
import com.util.PageUtil;

/**
 * @description：
 */
@Service("TodoService")
public class TodoServiceImpl implements TodoService {
	@Autowired
	TodoMapper tm;
	@Override
	public List<Todo> getAllBacklog(PageUtil page) {
		List<Todo> list = tm.getAllBacklog(page);
		return list;
	}

}
