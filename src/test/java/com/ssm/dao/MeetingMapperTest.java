package com.ssm.dao;

import com.ssm.entity.Meeting;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import static org.junit.Assert.*;

public class MeetingMapperTest {


    private ApplicationContext applicationContext;

    @Autowired
    private MeetingMapper mapper;

    @Before
    public void setUp() throws Exception {
        // 加载spring配置文件
//        applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
//        // 导入需要测试的
//        mapper = applicationContext.getBean(Meeting.class);
    }

    @Test
    public void deleteByPrimaryKey() {
    }

    @Test
    public void insert() {
    }

    @Test
    public void insertSelective() {
    }

    @Test
    public void selectByPrimaryKey() {
    }
}