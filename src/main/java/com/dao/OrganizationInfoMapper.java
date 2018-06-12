package com.dao;

import com.entity.OrganizationInfo;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
@Service
public interface OrganizationInfoMapper {

    int insert(OrganizationInfo record);

    int insertSelective(OrganizationInfo record);
    
    List<OrganizationInfo> findAllLibrary();
    
    OrganizationInfo getOrgNameById(Integer orgId);
}