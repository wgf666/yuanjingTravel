package com.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.travel.dao.IBaseDao;
import com.travel.entity.Grogshop;
import com.travel.mapper.GrogshopMapper;
import com.travel.service.IGrogShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author:吴小富
 * @Date: 2019/12/18
 */
@Service
public class GrogShopServiceImpl extends BaseServiceImpl<Grogshop> implements IGrogShopService {

    @Autowired
    private GrogshopMapper grogshopMapper;

    @Override
    public IBaseDao<Grogshop> getdao() {
        return grogshopMapper;
    }

    @Override
    public List<Grogshop> getGrogShop() {
        return grogshopMapper.getGrogShop();
    }

    @Override
    public PageInfo<Grogshop> getHotelList(PageInfo<Grogshop> pageInfo) {
        if(pageInfo.getPageNum()==0){
            pageInfo.setPageNum(1);
            pageInfo.setPageSize(5);
        }
        PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
        List<Grogshop> list = grogshopMapper.getGrogShop();

        return new PageInfo<>(list);
    }

    @Override
    public PageInfo<Grogshop> selectByCondition(PageInfo<Grogshop> pageInfo,String cityName) {
        if(pageInfo.getPageNum()==0){
            pageInfo.setPageNum(1);
            pageInfo.setPageSize(5);
        }
        PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
        List<Grogshop> list=grogshopMapper.selectByCondition(cityName);
        return new PageInfo<>(list);
    }

    @Override
    public int batchDelId(List<Integer> param) {
        return grogshopMapper.batchDelId(param);
    }
}
