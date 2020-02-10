package com.travel.mapper;

import com.travel.dao.IBaseDao;
import com.travel.entity.Traveller;

import java.util.List;

public interface TravellerMapper extends IBaseDao<Traveller>{

    List<Traveller> selectByorderid(Integer id);
}