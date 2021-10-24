package com.pongsung.donet.event.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pongsung.donet.event.model.dao.EventDao;
import com.pongsung.donet.event.model.vo.Event;
import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.exception.CommException;

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
	public void insertEvent(Event e) {
		// TODO Auto-generated method stub
		int result = eventDao.insertEvent(sqlSession, e);
		if(result < 0) {
			throw new CommException("게시글 추가 실패");
		}
	}

}
