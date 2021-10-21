package com.pongsung.donet.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.notice.model.dao.NoticeDao;
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
			System.out.println("선택된 게시글 가지러 가는 중");
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

	

}
