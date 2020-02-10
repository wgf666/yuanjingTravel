package com.travel.service;

import com.travel.entity.Admin;

/**
 * @author:吴小富
 * @Date: 2019/12/19
 */
public interface IAdminService extends IBaseService<Admin> {
    Admin loginByName(String username);
}
