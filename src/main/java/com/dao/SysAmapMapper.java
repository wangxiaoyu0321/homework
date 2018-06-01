package com.dao;

import com.entity.SysAmap;
import com.entity.SysAmapExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysAmapMapper {
    int countByExample(SysAmapExample example);

    int deleteByExample(SysAmapExample example);

    int deleteByPrimaryKey(Integer fdId);

    int insert(SysAmap record);

    int insertSelective(SysAmap record);

    List<SysAmap> selectByExample(SysAmapExample example);

    SysAmap selectByPrimaryKey(Integer fdId);

    int updateByExampleSelective(@Param("record") SysAmap record, @Param("example") SysAmapExample example);

    int updateByExample(@Param("record") SysAmap record, @Param("example") SysAmapExample example);

    int updateByPrimaryKeySelective(SysAmap record);

    int updateByPrimaryKey(SysAmap record);
}