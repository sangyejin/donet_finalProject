package com.pongsung.donet.event.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.pongsung.donet.event.model.vo.Attachment;
import com.pongsung.donet.event.model.vo.Event;
import com.pongsung.donet.event.model.vo.EventReply;
import com.pongsung.donet.volunteer.model.vo.Volunteer;
import com.google.gson.JsonObject;
import com.pongsung.donet.common.PageInfo;

public interface EventService {

	int selectEventListCount();

	ArrayList<Event> selectEventList(PageInfo pi);

	ArrayList<Event> afterList(PageInfo pi);

	int afterListCount();

	Event selectEvent(int eno);

	void insertEvent(Event e);

	void deleteEvent(int eno);

	

	int insertReply(EventReply re);

	ArrayList<EventReply> replyList(int eno);

	void updateEvent(Event e);

	int replyUpdate(EventReply eventReply);

	int deleteReply(int replyNo);


	ArrayList<Volunteer> searchList(PageInfo pi, String keyword);

	List<Event> selectTopEventList();




}
