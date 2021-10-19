package com.pongsung.donet.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pongsung.donet.notice.model.dao.NoticeDao;
import com.pongsung.donet.notice.model.vo.Notice;
import com.pongsung.donet.notice.model.vo.Search;
import com.pongsung.donet.common.PageInfo;

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

	

}
