package com.travel.service;

import com.github.pagehelper.PageInfo;
import com.travel.entity.Ari;

import java.util.List;

/**
 * @author:吴小富
 * @Date: 2019/12/20
 */
public interface IBackAirService extends IBaseService<Ari> {
    PageInfo<Ari> getAirList(PageInfo<Ari> pageInfo);

    PageInfo<Ari> getAirByName(PageInfo<Ari> pageInfo, String ariName);

    int batchDelId(List<Integer> param);
}
