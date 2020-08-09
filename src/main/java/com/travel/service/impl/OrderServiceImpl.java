package com.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.travel.dao.IBaseDao;
import com.travel.entity.Orders;
import com.travel.mapper.OrdersMapper;
import com.travel.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl extends BaseServiceImpl<Orders> implements IOrderService{

    @Autowired
    private OrdersMapper ordersMapper;
    @Override
    public IBaseDao<Orders> getdao() {
        return ordersMapper;
    }

    @Override
    public int updateByuid(Orders orders) {
        return ordersMapper.updateByuid(orders);
    }

    @Override
    public Orders selectByuid(Orders orders) {
        return ordersMapper.selectByuid(orders);
    }

    @Override
    public PageInfo<Orders> getBystate(int state,PageInfo<Orders> pageInfo ) {
        if(pageInfo.getPageNum()==0){
            pageInfo.setPageNum(1);
            pageInfo.setPageSize(5);

        }

        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());
        List<Orders> bystate = ordersMapper.getBystate(state);

        return new PageInfo<>(bystate);
    }

    @Override
    public PageInfo<Orders> orders(Integer id, PageInfo<Orders> pageInfo) {
        if(pageInfo.getPageNum()==0){
            pageInfo.setPageNum(1);
            pageInfo.setPageSize(5);
        }

        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());
        List<Orders> list = ordersMapper.orders(id);
        return new PageInfo<>(list);
    }
    @Override
    public Map<String, String> getBydetail(Integer id) {
        return ordersMapper.getBydetail(id);
    }

    @Override
    public int updateState(int id,int state) {
        return ordersMapper.updateState(id,state);
    }




}
