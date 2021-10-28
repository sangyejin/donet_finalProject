package com.pongsung.donet.goods.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.Pagination;
import com.pongsung.donet.funding.controller.FundingController;
import com.pongsung.donet.goods.model.service.GoodsService;
import com.pongsung.donet.goods.model.vo.Goods;
import com.pongsung.donet.goods.model.vo.GoodsCategory;

@SessionAttributes("loginUser") 
@Controller
public class GoodsController {
	private static final Logger logger = LoggerFactory.getLogger(FundingController.class);
	
	@Autowired
	private GoodsService goodsService;
	
	// 펀딩 리스트
	@RequestMapping("goods")
	public String seletcFundingList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		int listCount = goodsService.selectGoodsListCount();
		logger.info("goodsListCount::" + listCount);
		
		List<GoodsCategory> categoryList = goodsService.selectGoodsCategoryList();
		logger.info("categoryList:::"+categoryList);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
//		
		List<Goods> goodsList = goodsService.selectGoodsList(pi);
		logger.info("goodsList::" + goodsList);
//		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("pi", pi);

		return "goods/goodsListView";
	}
}
