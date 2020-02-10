package com.travel.service;

import com.github.pagehelper.PageInfo;
import com.travel.entity.Grogshop;

import java.util.List;

/**
 * @author:吴小富
 * @Date: 2019/12/18
 */
public interface IGrogShopService extends IBaseService<Grogshop> {

    List<Grogshop> getGrogShop();

    PageInfo<Grogshop> getHotelList(PageInfo<Grogshop> pageInfo);

    PageInfo<Grogshop> selectByCondition(PageInfo<Grogshop> pageInfo,String cityName);

    int batchDelId(List<Integer> param);
}
