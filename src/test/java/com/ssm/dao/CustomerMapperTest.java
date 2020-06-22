package com.ssm.dao;

import com.ssm.entity.Customer;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.List;

public class CustomerMapperTest {
    private ApplicationContext applicationContext;

    @Autowired
    private CustomerMapper mapper;

    @Before
    public void setUp() throws Exception {
        // 加载spring配置文件
        applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
        // 导入需要测试的
        mapper = applicationContext.getBean(CustomerMapper.class);
    }

    @After
    public void tearDown() throws Exception {
    }

    @Test
    public void getAll() {
        List<Customer> list = mapper.getAll(new HashMap<String,Object>());
        System.out.println(list);
    }
}