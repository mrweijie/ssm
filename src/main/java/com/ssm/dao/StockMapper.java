package com.ssm.dao;

import com.ssm.entity.Stock;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface StockMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Stock record);

    List<Stock> getAll(HashMap<String,Object> map);

    int insertSelective(Stock record);

    Stock selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Stock record);

    int updateByPrimaryKey(Stock record);

    List<Stock> findByPage(HashMap<String,Object> map);

    int selectCount();

    int selectrepeat(@Param("name") String name);
}