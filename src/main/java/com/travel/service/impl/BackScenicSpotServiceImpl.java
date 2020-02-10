package com.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.travel.dao.IBaseDao;
import com.travel.entity.ScenicSpot;
import com.travel.mapper.ScenicSpotMapper;
import com.travel.service.IBackScenicSpotService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author:吴小富
 * @Date: 2019/12/21
 */
@Service
public class BackScenicSpotServiceImpl extends BaseServiceImpl<ScenicSpot> implements IBackScenicSpotService {

    @Autowired
    private ScenicSpotMapper scenicSpotMapper;

    @Override
    public IBaseDao<ScenicSpot> getdao() {
        return scenicSpotMapper;
    }


    @Override
    public List<ScenicSpot> getArrangeByInland(int i) {
        return scenicSpotMapper.selectByCountry(i);
    }

    @Override
    public List<ScenicSpot> getSpecialByArrange(String arrange) {
        return scenicSpotMapper.getSpotPicByArrang(arrange);
    }

    @Override
    public PageInfo<ScenicSpot> getListById(PageInfo<ScenicSpot> pageInfo, int id) {
        if(pageInfo.getPageNum()==0){
            pageInfo.setPageNum(1);
            pageInfo.setPageSize(5);
        }
        PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
        List<ScenicSpot> list = scenicSpotMapper.getListById(id);
        return new PageInfo<>(list);
    }

    @Override
    public PageInfo<ScenicSpot> getListByArrange(PageInfo<ScenicSpot> pageInfo, String arrange) {
        if(pageInfo.getPageNum()==0){
            pageInfo.setPageNum(1);
            pageInfo.setPageSize(5);
        }
        PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
        List<ScenicSpot> list = (List<ScenicSpot>) scenicSpotMapper.getSpotPicByArrang(arrange);
        return new PageInfo<>(list);
    }
}
