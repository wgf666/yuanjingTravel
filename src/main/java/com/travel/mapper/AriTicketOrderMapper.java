package com.travel.mapper;

import com.travel.dao.IBaseDao;
import com.travel.entity.Ari;
import com.travel.entity.AriTicketOrder;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AriTicketOrderMapper extends IBaseDao<AriTicketOrder>{
    List<Ari> getAirInfo();
}