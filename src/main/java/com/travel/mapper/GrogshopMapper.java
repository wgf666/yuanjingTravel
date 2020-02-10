package com.travel.mapper;

import com.travel.dao.IBaseDao;
import com.travel.entity.Grogshop;

import java.util.List;

public interface GrogshopMapper extends IBaseDao<Grogshop> {
    List<Grogshop> getGrogShop();

    List<Grogshop> selectByCondition(String cityName);

    int batchDelId(List<Integer> param);
}