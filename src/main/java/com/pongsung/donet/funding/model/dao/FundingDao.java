package com.pongsung.donet.funding.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.funding.model.vo.Funding;
import com.pongsung.donet.funding.model.vo.FundingCategory;
import com.pongsung.donet.funding.model.vo.FundingFilterOrder;
import com.pongsung.donet.funding.model.vo.FundingGoods;
import com.pongsung.donet.funding.model.vo.FundingImage;
import com.pongsung.donet.funding.model.vo.FundingReply;
import com.pongsung.donet.funding.model.vo.FundingSupporter;

@Repository
public class FundingDao {

	public int selectFundingListCount(SqlSessionTemplate sqlSession,FundingFilterOrder filterOrder) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("fundingMapper.selectFundingListCount",filterOrder);
	}

	public List<Funding> selectFundingList(SqlSessionTemplate sqlSession,PageInfo pi,FundingFilterOrder filterOrder) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return sqlSession.selectList("fundingMapper.selectFundingList",filterOrder,rowBounds);
	}

	public List<FundingCategory> selectFundingCategoryList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("fundingMapper.selectFundingCategoryList");
	}

	public int insertFunding(SqlSessionTemplate sqlSession, Funding funding) {
		// TODO Auto-generated method stub
		sqlSession.insert("fundingMapper.insertFunding",funding);
		return Integer.valueOf(String.valueOf(funding.getFpNo()));
		
	}

	public int insertFundingImgList(SqlSessionTemplate sqlSession, List<FundingImage> imgList) {
		// TODO Auto-generated method stub
		return sqlSession.insert("fundingMapper.insertFundingImgList",imgList);
	}

	public int insertFundingGoodsList(SqlSessionTemplate sqlSession, List<FundingGoods> fundingGoodsList) {
		// TODO Auto-generated method stub
		return sqlSession.insert("fundingMapper.insertFundingGoodsList",fundingGoodsList);
	}

	public List<FundingGoods> selectFundingGoodsList(SqlSessionTemplate sqlSession, int fpNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("fundingMapper.selectFundingGoodsList",fpNo);
	}

	public List<FundingImage> selectFundingImageList(SqlSessionTemplate sqlSession, int fpNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("fundingMapper.selectFundingImage",fpNo);
	}

	public Funding selectFunding(SqlSessionTemplate sqlSession, int fpNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("fundingMapper.selectFunding",fpNo);
	}

	public List<FundingReply> selectFundingReplyList(SqlSessionTemplate sqlSession, int fpNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("fundingMapper.selectFundingReplyList",fpNo);
	}

	public int insertFundingReply(SqlSessionTemplate sqlSession, FundingReply fundingReply) {
		// TODO Auto-generated method stub
		return sqlSession.insert("fundingMapper.insertFundingReply",fundingReply);
	}

	public int deleteFundingReply(SqlSessionTemplate sqlSession, int replyNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("fundingMapper.deleteFundingReply",replyNo);
	}

	public int deleteFunding(SqlSessionTemplate sqlSession, int fpNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("fundingMapper.deleteFunding",fpNo);
	}

	public int updateFundingReply(SqlSessionTemplate sqlSession, FundingReply fundingReply) {
		// TODO Auto-generated method stub
		return sqlSession.update("fundingMapper.updateFundingReply",fundingReply);
	}

	public int insertFundingSupporter(SqlSessionTemplate sqlSession, FundingSupporter fundingSupporter) {
		// TODO Auto-generated method stub
		return sqlSession.insert("fundingMapper.insertFundingSupporter",fundingSupporter);
	}

	public int updateFundingHitsCount(SqlSessionTemplate sqlSession, int fpNo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("fundingMapper.updateFundingHitsCount",fpNo);
	}

	public List<Funding> selectTopFundingList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("fundingMapper.selectTopFundingList");
	}

}
