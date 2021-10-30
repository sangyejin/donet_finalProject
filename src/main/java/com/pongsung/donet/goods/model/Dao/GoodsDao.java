package com.pongsung.donet.goods.model.Dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.goods.model.vo.Goods;
import com.pongsung.donet.goods.model.vo.GoodsCategory;

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

}
