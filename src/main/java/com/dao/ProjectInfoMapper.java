package com.dao;

import com.entity.ProjectInfo;
import com.entity.UserEntity;
import com.util.PageUtil;

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
    
    //获取项目列表
    List<ProjectInfo> getProjectList(@Param("page")PageUtil page,@Param("ue")UserEntity ue);

    /**
     * @author：王小萌
     * @date: 2018-6-28 下午2:05:34
     * @param: {orgId:组织id}
     * @return: {项目数量}
     * @description: <获取项目数量>
     */
    Integer getProjectCount(@Param("orgId")Integer orgId);
}