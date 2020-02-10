package com.travel.service.impl;

import com.travel.dao.IBaseDao;
import com.travel.entity.Ari;
import com.travel.entity.AriTicketOrder;
import com.travel.mapper.AriMapper;
import com.travel.mapper.AriTicketOrderMapper;
import com.travel.service.IAriTicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AriTicketServiceImpl extends BaseServiceImpl<AriTicketOrder> implements IAriTicketService {
    @Autowired
    private AriTicketOrderMapper ariTicketOrderMapper;
    @Autowired
    private AriMapper ariMapper;

    @Override
    public IBaseDao<AriTicketOrder> getdao() {
        return ariTicketOrderMapper;
    }

    @Override
    public List<Ari> getAirInfo() {
        return ariMapper.getAirInfo();
    }
}
