package com.travel.mapper;

import com.github.pagehelper.PageInfo;
import com.travel.dao.IBaseDao;
import com.travel.entity.Orders;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface OrdersMapper extends IBaseDao{

    int updateByuid(Orders orders);

    Orders selectByuid(Orders orders);

    List<Orders> getBystate(int state);

    Map<String,String> getBydetail(int id);

    int updateState(@Param("id") int id,@Param("state") int state);

    List<Orders> orders(Integer id);
}