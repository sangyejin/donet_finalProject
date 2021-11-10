package com.pongsung.donet.introduce.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pongsung.donet.donation.model.vo.Sponsor;
import com.pongsung.donet.introduce.model.vo.ChartFunding;
import com.pongsung.donet.introduce.model.vo.ChartSupport;

@Repository
public class ChartDao {

	public List<ChartSupport> selectDonation(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("chartMapper.selectDonation");
	}

	public List<ChartFunding> selectSponsor(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("chartMapper.selectSponsor");
	}
	
	
}
