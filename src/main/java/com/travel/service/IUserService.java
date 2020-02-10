package com.travel.service;

import com.travel.dao.IBaseDao;
import com.travel.entity.User;

public interface IUserService extends IBaseDao<User>{
    User login(String name);


}
