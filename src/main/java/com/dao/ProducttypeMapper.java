package com.dao;

import com.entity.Producttype;
import com.entity.ProducttypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
//产品类型
public interface ProducttypeMapper {
    int countByExample(ProducttypeExample example);

    int deleteByExample(ProducttypeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Producttype record);

    int insertSelective(Producttype record);

    List<Producttype> selectByExample(ProducttypeExample example);

    Producttype selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Producttype record, @Param("example") ProducttypeExample example);

    int updateByExample(@Param("record") Producttype record, @Param("example") ProducttypeExample example);

    int updateByPrimaryKeySelective(Producttype record);

    int updateByPrimaryKey(Producttype record);
    
    List<Producttype>getProductType(@Param("productType")List productType);
}