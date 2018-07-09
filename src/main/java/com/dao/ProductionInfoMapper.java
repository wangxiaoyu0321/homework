package com.dao;
//制作内容
import com.entity.ProductionInfo;
import com.entity.ProductionInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductionInfoMapper {
    int countByExample(ProductionInfoExample example);

    int deleteByExample(ProductionInfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ProductionInfo record);

    int insertSelective(ProductionInfo record);

    List<ProductionInfo> selectByExample(ProductionInfoExample example);

    ProductionInfo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ProductionInfo record, @Param("example") ProductionInfoExample example);

    int updateByExample(@Param("record") ProductionInfo record, @Param("example") ProductionInfoExample example);

    int updateByPrimaryKeySelective(ProductionInfo record);

    int updateByPrimaryKey(ProductionInfo record);
    
    /**
     * @author：王小萌
     * @date: 2018-6-21 上午11:29:18
     * @param: {产品类型}
     * @return: {该产品类型对应的制作内容}
     * @description: <获取制作内容>
     */
    List<ProductionInfo> getProduction(Integer productType);
}