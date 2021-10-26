package com.pongsung.donet.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pongsung.donet.notice.model.vo.Category;
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

	public int getCount(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.getCount", noticeNo);
	}

	public Notice selectThisNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectThisNotice", noticeNo);
	}

	public Notice selectPrevNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectPrevNotice", noticeNo);
	}

	public Notice selectNextNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectNextNotice", noticeNo);
	}

	public int deleteGo(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.deleteGo", noticeNo);

	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice no) {
		return sqlSession.insert("noticeMapper.insertNotice", no);

	}

	/*
	public int insertSaveNotice(SqlSessionTemplate sqlSession, Notice no) {
		return sqlSession.insert("noticeMapper.insertSaveNotice", no);

	}*/

	public int updateNotice(SqlSessionTemplate sqlSession, Notice no) {
		return sqlSession.update("noticeMapper.updateNotice", no);
	}

	/******************************************************************************************************************/
	
	public int selectFaqListCount(SqlSessionTemplate sqlSession, Category ctgry) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Notice> selectFaqList(SqlSessionTemplate sqlSession, PageInfo pi, Category ctgry) {
		// TODO Auto-generated method stub
		return null;
	}

}