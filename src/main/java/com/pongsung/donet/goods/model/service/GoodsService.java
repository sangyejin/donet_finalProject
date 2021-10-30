package com.pongsung.donet.goods.model.service;

import java.util.List;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.goods.model.vo.Goods;
import com.pongsung.donet.goods.model.vo.GoodsCategory;

public interface GoodsService {

	int selectGoodsListCount();

	List<GoodsCategory> selectGoodsCategoryList();

	List<Goods> selectGoodsList(PageInfo pi);

}
