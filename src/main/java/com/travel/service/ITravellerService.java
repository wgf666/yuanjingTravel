package com.travel.service;

import com.travel.dao.IBaseDao;
import com.travel.entity.Traveller;

import java.util.List;

public interface ITravellerService extends IBaseDao<Traveller> {
    List<Traveller> selectByorderid(Integer id);
}
