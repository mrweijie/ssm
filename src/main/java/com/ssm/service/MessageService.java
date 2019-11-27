package com.ssm.service;

import com.ssm.dao.MessageMapper;
import com.ssm.entity.Message;
import com.ssm.entity.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageService implements BaseService<Message> {

    @Autowired
    private MessageMapper mapper;

    public List<Message> getAll() {
        return mapper.selectAll();
    }

    @Override
    public Message getById(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public int deleteById(Integer id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int add(Message message) {
        return mapper.insert(message);
    }

    @Override
    public int update(Message message) {
        return mapper.updateByPrimaryKey(message);
    }

    public PageBean<Message> findByPage(int currentPage) {
        return null;
    }

}
