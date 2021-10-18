package com.pongsung.donet.funding.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.funding.model.dao.FundingDao;
import com.pongsung.donet.funding.model.vo.Funding;
import com.pongsung.donet.funding.model.vo.FundingCategory;


@Service
public class FundingServiceImpl implements FundingService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FundingDao fundingDao;

	@Override
	public int selectFundingListCount() {
		return fundingDao.selectFundingListCount(sqlSession);
	}
	
	@Override
	public List<Funding> selectFundingList(PageInfo pi) {
		// TODO Auto-generated method stub
		return fundingDao.selectFundingList(sqlSession,pi);
	}

	@Override
	public List<FundingCategory> selectFundingCategoryList() {
		// TODO Auto-generated method stub
		return fundingDao.selectFundingCategoryList(sqlSession);
	}


}
