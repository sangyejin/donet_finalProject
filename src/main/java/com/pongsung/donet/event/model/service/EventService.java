package com.pongsung.donet.event.model.service;

import java.util.ArrayList;
import java.util.List;

import com.pongsung.donet.event.model.vo.Attachment;
import com.pongsung.donet.event.model.vo.Event;
import com.pongsung.donet.event.model.vo.EventReply;
import com.pongsung.donet.common.PageInfo;

public interface EventService {

	int selectEventListCount();

	ArrayList<Event> selectEventList(PageInfo pi);

	ArrayList<Event> afterList(PageInfo pi);

	int afterListCount();

	Event selectEvent(int eno);

	void insertEvent(Event e, List<Attachment> attList);

	void deleteEvent(int eno);

	List<Attachment> selectEventAttach(int eno);

	int insertReply(EventReply re);

	ArrayList<EventReply> replyList(int eno);

	void updateEvent(Event e, List<Attachment> attList);

	int replyUpdate(EventReply eventReply);

	int deleteReply(int replyNo);


}
