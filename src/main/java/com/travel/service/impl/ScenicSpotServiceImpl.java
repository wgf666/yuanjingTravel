package com.travel.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.travel.dao.IBaseDao;
import com.travel.entity.ScenicSpot;
import com.travel.mapper.ScenicSpotMapper;
import com.travel.service.IScenicSpotService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScenicSpotServiceImpl extends BaseServiceImpl<ScenicSpot> implements IScenicSpotService{
  @Autowired
  private ScenicSpotMapper scenicSpotMapper;

    @Override
    public IBaseDao<ScenicSpot> getdao() {
        return scenicSpotMapper;
    }

    @Override
    public List<ScenicSpot> getSpotPicByType(int country) {
        return scenicSpotMapper.selectByCountry(country);
    }

    @Override
    public List<ScenicSpot> getSpotPicByPublish(int publish) {
        return scenicSpotMapper.selectByPulish(publish);
    }

    @Override
    public PageInfo<ScenicSpot> getSpotPicByArrang(PageInfo<ScenicSpot> pageInfo, String arrang) {

        if(pageInfo.getPageNum()==0){
            pageInfo.setPageNum(1);
            pageInfo.setPageSize(5);
        }
        PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
        List<ScenicSpot> page = scenicSpotMapper.getSpotPicByArrang(arrang);

        return new PageInfo<>(page);
    }


    @Override
    public PageInfo<ScenicSpot> search(PageInfo<ScenicSpot> pageInfo,Integer county, String special) {
        if(pageInfo.getPageNum()==0){
            pageInfo.setPageNum(1);
            pageInfo.setPageSize(5);
        }

         PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());
        List<ScenicSpot> page = scenicSpotMapper.search(county,special);
        return new PageInfo<>(page);
    }


}
