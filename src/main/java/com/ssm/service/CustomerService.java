package com.ssm.service;

import com.ssm.dao.CustomerMapper;
import com.ssm.entity.Customer;
import com.ssm.entity.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class CustomerService implements BaseService<Customer> {

    @Autowired
    private CustomerMapper mapper;

    public PageBean<Customer> getAll(int currentPage, int pageSize, String name) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        PageBean<Customer> pageBean = new PageBean<Customer>();
        //当前页数
        pageBean.setCurrPage(currentPage);
        //每页显示的数据
        pageBean.setPageSize(pageSize);
        //封装总记录数
        int totalCount = mapper.selectCount();
        pageBean.setTotalCount(totalCount);
        //封装总页数
        double tc = totalCount;
        Double num = Math.ceil(tc / pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start", (currentPage - 1) * pageSize);
        map.put("size", pageBean.getPageSize());
        if (!"".equals(name)) {
            map.put("name", name);
        }
        //封装每页显示的数据
        List<Customer> lists = mapper.getAll(map);
        pageBean.setLists(lists);
        return pageBean;
    }

    @Override
    public Customer getById(Integer id) {
        return null;
    }

    @Override
    public int deleteById(Integer id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int add(Customer customer) {
        return mapper.insert(customer);
    }

    @Override
    public int update(Customer customer) {
        return mapper.updateByPrimaryKey(customer);
    }

    public List<Customer> selectAllName() {
        return new ArrayList<>();
    }

}
