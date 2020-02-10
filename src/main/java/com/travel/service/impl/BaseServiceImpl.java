package com.travel.service.impl;


import com.travel.dao.IBaseDao;
import com.travel.service.IBaseService;

public abstract class BaseServiceImpl<T> implements IBaseService<T> {

    public abstract IBaseDao<T> getdao();

    @Override
    public int deleteByPrimaryKey(int id) {
        return getdao().deleteByPrimaryKey(id);
    }

    @Override
    public int insert(T t) {
        return getdao().insert(t);
    }

    @Override
    public int insertSelective(T t) {
        return insertSelective(t);
    }

    @Override
    public T selectByPrimaryKey(int id) {
        return  getdao().selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(T t) {
        return getdao().updateByPrimaryKeySelective(t);
    }

    @Override
    public int updateByPrimaryKey(T t) {
        return updateByPrimaryKeySelective(t);
    }
}
