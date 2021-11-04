package com.pongsung.donet.event.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pongsung.donet.event.model.vo.Attachment;
import com.pongsung.donet.event.model.vo.Event;
import com.pongsung.donet.event.model.vo.EventReply;
import com.pongsung.donet.common.PageInfo;

@Repository
public class EventDao {

	public int selectEventListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("eventMapper.selectEventListCount");
	}

	public ArrayList<Event> selectEventList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("eventMapper.selectEventList", null, rowBounds);
	}

	public Event selectEvent(SqlSessionTemplate sqlSession, int eno) {
		return sqlSession.selectOne("eventMapper.selectEvent", eno);
	}

	public int insertEvent(SqlSessionTemplate sqlSession, Event e) {
		return sqlSession.insert("eventMapper.insertEvent", e);
		
	}

	public int deleteEvent(SqlSessionTemplate sqlSession, int eno) {
		// TODO Auto-generated method stub
		return sqlSession.update("eventMapper.deleteEvent", eno);
	}

	public int updateEvent(SqlSessionTemplate sqlSession, Event e) {
		// TODO Auto-generated method stub
		return sqlSession.update("eventMapper.updateEvent", e);
	}

	public int afterListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("eventMapper.afterListCount");
	}

	public ArrayList<Event> afterList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("eventMapper.afterList", null, rowBounds);
	}

	public int insertEventAttach(SqlSessionTemplate sqlSession, List<Attachment> attList) {
		// TODO Auto-generated method stub
		return sqlSession.insert("eventMapper.insertEventAttach", attList);
	}

	public List<Attachment> selectEventAttach(SqlSessionTemplate sqlSession, int eno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("eventMapper.selectEventAttach", eno);
	}

	public int insertReply(SqlSessionTemplate sqlSession, EventReply re) {
		// TODO Auto-generated method stub
		return sqlSession.insert("eventMapper.insertReply", re);
	}

	public ArrayList<EventReply> replyList(SqlSessionTemplate sqlSession, int eno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("eventMapper.replyList", eno);
	}

	public int updateEventAttach(SqlSessionTemplate sqlSession, List<Attachment> attList) {
		// TODO Auto-generated method stub
		return sqlSession.update("eventMapper.updateEventAttach", attList);
	}

	public int replyUpdate(SqlSessionTemplate sqlSession, EventReply eventReply) {
		// TODO Auto-generated method stub
		return sqlSession.update("eventMapper.replyUpdate", eventReply);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("eventMapper.deleteReply", replyNo);
	}

}
