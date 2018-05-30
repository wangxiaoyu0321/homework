package com.dao;

import com.entity.RoleInfo;
import com.util.PageUtil;

import java.util.List;

import org.springframework.stereotype.Service;
//角色信息
@Service
public interface RoleInfoMapper {

    int deleteByPrimaryKey(Integer roleid);

    int insert(RoleInfo record);

    int insertSelective(RoleInfo record);

    RoleInfo selectByPrimaryKey(Integer roleid);

    int updateByPrimaryKeySelective(RoleInfo record);

    int updateByPrimaryKey(RoleInfo record);
    
    //获取全部角色
    List<RoleInfo> getAllRole(PageUtil pageUtil);
}