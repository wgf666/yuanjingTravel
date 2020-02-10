package com.travel.mapper;

import com.travel.dao.IBaseDao;
import com.travel.entity.Ari;

import java.util.List;

public interface AriMapper extends IBaseDao<Ari> {

    List<Ari> getAirInfo();

    List<Ari> getAirByName(String ariName);

    int batchDelId(List<Integer> param);
}