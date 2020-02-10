package com.travel.service;

import com.github.pagehelper.PageInfo;
import com.travel.entity.GrogshopOrder;

import java.util.List;

/**
 * @author:吴小富
 * @Date: 2019/12/18
 */
public interface IGrogShopOrderService extends IBaseService<GrogshopOrder> {
    PageInfo<GrogshopOrder> getList(PageInfo<GrogshopOrder> pageInfo, int status);

    GrogshopOrder getHotelById(int id);

    PageInfo<GrogshopOrder> selectByCondition(PageInfo<GrogshopOrder> pageInfo, String name, int status);

    int updateByStatus(int id);

    int batchDelId(List<Integer> param);
}
