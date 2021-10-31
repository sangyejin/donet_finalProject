package com.pongsung.donet.goods.model.service;

import java.util.List;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.goods.model.vo.Beneficiary;
import com.pongsung.donet.goods.model.vo.Goods;
import com.pongsung.donet.goods.model.vo.GoodsCategory;
import com.pongsung.donet.goods.model.vo.RequiredGoods;

public interface GoodsService {

	int selectGoodsListCount();

	List<GoodsCategory> selectGoodsCategoryList();

	List<Goods> selectGoodsList(PageInfo pi);

	void updateGoodsHitsCount(int goodsNo);

	Goods selectGoods(int goodsNo);

	void deleteGoods(int goodsNo);

	List<Beneficiary> selectBeneficiaryList();

	void insertGoods(Goods goods,List<RequiredGoods> requiredGoods);

	void updateGoods(Goods goods);
}
