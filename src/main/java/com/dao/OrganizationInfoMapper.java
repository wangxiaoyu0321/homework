package com.dao;

import com.entity.OrganizationInfo;
import com.entity.OrganizationInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrganizationInfoMapper {
    int countByExample(OrganizationInfoExample example);

    int deleteByExample(OrganizationInfoExample example);

    int insert(OrganizationInfo record);

    int insertSelective(OrganizationInfo record);

    List<OrganizationInfo> selectByExample(OrganizationInfoExample example);

    int updateByExampleSelective(@Param("record") OrganizationInfo record, @Param("example") OrganizationInfoExample example);

    int updateByExample(@Param("record") OrganizationInfo record, @Param("example") OrganizationInfoExample example);
    
    List<OrganizationInfo> findAllLibrary();
}