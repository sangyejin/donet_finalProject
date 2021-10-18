package com.pongsung.donet.funding.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.funding.model.dao.FundingDao;
import com.pongsung.donet.funding.model.vo.Funding;


@Service
public class FundingServiceImpl implements FundingService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FundingDao fundingDao;

	@Override
	public int selectFundingListCount() {
		int count= fundingDao.selectFundingListCount(sqlSession);
		return count;
	}
	
	@Override
	public List<Funding> selectFundingList(PageInfo pi) {
		// TODO Auto-generated method stub
		List<Funding> fundingList= fundingDao.selectFundingList(sqlSession,pi);
		
		return fundingList;
	}


}
