package com.dao;

import com.entity.DevelopersInfo;
import com.entity.DevelopersInfoExample;
import com.util.PageUtil;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DevelopersInfoMapper {
	
	/**
	 * @author：王小萌
	 * @date: 2018-7-4 下午1:37:46
	 * @param: {}
	 * @return: {开发商总数}
	 * @description: <获取开发商总数>
	 */
    int countByExample();

    int deleteByExample(DevelopersInfoExample example);

    int deleteByPrimaryKey(Integer developerid);

    int insert(DevelopersInfo record);

    int insertSelective(DevelopersInfo record);

    List<DevelopersInfo> selectByExample(DevelopersInfoExample example);

    DevelopersInfo selectByPrimaryKey(Integer developerid);

    int updateByExampleSelective(@Param("record") DevelopersInfo record, @Param("example") DevelopersInfoExample example);

    int updateByExample(@Param("record") DevelopersInfo record, @Param("example") DevelopersInfoExample example);

    int updateByPrimaryKeySelective(DevelopersInfo record);

    int updateByPrimaryKey(DevelopersInfo record);
    /**
     * @author：王小萌
     * @date: 2018-7-6 上午11:20:45
     * @param: {page}
     * @return: {开发商列表}
     * @description: <获取开发商列表>
     */
    List<DevelopersInfo> getAllDevelopers(@Param("page")PageUtil page);
    
    
}