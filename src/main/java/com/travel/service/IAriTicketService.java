package com.travel.service;

import com.travel.entity.Ari;
import com.travel.entity.AriTicketOrder;

import java.util.List;

public interface IAriTicketService extends IBaseService<AriTicketOrder>{
    List<Ari> getAirInfo();
}
