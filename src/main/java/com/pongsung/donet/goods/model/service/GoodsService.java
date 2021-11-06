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

	void updateGoodsHitsCount(int goodsNo);

	Goods selectGoods(int goodsNo);

	void deleteGoods(int goodsNo);

	List<Beneficiary> selectBeneficiaryList();

	void insertGoods(Goods goods,List<RequiredGoods> requiredGoods);

	void updateGoods(Goods goods);

	void insertGoodsPurchase(GoodsPurchase goodsPurchase);

	List<Beneficiary> selectBeneficiaryListByGoodsNo(int goodsNo);

	void insertNewRequiredGoods(List<RequiredGoods> insertRequiredBeneficiary);

	void deleteOldequiredGoods(List<RequiredGoods> deleteRequiredBeneficiary);

	List<RequiredGoods> selectRequiredGoodsListByGoodsNo(int goodsNo);

}
