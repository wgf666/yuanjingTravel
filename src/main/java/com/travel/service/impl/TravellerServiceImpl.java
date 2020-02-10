package com.travel.service.impl;

import com.travel.dao.IBaseDao;
import com.travel.entity.Traveller;
import com.travel.mapper.TravellerMapper;
import com.travel.service.ITravellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TravellerServiceImpl extends BaseServiceImpl<Traveller> implements ITravellerService {
   @Autowired
   private TravellerMapper travellerMapper;
    @Override
    public IBaseDao<Traveller> getdao() {
        return travellerMapper;
    }

    @Override
    public List<Traveller> selectByorderid(Integer id) {
        return travellerMapper.selectByorderid(id);
    }
}
