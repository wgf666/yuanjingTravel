package com.travel.mapper;

import com.travel.dao.IBaseDao;
import com.travel.entity.Admin;

public interface AdminMapper extends IBaseDao<Admin> {
    Admin loginByName(String username);
}