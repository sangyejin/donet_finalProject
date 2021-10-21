package com.pongsung.donet.funding.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.funding.model.vo.Funding;
import com.pongsung.donet.funding.model.vo.FundingCategory;
import com.pongsung.donet.funding.model.vo.FundingGoods;
import com.pongsung.donet.funding.model.vo.FundingImage;

@Repository
public class FundingDao {

	public int selectFundingListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("fundingMapper.selectFundingListCount");
	}

	public List<Funding> selectFundingList(SqlSessionTemplate sqlSession,PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return sqlSession.selectList("fundingMapper.selectFundingList",null,rowBounds);
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

}
