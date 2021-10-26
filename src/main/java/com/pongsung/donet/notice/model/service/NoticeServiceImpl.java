package com.pongsung.donet.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.notice.model.dao.NoticeDao;
import com.pongsung.donet.notice.model.vo.Category;
import com.pongsung.donet.notice.model.vo.Notice;
import com.pongsung.donet.notice.model.vo.Search;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao NoDao;

	@Override
	public int selectNoticeListCount(Search keyword) {
		return NoDao.selectNoticeListCount(sqlSession, keyword);
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi, Search keyword) {
		return NoDao.selectNoticeList(sqlSession, pi, keyword);
	}

	@Override
	public Notice selectThisNotice(int noticeNo){
		Notice no = null;
		
		int result = NoDao.getCount(sqlSession, noticeNo);
		
		if(result > 0) {
			System.out.println("선택된 공지사항 가지러 가는 중");
			no = NoDao.selectThisNotice(sqlSession, noticeNo);
		}else {
			throw new CommException("조회수 오류");
			
		}
		
		return no;
	}

	@Override
	public Notice selectPrevNotice(int noticeNo) {
		return NoDao.selectPrevNotice(sqlSession, noticeNo);
	}

	@Override
	public Notice selectNextNotice(int noticeNo) {
		return NoDao.selectNextNotice(sqlSession, noticeNo);
	}

	@Override
	public void deleteGo(int noticeNo) {
		int result = NoDao.deleteGo(sqlSession, noticeNo);
		
		if(result < 0) {
			throw new CommException("공지사항 삭제 실패");
		}
		
	}

	@Override
	public void insertNotice(Notice no) {
		int result = NoDao.insertNotice(sqlSession, no);

		if (result < 0) {
			throw new CommException("공지사항 추가 실패");
		}
	}

	/*
	@Override
	public void insertSaveNotice(Notice no) {
		int result = NoDao.insertSaveNotice(sqlSession, no);

		if (result < 0) {
			throw new CommException("공지사항 추가 실패");
		}
		
	}*/

	@Override
	public void updateNotice(Notice no) {
		int result = NoDao.updateNotice(sqlSession, no);
		
		if(result < 0) {
			throw new CommException("공지사항 업데이트 실패");
		}
		
	}

	/******************************************************************************************************************/
	

	@Override
	public int selectFaqListCount(Category ctgry) {
		return NoDao.selectFaqListCount(sqlSession, ctgry);

	}

	@Override
	public ArrayList<Notice> selectFaqList(PageInfo pi, Category ctgry) {
		return NoDao.selectFaqList(sqlSession, pi, ctgry);

	}
}