package com.pongsung.donet.funding.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.Pagination;
import com.pongsung.donet.funding.model.service.FundingService;
import com.pongsung.donet.funding.model.vo.Funding;
import com.pongsung.donet.funding.model.vo.FundingCategory;

@Controller
public class FundingController {
	private static final Logger logger = LoggerFactory.getLogger(FundingController.class);
	
	@Autowired
	private FundingService fundingService;
	
	//펀딩 리스트 확인용
	@RequestMapping("fundingList")
	public String seletcFundingList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		int listCount=fundingService.selectFundingListCount();
		
		List<FundingCategory> categoryList= fundingService.selectFundingCategoryList();
		
		logger.info("fundingListCount::"+listCount);
		PageInfo pi=Pagination.getPageInfo(listCount, currentPage, 5, 16);
//		
		List<Funding> fundingList = fundingService.selectFundingList(pi);
		logger.info("fundingList::"+fundingList);
//		
		model.addAttribute("category",categoryList);
		model.addAttribute("list", fundingList);
		model.addAttribute("pi",pi);
		
		return "funding/fundingListView";
	}
	
	@RequestMapping("funding/insert")
	public String insertFunding() {
		return "funding/";
	}
	
	@RequestMapping("funding/update")
	public String updateFunding() {
		return "funding/";
	}
}
