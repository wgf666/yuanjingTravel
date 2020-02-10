package com.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.travel.dao.IBaseDao;
import com.travel.entity.User;
import com.travel.mapper.UserMapper;
import com.travel.service.IBackUserService;
import com.travel.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author:吴小富
 * @Date: 2019/12/20
 */
@Service
public class BackUserServiceImpl extends BaseServiceImpl<User> implements IBackUserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public IBaseDao<User> getdao() {
        return userMapper;
    }


    @Override
    public PageInfo<User> getUserList(PageInfo<User> pageInfo) {
        if(pageInfo.getPageNum()==0){
            pageInfo.setPageNum(1);
            pageInfo.setPageSize(5);
        }
        PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
        List<User> list=userMapper.getUserList();

        return new PageInfo<>(list);
    }

    @Override
    public PageInfo<User> selectByCondition(PageInfo<User> pageInfo, String name) {
        if(pageInfo.getPageNum()==0){
            pageInfo.setPageNum(1);
            pageInfo.setPageSize(5);
        }
        PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
        List<User> list=userMapper.selectByCondition(name);

        return new PageInfo<>(list);
    }

    @Override
    public int batchDelId(List<Integer> param) {
        return userMapper.batchDelId(param);
    }

    @Override
    public void changeById(User user) {
        userMapper.changeById(user);
    }
}
