package com.pongsung.donet.goods.model.Dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.goods.model.vo.Beneficiary;
import com.pongsung.donet.goods.model.vo.Goods;
import com.pongsung.donet.goods.model.vo.GoodsCategory;
import com.pongsung.donet.goods.model.vo.RequiredGoods;

@Repository
public class GoodsDao {

	public int selectGoodsListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("goodsMapper.selectGoodsListCount");
	}

	public List<GoodsCategory> selectGoodsCategoryList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goodsMapper.selectGoodsCategoryList");
	}

	public List<Goods> selectGoodsList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goodsMapper.selectGoodsList");
	}

	public int updateGoodsHitsCount(SqlSessionTemplate sqlSession, int goodsNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("goodsMapper.updateGoodsHitsCount",goodsNo);
	}

	public Goods selectGoods(SqlSessionTemplate sqlSession, int goodsNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("goodsMapper.selectGoods",goodsNo);
	}

	public int deleteGoods(SqlSessionTemplate sqlSession, int goodsNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("goodsMapper.deleteGoods",goodsNo);
	}

	public List<Beneficiary> selectBeneficiaryList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goodsMapper.selectBeneficiaryList");
	}

	public int insertGoods(SqlSessionTemplate sqlSession, Goods goods) {
		// TODO Auto-generated method stub
		sqlSession.insert("goodsMapper.insertGoods",goods);
		return Integer.valueOf(String.valueOf(goods.getGoodsNo()));
	}

	public int insertRequiredGoods(SqlSessionTemplate sqlSession, List<RequiredGoods> requiredGoods) {
		// TODO Auto-generated method stub
		return sqlSession.insert("goodsMapper.insertRequiredGoods",requiredGoods);
		
	}

	public int updateGoods(SqlSessionTemplate sqlSession, Goods goods) {
		// TODO Auto-generated method stub
		return sqlSession.update("goodsMapper.updateGoods",goods);
	}

}
