package com.travel.service;

import com.github.pagehelper.PageInfo;
import com.travel.entity.User;

import java.util.List;

/**
 * @author:吴小富
 * @Date: 2019/12/20
 */
public interface IBackUserService extends IBaseService<User> {
    PageInfo<User> getUserList(PageInfo<User> pageInfo);

    PageInfo<User> selectByCondition(PageInfo<User> pageInfo, String name);

    int batchDelId(List<Integer> param);

    void changeById(User user);
}
