package com.ssm.dao;

import com.ssm.entity.StockSell;

import java.util.HashMap;
import java.util.List;

public interface StockSellMapper {
    int deleteByPrimaryKey(Integer sId);

    int insert(StockSell record);

    int insertSelective(StockSell record);

    StockSell selectByPrimaryKey(Integer sId);

    int updateByPrimaryKeySelective(StockSell record);

    int updateByPrimaryKey(StockSell record);

    List<StockSell> findByPage(HashMap<String,Object> map);

    int selectCount();
}