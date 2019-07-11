package com.ssm.dao;

import com.ssm.entity.Stock;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

import static org.junit.Assert.*;

public class StockMapperTest {

    private ApplicationContext applicationContext;

    @Autowired
    private StockMapper mapper;

    @Before
    public void setUp() throws Exception {
        // 加载spring配置文件
        applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
        // 导入需要测试的
        mapper = applicationContext.getBean(StockMapper.class);
    }

    @After
    public void tearDown() throws Exception {
    }

    @Test
    public void getAll() {
//        List<Stock> stocks = mapper.getAll();
//        System.out.println(stocks.size());
    }

    @Test
    public void insert() {
        Stock stock = new Stock();
        stock.setName("产品22");
        stock.setRemarks("1");
        for (int i = 0; i <30 ; i++) {
        mapper.insert(stock);

        }
    }

    @Test
    public void selectrepeat() {
        Integer a =mapper.selectrepeat("产品");
        System.out.println(a);
    }

    @Test
    public void deleteByPrimaryKey() {
        Integer a =mapper.deleteByPrimaryKey(89);
        System.out.println(a);
    }

    @Test
    public void selectAllName() {
        List<Stock> a = mapper.selectAllName();
        System.out.println(a);
    }
}