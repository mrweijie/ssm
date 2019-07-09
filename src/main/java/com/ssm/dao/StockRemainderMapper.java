package com.ssm.dao;

import com.ssm.entity.StockRemainder;

import java.util.HashMap;
import java.util.List;

public interface StockRemainderMapper {
    int deleteByPrimaryKey(Integer srId);

    int insert(StockRemainder record);

    int insertSelective(StockRemainder record);

    StockRemainder selectByPrimaryKey(Integer srId);

    int updateByPrimaryKeySelective(StockRemainder record);

    int updateByPrimaryKey(StockRemainder record);

    List<StockRemainder> findByPage(HashMap<String,Object> map);

    int selectCount();
}