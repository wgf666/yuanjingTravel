package com.travel.mapper;

import com.travel.dao.IBaseDao;
import com.travel.entity.User;

import java.util.List;

public interface UserMapper extends IBaseDao<User> {

     User login(String name);

     User selectByName(String name);

    List<User> getUserList();

    List<User> selectByCondition(String name);

    int batchDelId(List<Integer> param);

    void changeById(User user);
}