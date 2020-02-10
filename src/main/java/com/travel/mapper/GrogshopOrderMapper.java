package com.travel.mapper;

import com.travel.dao.IBaseDao;
import com.travel.entity.GrogshopOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GrogshopOrderMapper extends IBaseDao<GrogshopOrder> {
    List<GrogshopOrder> getList(int status);

    GrogshopOrder getHotelById(int id);

    List<GrogshopOrder> getHotelByName(@Param("name") String name, @Param("status") int status);

    int updateByStatus(int id);

    int batchDelId(List<Integer> param);
}