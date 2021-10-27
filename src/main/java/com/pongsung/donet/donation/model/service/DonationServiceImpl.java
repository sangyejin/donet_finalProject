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
import com.pongsung.donet.donation.model.vo.SupporComment;
import com.pongsung.donet.donation.model.vo.Support;
import com.pongsung.donet.donation.model.vo.SupportUsePlan;

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

	@Override
	public List<SupportUsePlan> selectSupportUsePlan(int suNo) {
		return supportDao.selectSupportUsePlan(sqlSession, suNo);
	}

	@Override
	public Sponsor selectSponsor(int suNo) {
		return supportDao.selectSponsor(sqlSession, suNo);
	}

	@Override
	public List<SupporComment> selectSupporComment(int suNo) {
		return supportDao.selectSupporComment(sqlSession, suNo);
	}

	@Override
	public List<Sponsor> selectSponsorList(int suNo) {
		return supportDao.selectSponsorList(sqlSession, suNo);
	}

	@Override
	public int insertReply(SupporComment sc) {
		int result = supportDao.insertReply(sqlSession, sc);

		if (result < 0) {
			throw new CommException("Reply 추가 실패");
		}
		
		return result;
	}

//	@Override
//	public int selectGolbalListCount(int categoryNo) {
//		return supportDao.selectGolbalListCount(sqlSession, categoryNo);
//	}
//
//	@Override
//	public List<Support> selectGlobalList(PageInfo pi, int categoryNo) {
//		return supportDao.selectGlobalList(sqlSession,pi,categoryNo);
//	}



}
