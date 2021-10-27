package com.pongsung.donet.donation.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.donation.model.vo.Sponsor;
import com.pongsung.donet.donation.model.vo.SupporComment;
import com.pongsung.donet.donation.model.vo.Support;
import com.pongsung.donet.donation.model.vo.SupportUsePlan;

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



	public int increaseCount(SqlSessionTemplate sqlSession, int suNo) {
		return sqlSession.update("supportMapper.increaseCount",suNo);
	}
	
	public Support selectBoard(SqlSessionTemplate sqlSession, int suNo) {
		return sqlSession.selectOne("supportMapper.selectBoard",suNo);
	}

	public List<SupportUsePlan> selectSupportUsePlan(SqlSessionTemplate sqlSession, int suNo) {
		return sqlSession.selectList("supportMapper.selectSupportUsePlan",suNo);
	}

	public Sponsor selectSponsor(SqlSessionTemplate sqlSession, int suNo) {
		return sqlSession.selectOne("supportMapper.selectSponsor",suNo);
	}

	public List<SupporComment> selectSupporComment(SqlSessionTemplate sqlSession, int suNo) {
		return sqlSession.selectList("supportMapper.selectSupporComment",suNo);
	}

	public List<Sponsor> selectSponsorList(SqlSessionTemplate sqlSession, int suNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("supportMapper.selectSponsorList",suNo);
	}

	public int insertReply(SqlSessionTemplate sqlSession, SupporComment sc) {
		return sqlSession.insert("boardMapper.insertReply", sc);
	}

//	public int selectGolbalListCount(SqlSessionTemplate sqlSession, int categoryNo) {
//		return sqlSession.selectOne("supportMapper.selectGolbalListCount");
//	}
//
//	public List<Support> selectGlobalList(SqlSessionTemplate sqlSession, PageInfo pi,int categoryNo) {
//		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
//		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
//		
//		return (List)sqlSession.selectList("supportMapper.selectGlobalList",null,rowBounds,categoryNo);
//	}
	
	





}
