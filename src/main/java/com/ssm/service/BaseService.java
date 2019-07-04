package com.ssm.service;

import java.util.List;

public interface BaseService<T> {
    List<T> getAll();

    T getById(Integer id);

    int deleteById(Integer id);

    int add(T t);

    int update(T t);
}
