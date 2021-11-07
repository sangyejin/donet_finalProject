package com.pongsung.donet.event.model.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.event.model.dao.EventDao;
import com.pongsung.donet.event.model.vo.Attachment;
import com.pongsung.donet.event.model.vo.Event;
import com.pongsung.donet.event.model.vo.EventReply;

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
			throw new CommException("게시글 등록 실패");
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
	public void updateEvent(Event ev,  List<Attachment> attList) {
		// TODO Auto-generated method stub
		
		int result = eventDao.updateEvent(sqlSession, ev);
		if(result > 0) {
			for(Attachment at : attList) {
				at.setRefEventNo(result);
			}
			if(!attList.isEmpty()) {
				int result2 = eventDao.updateEventAttach(sqlSession, attList);
				if(result2 < 0) {
					throw new CommException(" 추가 사진 수정실패 ");
				}
			}
		}else {
			throw new CommException("수정 실패");
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
	public List<Attachment> selectEventAttach(int eno) {
		// TODO Auto-generated method stub
		return eventDao.selectEventAttach(sqlSession, eno);
	}

	@Override
	public int insertReply(EventReply re) {
		// TODO Auto-generated method stub
		return eventDao.insertReply(sqlSession, re);
	}

	@Override
	public ArrayList<EventReply> replyList(int eno) {
		// TODO Auto-generated method stub
		return eventDao.replyList(sqlSession, eno);
	}

	@Override
	public int replyUpdate(EventReply eventReply) {
		
		int result = eventDao.replyUpdate(sqlSession,eventReply);
		if(result < 0) {
			throw new CommException("펀딩 댓글 수정 실패");
		}
		return result;
	}

	@Override
	public int deleteReply(int replyNo) {
		int result = eventDao.deleteReply(sqlSession, replyNo);
		if(result<0) {
			throw new CommException("댓글 등록 실패");
		}
		return result;
	}

	@Override
	public List<Event> selectTopEventList() {
		// TODO Auto-generated method stub
		return eventDao.selectTopEventList(sqlSession);
	}

	

	

}
