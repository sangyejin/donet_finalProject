package com.pongsung.donet.event.model.service;

import java.util.ArrayList;

import com.pongsung.donet.event.model.vo.Event;
import com.pongsung.donet.common.PageInfo;

public interface EventService {

	int selectEventListCount();

	ArrayList<Event> selectEventList(PageInfo pi);

}
