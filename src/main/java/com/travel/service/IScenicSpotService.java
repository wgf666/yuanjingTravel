package com.travel.service;

import com.github.pagehelper.PageInfo;
import com.travel.dao.IBaseDao;
import com.travel.entity.ScenicSpot;

import java.util.List;

public interface IScenicSpotService extends IBaseDao<ScenicSpot> {

    List<ScenicSpot> getSpotPicByType(int country);

    List<ScenicSpot> getSpotPicByPublish(int publish);

    PageInfo<ScenicSpot> getSpotPicByArrang(PageInfo<ScenicSpot> list,String arrang);

    PageInfo<ScenicSpot> search(PageInfo<ScenicSpot> pageInfo,Integer county, String special);
}
