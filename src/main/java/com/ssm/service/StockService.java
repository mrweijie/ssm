package com.ssm.service;

import com.ssm.dao.StockMapper;
import com.ssm.dao.StockSellMapper;
import com.ssm.entity.PageBean;
import com.ssm.entity.Stock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class StockService implements BaseService<Stock> {

    @Autowired
    private StockMapper mapper;

    public PageBean<Stock> getAll(int currentPage , int pageSize) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        PageBean<Stock> pageBean = new PageBean<Stock>();
        //当前页数
        pageBean.setCurrPage(currentPage);
        //每页显示的数据
        pageBean.setPageSize(pageSize);
        //封装总记录数
        int totalCount = mapper.selectCount();
        pageBean.setTotalCount(totalCount);
        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<Stock> lists = mapper.getAll(map);
        pageBean.setLists(lists);
        return pageBean;
    }

    @Override
    public Stock getById(Integer id) {
        return null;
    }

    @Override
    public int deleteById(Integer id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int add(Stock stock) {
        if(stock.getName()==null){
            return 0;
        }
        int num = mapper.selectrepeat(stock.getName());
        if(num > 0){
            return 2;
        }
        mapper.insert(stock);
        return 1;
    }

    @Override
    public int update(Stock stock) {
        return 0;
    }

}
