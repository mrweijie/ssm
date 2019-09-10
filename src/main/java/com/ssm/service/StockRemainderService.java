package com.ssm.service;

import com.ssm.dao.StockRemainderMapper;
import com.ssm.entity.PageBean;
import com.ssm.entity.StockRemainder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class StockRemainderService implements BaseService<StockRemainder> {

    @Autowired
    private StockRemainderMapper mapper;

    @Override
    public StockRemainder getById(Integer id) {
        return null;
    }

    @Override
    public int deleteById(Integer id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int add(StockRemainder stockRemainder) {
        stockRemainder.setSrUpdate(new Date());
        return mapper.insert(stockRemainder);
    }

    @Override
    public int update(StockRemainder stockRemainder) {
        return 0;
    }

    public PageBean<StockRemainder> getAll(int currentPage, int pageSize, String search_date) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        PageBean<StockRemainder> pageBean = new PageBean<StockRemainder>();
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

        if (!"".equals(search_date)) {
            map.put("search_date", search_date);
        }
        map.put("start", (currentPage - 1) * pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<StockRemainder> lists = mapper.findByPage(map);
        pageBean.setLists(lists);
        return pageBean;
    }

    public List<StockRemainder> getListByStockId(Integer stockId, String year, String month) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("s_id", stockId);
        if (!"".equals(year)) {
            map.put("year", year);
        }
        if (!"".equals(month)) {
            map.put("month", month);
        }
        List<StockRemainder> lists = mapper.findByPage(map);
        return lists;
    }
}
