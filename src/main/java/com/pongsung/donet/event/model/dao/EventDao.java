package com.pongsung.donet.event.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pongsung.donet.event.model.vo.Event;
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

	public int updateEvent(SqlSessionTemplate sqlSession, Event ev) {
		// TODO Auto-generated method stub
		return sqlSession.update("eventMapper.updateEvent", ev);
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

}
