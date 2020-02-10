package com.travel.service;

import com.github.pagehelper.PageInfo;
import com.travel.entity.ScenicSpot;

import java.util.List;

/**
 * @author:吴小富
 * @Date: 2019/12/21
 */

public interface IBackScenicSpotService extends IBaseService<ScenicSpot>{
    List<ScenicSpot> getArrangeByInland(int i);

    List<ScenicSpot> getSpecialByArrange(String arrange);

    PageInfo<ScenicSpot> getListById(PageInfo<ScenicSpot> pageInfo, int id);

    PageInfo<ScenicSpot> getListByArrange(PageInfo<ScenicSpot> pageInfo, String arrange);
}
