package com.travel.service.impl;

import com.travel.dao.IBaseDao;
import com.travel.entity.User;
import com.travel.mapper.UserMapper;
import com.travel.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements IUserService {
  @Autowired
  private UserMapper userMapper;


    @Override
    public IBaseDao<User> getdao() {
        return userMapper;
    }

    @Override
    public User login(String name) {
        return userMapper.login(name);
    }


}
