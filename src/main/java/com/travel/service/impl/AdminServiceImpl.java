package com.travel.service.impl;

import com.travel.dao.IBaseDao;
import com.travel.entity.Admin;
import com.travel.mapper.AdminMapper;
import com.travel.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author:吴小富
 * @Date: 2019/12/19
 */
@Service
public class AdminServiceImpl extends BaseServiceImpl<Admin> implements IAdminService {

    @Autowired
    private AdminMapper adminMapper;
    @Override
    public IBaseDao<Admin> getdao() {
        return adminMapper;
    }


    @Override
    public Admin loginByName(String username) {
        return adminMapper.loginByName(username);
    }
}
