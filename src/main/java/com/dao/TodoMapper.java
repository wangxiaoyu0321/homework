package com.dao;

import com.entity.Todo;
import com.entity.TodoExample;
import com.util.PageUtil;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
@Service
public interface TodoMapper {
    int countByExample(TodoExample example);

    int deleteByExample(TodoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Todo record);

    int insertSelective(Todo record);

    List<Todo> selectByExample(TodoExample example);

    Todo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Todo record, @Param("example") TodoExample example);

    int updateByExample(@Param("record") Todo record, @Param("example") TodoExample example);

    int updateByPrimaryKeySelective(Todo record);

    int updateByPrimaryKey(Todo record);
    
    List<Todo> getAllBacklog(PageUtil page);
}