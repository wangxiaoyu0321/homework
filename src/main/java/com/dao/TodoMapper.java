package com.dao;

import com.entity.Todo;
import com.util.PageUtil;

import java.util.List;
import org.springframework.stereotype.Service;
@Service
public interface TodoMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Todo record);

    int insertSelective(Todo record);

    Todo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Todo record);

    int updateByPrimaryKey(Todo record);
    
    List<Todo> getAllBacklog(PageUtil page);
}