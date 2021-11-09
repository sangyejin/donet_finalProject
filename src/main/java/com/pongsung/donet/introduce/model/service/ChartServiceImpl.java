package com.pongsung.donet.introduce.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pongsung.donet.donation.model.vo.Sponsor;
import com.pongsung.donet.introduce.model.dao.ChartDao;
import com.pongsung.donet.introduce.model.vo.ChartFunding;
import com.pongsung.donet.introduce.model.vo.ChartSupport;

@Service
public class ChartServiceImpl implements ChartService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChartDao chartDao;

	@Override
	public List<ChartSupport> selectDonation() {
		return chartDao.selectDonation(sqlSession);
	}

	@Override
	public List<ChartFunding> selectSponsor() {
		return chartDao.selectSponsor(sqlSession);
	}
	
	

}
