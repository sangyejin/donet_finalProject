package com.pongsung.donet.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pongsung.donet.notice.model.vo.Notice;
import com.pongsung.donet.notice.model.vo.Search;
import com.pongsung.donet.common.PageInfo;

@Repository
public class NoticeDao {

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi, Search keyword) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		System.out.println("offset : " + offset);
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		System.out.println("rowBounds : " + rowBounds);

		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeList", keyword, rowBounds);
	}

	public int selectNoticeListCount(SqlSessionTemplate sqlSession, Search keyword) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.selectNoticeListCount", keyword);
	}

}
