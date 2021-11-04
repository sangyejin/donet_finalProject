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
import com.pongsung.donet.donation.model.vo.SupportCategory;
import com.pongsung.donet.donation.model.vo.SupportFilter;
import com.pongsung.donet.donation.model.vo.SupportImage;
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
		return sqlSession.selectList("supportMapper.selectSponsorList",suNo);
	}
	
	public List<SupportImage> selectImageList(SqlSessionTemplate sqlSession, int suNo) {
		return sqlSession.selectList("supportMapper.selectImageList",suNo);
	}

	public int insertReply(SqlSessionTemplate sqlSession, SupporComment sc) {
		return sqlSession.insert("supportMapper.insertReply", sc);
	}

	public ArrayList<SupporComment> selectReplyList(SqlSessionTemplate sqlSession, int suNo) {
		return (ArrayList)sqlSession.selectList("supportMapper.selectReplyList", suNo);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("supportMapper.deleteReply",replyNo);
	}

	public int selectCategoryListCount(SqlSessionTemplate sqlSession, int suCategoryNo) {
		return sqlSession.selectOne("supportMapper.selectCategoryListCount", suCategoryNo);
	}

	public List<Support> selectCategoryList(SqlSessionTemplate sqlSession, int suCategoryNo) {
		return sqlSession.selectList("supportMapper.selectCategoryList",suCategoryNo);
	}

	public int updateReply(SqlSessionTemplate sqlSession, SupporComment sc) {
		return sqlSession.update("supportMapper.updateReply",sc);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Support support) {
		sqlSession.insert("supportMapper.insertBoard",support);
		return Integer.valueOf(String.valueOf(support.getSuNo()));
	}

	public int insertImgList(SqlSessionTemplate sqlSession, List<SupportImage> imgList) {
		return sqlSession.insert("supportMapper.insertImgList",imgList);
	}

	public int insertUsePlan(SqlSessionTemplate sqlSession, List<SupportUsePlan> list) {
		return sqlSession.insert("supportMapper.insertUsePlan",list);
	}

	public int selectDonationCaListCount(SqlSessionTemplate sqlSession, SupportCategory suCategory) {
		return sqlSession.selectOne("supportMapper.selectDonationCaListCount", suCategory);
	}

	public List<Support> selectDonationCaList(SqlSessionTemplate sqlSession, PageInfo pi, SupportCategory suCategory) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (List)sqlSession.selectList("supportMapper.selectDonationCaList", suCategory, rowBounds);
	}

	public int selectDonationOrListCount(SqlSessionTemplate sqlSession, SupportFilter supportFilter) {
		return sqlSession.selectOne("supportMapper.selectDonationOrListCount", supportFilter);
	}

	public List<Support> selectDonationOrList(SqlSessionTemplate sqlSession, PageInfo pi, SupportFilter supportFilter) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (List)sqlSession.selectList("supportMapper.selectDonationOrList", supportFilter, rowBounds);
	}

	public Support selectSupport(SqlSessionTemplate sqlSession, int suNo) {
		return sqlSession.selectOne("supportMapper.selectSupport",suNo);
	}

	public int insertSupportCharity(SqlSessionTemplate sqlSession, Sponsor s) {
		return sqlSession.insert("supportMapper.insertSupportCharity", s);
	}

	public int updatePoints(SqlSessionTemplate sqlSession, int points) {
		return sqlSession.update("memberMapper.updatePoints",points);
	}





	
	





}
