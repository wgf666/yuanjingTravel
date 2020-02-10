package com.travel.mapper;

import com.github.pagehelper.PageInfo;
import com.travel.dao.IBaseDao;
import com.travel.entity.ScenicSpot;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ScenicSpotMapper extends IBaseDao<ScenicSpot>{
    int deleteByPrimaryKey(Integer id);

    int insert(ScenicSpot record);

    int insertSelective(ScenicSpot record);

    ScenicSpot selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ScenicSpot record);

    int updateByPrimaryKey(ScenicSpot record);

    List<ScenicSpot> selectByCountry(int county);

    List<ScenicSpot> selectByPulish(int publish);

    List<ScenicSpot>  getSpotPicByArrang(String arrang);

    List<ScenicSpot> getListById(int id);

    List<ScenicSpot> search(@Param("county") Integer county,@Param("special") String special);
}