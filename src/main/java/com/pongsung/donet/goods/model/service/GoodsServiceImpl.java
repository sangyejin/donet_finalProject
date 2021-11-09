package com.pongsung.donet.goods.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.goods.model.Dao.GoodsDao;
import com.pongsung.donet.goods.model.vo.Beneficiary;
import com.pongsung.donet.goods.model.vo.FilterOrder;
import com.pongsung.donet.goods.model.vo.Goods;
import com.pongsung.donet.goods.model.vo.GoodsCategory;
import com.pongsung.donet.goods.model.vo.GoodsPurchase;
import com.pongsung.donet.goods.model.vo.RequiredGoods;

@Service
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private GoodsDao goodsDao;

	@Override
	public int selectGoodsListCount(FilterOrder filterOrder) {
		// TODO Auto-generated method stub
		return goodsDao.selectGoodsListCount(sqlSession,filterOrder);
	}

	@Override
	public List<GoodsCategory> selectGoodsCategoryList() {
		// TODO Auto-generated method stub
		return goodsDao.selectGoodsCategoryList(sqlSession);
	}

	@Override
	public List<Goods> selectGoodsList(PageInfo pi, FilterOrder filterOrder) {
		// TODO Auto-generated method stub
		return goodsDao.selectGoodsList(sqlSession, pi, filterOrder);
	}

	@Override
	public void updateGoodsHitsCount(int goodsNo) throws Exception{
		int result=goodsDao.updateGoodsHitsCount(sqlSession,goodsNo);
		if(result<0) {
			throw new Exception("구호물품 조회수 카운트 실패");
		}
	}

	@Override
	public Goods selectGoods(int goodsNo) {
		// TODO Auto-generated method stub
		return goodsDao.selectGoods(sqlSession,goodsNo);
	}

	@Override
	public void deleteGoods(int goodsNo) throws Exception {
		// TODO Auto-generated method stub
		int result=goodsDao.deleteGoods(sqlSession,goodsNo);
		if(result<0) {
			throw new Exception("구호물품 삭제 실패");		
		}
	}

	@Override
	public List<Beneficiary> selectBeneficiaryList() {
		// TODO Auto-generated method stub
		return goodsDao.selectBeneficiaryList(sqlSession);
	}

	@Override
	public void insertGoods(Goods goods,List<RequiredGoods> requiredGoods)throws Exception {
		int goodsNo=goodsDao.insertGoods(sqlSession,goods);
		if(goodsNo<0) {
			throw new CommException("구호물품 등록 실패");		
		}else {
			System.out.println("requiredGoods::::::::::::::"+requiredGoods);
			System.out.println("goodsNo::::::::::::::"+goodsNo);
			for(int i=0; i<requiredGoods.size();i++) {
				requiredGoods.get(i).setGoodsNo(goodsNo);
			}
			System.out.println("requiredGoods22222222::::::::::::::"+requiredGoods);

			int result=goodsDao.insertRequiredGoods(sqlSession,requiredGoods);
			if(result<0) {
				throw new Exception("구호물품 요구 후원처 등록 실패");		
			}	
		}
	}

	@Override
	public void updateGoods(Goods goods) throws Exception{
		// TODO Auto-generated method stub
		int result=goodsDao.updateGoods(sqlSession,goods);
		if(result<0) {
			throw new Exception("구호물품 삭제 실패");		
		}
	}

	@Override
	public void insertGoodsPurchase(GoodsPurchase goodsPurchase)throws Exception {
		// TODO Auto-generated method stub
		int result=goodsDao.insertGoodsPurchase(sqlSession,goodsPurchase);
		if(result<0) {
			throw new Exception("구호물품 삭제 실패");		
		}
	}

	@Override
	public List<Beneficiary> selectBeneficiaryListByGoodsNo(int goodsNo){
		// TODO Auto-generated method stub
		return goodsDao.selectBeneficiaryListByGoodsNo(sqlSession,goodsNo);
	}

	@Override
	public void insertNewRequiredGoods(List<RequiredGoods> insertRequiredBeneficiary) throws Exception{
		// TODO Auto-generated method stub
		int result=goodsDao.insertNewRequiredGoods(sqlSession,insertRequiredBeneficiary);
		if(result<0) {
			throw new Exception("구호물품 삭제 실패");		
		}
	}

	@Override
	public void deleteOldequiredGoods(List<RequiredGoods> deleteRequiredBeneficiary) throws Exception{
		// TODO Auto-generated method stub
		int result=goodsDao.deleteOldequiredGoods(sqlSession,deleteRequiredBeneficiary);
		if(result<0) {
			throw new Exception("구호물품 삭제 실패");		
		}
	}

	@Override
	public List<RequiredGoods> selectRequiredGoodsListByGoodsNo(int goodsNo) {
		// TODO Auto-generated method stub
		return goodsDao.selectRequiredGoodsListByGoodsNo(sqlSession,goodsNo);
	}

	@Override
	public List<Goods> selectTopGoodsList() {
		// TODO Auto-generated method stub
		return goodsDao.selectTopGoodsList(sqlSession);
	}


	
}
