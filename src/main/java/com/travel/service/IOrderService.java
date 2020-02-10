package com.travel.service;

import com.github.pagehelper.PageInfo;
import com.travel.entity.Orders;

import java.util.List;
import java.util.Map;

public interface IOrderService extends IBaseService<Orders> {
    int updateByuid(Orders orders);

    Orders selectByuid(Orders orders);

    PageInfo<Orders> getBystate(int state, PageInfo<Orders> pageInfo);

    Map<String,String> getBydetail(Integer id);

    int updateState(int id,int state);

    PageInfo<Orders> orders(Integer id, PageInfo<Orders> pageInfo);
}
