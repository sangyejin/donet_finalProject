package com.pongsung.donet.event.model.service;

import java.util.ArrayList;

import com.pongsung.donet.event.model.vo.Attachment;
import com.pongsung.donet.event.model.vo.Event;
import com.pongsung.donet.common.PageInfo;

public interface EventService {

	int selectEventListCount();

	ArrayList<Event> selectEventList(PageInfo pi);

	ArrayList<Event> afterList(PageInfo pi);

	int afterListCount();

	Event selectEvent(int eno);

	void insertEvent(Event e, Attachment at);

	void updateEvent(Event ev);

	void deleteEvent(int eno);

	Attachment selectEventAttach(int eno);

}
