package com.pongsung.donet.goods.model.service;

import java.util.List;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.goods.model.vo.Beneficiary;
import com.pongsung.donet.goods.model.vo.FilterOrder;
import com.pongsung.donet.goods.model.vo.Goods;
import com.pongsung.donet.goods.model.vo.GoodsCategory;
import com.pongsung.donet.goods.model.vo.GoodsPurchase;
import com.pongsung.donet.goods.model.vo.RequiredGoods;

public interface GoodsService {

	int selectGoodsListCount(FilterOrder filterOrder);

	List<GoodsCategory> selectGoodsCategoryList();

	List<Goods> selectGoodsList(PageInfo pi, FilterOrder filterOrder);

	void updateGoodsHitsCount(int goodsNo) throws Exception;

	Goods selectGoods(int goodsNo);

	void deleteGoods(int goodsNo) throws Exception;

	List<Beneficiary> selectBeneficiaryList();

	void insertGoods(Goods goods,List<RequiredGoods> requiredGoods) throws Exception;

	void updateGoods(Goods goods) throws Exception;

	void insertGoodsPurchase(GoodsPurchase goodsPurchase) throws Exception;

	List<Beneficiary> selectBeneficiaryListByGoodsNo(int goodsNo);

	void insertNewRequiredGoods(List<RequiredGoods> insertRequiredBeneficiary) throws Exception;

	void deleteOldequiredGoods(List<RequiredGoods> deleteRequiredBeneficiary) throws Exception;

	List<RequiredGoods> selectRequiredGoodsListByGoodsNo(int goodsNo);

	List<Goods> selectTopGoodsList();

}
