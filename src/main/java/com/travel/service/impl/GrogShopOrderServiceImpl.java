package com.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.travel.dao.IBaseDao;
import com.travel.entity.GrogshopOrder;
import com.travel.mapper.GrogshopOrderMapper;
import com.travel.service.IGrogShopOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author:吴小富
 * @Date: 2019/12/18
 */
@Service
public class GrogShopOrderServiceImpl extends BaseServiceImpl<GrogshopOrder> implements IGrogShopOrderService {

    @Autowired
    private GrogshopOrderMapper grogshopOrderMapper;

    @Override
    public IBaseDao<GrogshopOrder> getdao() {
        return grogshopOrderMapper;
    }

    @Override
    public PageInfo<GrogshopOrder> getList(PageInfo<GrogshopOrder> pageInfo, int status) {
        if(pageInfo.getPageNum()==0){
            pageInfo.setPageSize(5);
            pageInfo.setPageNum(1);
        }

        PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
        List<GrogshopOrder> list=grogshopOrderMapper.getList(status);
        return new PageInfo<>(list);
    }

    @Override
    public GrogshopOrder getHotelById(int id) {
        return grogshopOrderMapper.getHotelById(id);
    }

    @Override
    public PageInfo<GrogshopOrder> selectByCondition(PageInfo<GrogshopOrder> pageInfo, String name, int status) {
        if(pageInfo.getPageNum()==0){
            pageInfo.setPageSize(5);
            pageInfo.setPageNum(1);
        }

        PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
        List<GrogshopOrder> list=grogshopOrderMapper.getHotelByName(name,status);
        return new PageInfo<>(list);
    }

    @Override
    public int updateByStatus(int id) {
        return grogshopOrderMapper.updateByStatus(id);
    }

    @Override
    public int batchDelId(List<Integer> param) {
        return grogshopOrderMapper.batchDelId(param);
    }


}
