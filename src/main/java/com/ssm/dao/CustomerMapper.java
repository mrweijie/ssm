package com.ssm.dao;

import com.ssm.entity.Customer;

import java.util.HashMap;
import java.util.List;

public interface CustomerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);

    int selectCount();

    List<Customer> getAll(HashMap<String,Object> map);
}