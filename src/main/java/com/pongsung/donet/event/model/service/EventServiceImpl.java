package com.pongsung.donet.event.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.event.model.dao.EventDao;
import com.pongsung.donet.event.model.vo.Attachment;
import com.pongsung.donet.event.model.vo.Event;

@Service
public class EventServiceImpl implements EventService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private EventDao eventDao;
	
	@Override
	public int selectEventListCount() {
		// TODO Auto-generated method stub
		return eventDao.selectEventListCount(sqlSession);
	}

	@Override
	public ArrayList<Event> selectEventList(PageInfo pi) {
		// TODO Auto-generated method stub
		return eventDao.selectEventList(sqlSession, pi);
	}

	@Override
	public Event selectEvent(int eno) {
		// TODO Auto-generated method stub
		return eventDao.selectEvent(sqlSession, eno);
	}

	@Override
	public void insertEvent(Event e, Attachment at) {
		// TODO Auto-generated method stub
		if(at != null) {
			int result2 = eventDao.insertEventAttach(sqlSession, at);
		}
		
		int result = eventDao.insertEvent(sqlSession, e);
		
		if(result < 0) {
			throw new CommException("게시글 추가 실패");
		}
	}

	@Override
	public void deleteEvent(int eno) {
		// TODO Auto-generated method stub
		int result = eventDao.deleteEvent(sqlSession, eno);
		if(result < 0) {
			throw new CommException("게시글 삭제 실패");
		}
	}

	@Override
	public void updateEvent(Event ev) {
		// TODO Auto-generated method stub
		int result = eventDao.updateEvent(sqlSession, ev);
		if(result < 0) {
			throw new CommException("수정 실패 ");
		}
	}

	@Override
	public ArrayList<Event> afterList(PageInfo pi) {
		// TODO Auto-generated method stub
		return eventDao.afterList(sqlSession, pi);
	}

	@Override
	public int afterListCount() {
		// TODO Auto-generated method stub
		return eventDao.afterListCount(sqlSession);
	}

	@Override
	public Attachment selectEventAttach(int eno) {
		// TODO Auto-generated method stub
		return eventDao.selectEventAttach(sqlSession, eno);
	}

}
