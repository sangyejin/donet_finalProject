package com.pongsung.donet.donation.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.donation.model.vo.Sponsor;
import com.pongsung.donet.donation.model.vo.Support;

@Repository
public class SupportDao {

	public int selectDonationListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("supportMapper.selectDonationList");
	}

	public List<Support> selectDonationList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (List)sqlSession.selectList("supportMapper.selectDonation",null,rowBounds);
	}

	public ArrayList selectDonationParticipationCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("supportMapper.selectDonationParticipationCount");
	}

	public List<Sponsor> selectSponsorList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (List)sqlSession.selectList("supportMapper.selectSponsorList",null,rowBounds);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int suNo) {
		return sqlSession.update("supportMapper.increaseCount",suNo);
	}
	
	public Support selectBoard(SqlSessionTemplate sqlSession, int suNo) {
		return sqlSession.selectOne("supportMapper.selectBoard",suNo);
	}




}