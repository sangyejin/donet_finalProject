package com.pongsung.donet.goods.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.goods.model.Dao.GoodsDao;
import com.pongsung.donet.goods.model.vo.Goods;
import com.pongsung.donet.goods.model.vo.GoodsCategory;

@Service
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private GoodsDao goodsDao;

	@Override
	public int selectGoodsListCount() {
		// TODO Auto-generated method stub
		return goodsDao.selectGoodsListCount(sqlSession);
	}

	@Override
	public List<GoodsCategory> selectGoodsCategoryList() {
		// TODO Auto-generated method stub
		return goodsDao.selectGoodsCategoryList(sqlSession);
	}

	@Override
	public List<Goods> selectGoodsList(PageInfo pi) {
		// TODO Auto-generated method stub
		return goodsDao.selectGoodsList(sqlSession,pi);
	}

	@Override
	public void updateGoodsHitsCount(int goodsNo) {
		int result=goodsDao.updateGoodsHitsCount(sqlSession,goodsNo);
		if(result<0) {
			throw new CommException("구호물품 조회수 카운트 실패");
		}
	}

	@Override
	public Goods selectGoods(int goodsNo) {
		// TODO Auto-generated method stub
		return goodsDao.selectGoods(sqlSession,goodsNo);
	}

	@Override
	public void deleteGoods(int goodsNo) {
		// TODO Auto-generated method stub
		int result=goodsDao.deleteGoods(sqlSession,goodsNo);
		if(result<0) {
			throw new CommException("구호물품 삭제 실패");		
		}
	}
	
}
