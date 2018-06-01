package com.dao;

import com.entity.ProjectInfo;
import java.util.List;
import org.apache.ibatis.annotations.Param;
/**
 * @author 王小萌
 * @description: <项目>
 */
public interface ProjectInfoMapper {

    int deleteByPrimaryKey(String id);
    
    //创建项目
    int createProject(ProjectInfo pi);

    int insertSelective(ProjectInfo record);

    ProjectInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ProjectInfo record);

    int updateByPrimaryKey(ProjectInfo record);
}