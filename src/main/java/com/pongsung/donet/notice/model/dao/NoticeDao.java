package com.pongsung.donet.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pongsung.donet.notice.model.vo.Ask;
import com.pongsung.donet.notice.model.vo.Category;
import com.pongsung.donet.notice.model.vo.FrequentlyAskedQuestions;
import com.pongsung.donet.notice.model.vo.Notice;
import com.pongsung.donet.notice.model.vo.Search;
import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.member.model.vo.Member;

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
		return sqlSession.selectOne("noticeMapper.selectFaqListCount", ctgry);

	}

	public ArrayList<FrequentlyAskedQuestions> selectFaqList(SqlSessionTemplate sqlSession, PageInfo pi, Category ctgry) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		System.out.println("offset : " + offset);
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		System.out.println("rowBounds : " + rowBounds);

		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectFaqList", ctgry, rowBounds);
	}

	public int insertFaq(SqlSessionTemplate sqlSession, FrequentlyAskedQuestions faq) {
		return sqlSession.insert("noticeMapper.insertFaq", faq);

	}

	public FrequentlyAskedQuestions selectThisFaq(SqlSessionTemplate sqlSession, int faqNo) {
		return sqlSession.selectOne("noticeMapper.selectThisFaq", faqNo);

	}

	public int updateFaq(SqlSessionTemplate sqlSession, FrequentlyAskedQuestions faq) {
		return sqlSession.update("noticeMapper.updateFaq", faq);

	}

	public int deleteFaq(SqlSessionTemplate sqlSession, int faqNo) {
		return sqlSession.delete("noticeMapper.deleteFaq", faqNo);
	}
	
	
	/******************************************************************************************************************/


	public int selectOneListCount(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.selectOne("noticeMapper.selectOneListCount", loginUser);

	}

	public ArrayList<Ask> selectOneList(SqlSessionTemplate sqlSession, PageInfo pi,Member loginUser) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		System.out.println("offset : " + offset);
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		System.out.println("rowBounds : " + rowBounds);

		return (ArrayList)sqlSession.selectList("noticeMapper.selectOneList",loginUser, rowBounds);
	}

	public int insertOne(SqlSessionTemplate sqlSession, Ask ask) {
		System.out.println("ask : " + ask);

		return sqlSession.insert("noticeMapper.insertOne", ask);

	}

	public Ask selectThisAsk(SqlSessionTemplate sqlSession, int askNo) {
		return sqlSession.selectOne("noticeMapper.selectThisAsk", askNo);

	}

	public int updateOne(SqlSessionTemplate sqlSession, Ask ask) {
		return sqlSession.update("noticeMapper.updateOne", ask);

	}

	public int deleteOne(SqlSessionTemplate sqlSession, int askNo) {
		return sqlSession.delete("noticeMapper.deleteOne", askNo);

	}

}










