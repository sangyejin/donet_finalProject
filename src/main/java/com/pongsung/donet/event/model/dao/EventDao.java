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
		// TODO Auto-generated method stub
		return sqlSession.selectOne("eventMapper.selectEventListCount");
	}

	public ArrayList<Event> selectEventList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("eventMapper.selectEventList", null, rowBounds);
	}

}
