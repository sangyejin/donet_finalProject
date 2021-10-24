package com.pongsung.donet.donation.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.donation.model.dao.SupportDao;
import com.pongsung.donet.donation.model.vo.Sponsor;
import com.pongsung.donet.donation.model.vo.Support;

@Service
public class DonationServiceImpl implements DonationService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SupportDao supportDao;
	
	@Override
	public int selectDonationListCount() {
		return supportDao.selectDonationListCount(sqlSession);
	}

	@Override
	public List<Support> selectDonationList(PageInfo pi) {
		return supportDao.selectDonationList(sqlSession,pi);
	}

	@Override
	public ArrayList selectDonationParticipationCount() {
		return supportDao.selectDonationParticipationCount(sqlSession);
	}

	@Override
	public List<Sponsor> selectSponsorList(PageInfo pi) {
		return supportDao.selectSponsorList(sqlSession,pi);
	}

	@Override
	public Support selectDonation(int suNo) {
		Support s = null;
		int result = supportDao.increaseCount(sqlSession, suNo);
		
		if (result < 0) {
			throw new CommException("조회수 증가 실패");
		} else {
			s = supportDao.selectBoard(sqlSession, suNo);
		}

		return s;
	}

}
