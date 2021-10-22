package com.pongsung.donet.event.model.service;

import java.util.ArrayList;

import com.pongsung.donet.event.model.vo.Event;
import com.pongsung.donet.common.PageInfo;

public interface EventService {

	int selectEventListCount();

	ArrayList<Event> selectEventList(PageInfo pi);

	Event selectEvent(int eno);

	void insertEvent(Event e);

	void deleteEvent(int eno);

	void updateEvent(Event ev);

}
