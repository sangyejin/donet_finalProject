package com.pongsung.donet.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pongsung.donet.notice.model.dao.NoticeDao;
import com.pongsung.donet.notice.model.vo.Notice;
import com.pongsung.donet.notice.model.vo.PageInfo;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao NoDao;
	
	@Override
	public int selectNoticeListCount() {
		// TODO Auto-generated method stub
		return NoDao.selectNoticeListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		// TODO Auto-generated method stub
		return NoDao.selectNoticeList(sqlSession, pi);
	}

}
