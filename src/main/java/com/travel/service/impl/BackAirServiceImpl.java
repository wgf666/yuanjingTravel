package com.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.travel.dao.IBaseDao;
import com.travel.entity.Ari;
import com.travel.mapper.AriMapper;
import com.travel.service.IBackAirService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author:吴小富
 * @Date: 2019/12/20
 */
@Service
public class BackAirServiceImpl extends BaseServiceImpl<Ari> implements IBackAirService {

    @Autowired
    private AriMapper ariMapper;

    @Override
    public IBaseDao<Ari> getdao() {
        return ariMapper;
    }


    @Override
    public PageInfo<Ari> getAirList(PageInfo<Ari> pageInfo) {
        if(pageInfo.getPageNum()==0){
            pageInfo.setPageSize(5);
            pageInfo.setPageNum(1);
        }
        PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
        List<Ari> airInfo = ariMapper.getAirInfo();
        return new PageInfo<>(airInfo);
    }

    @Override
    public PageInfo<Ari> getAirByName(PageInfo<Ari> pageInfo, String ariName) {
        if(pageInfo.getPageNum()==0){
            pageInfo.setPageSize(5);
            pageInfo.setPageNum(1);
        }
        PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
        List<Ari> airInfo = ariMapper.getAirByName(ariName);
        return new PageInfo<>(airInfo);
    }

    @Override
    public int batchDelId(List<Integer> param) {
        return ariMapper.batchDelId(param);
    }
}
