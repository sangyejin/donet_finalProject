package com.pongsung.donet.funding.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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

	// 펀딩 리스트
	@RequestMapping("funding")
	public String seletcFundingList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		int listCount = fundingService.selectFundingListCount();

		List<FundingCategory> categoryList = fundingService.selectFundingCategoryList();

		logger.info("fundingListCount::" + listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
//		
		List<Funding> fundingList = fundingService.selectFundingList(pi);
		logger.info("fundingList::" + fundingList);
//		
		model.addAttribute("category", categoryList);
		model.addAttribute("list", fundingList);
		model.addAttribute("pi", pi);

		return "funding/fundingListView";
	}
	
	//펀딩프로젝트 등록 폼으로 이동
	@RequestMapping("funding/insertForm")
	public String enrollForm(Model model) {
		List<FundingCategory> categoryList = fundingService.selectFundingCategoryList();

		model.addAttribute("category",categoryList);
		return "funding/fundingEnrollForm";
	}
	
	//펀딩프로젝트 게시글 등록
	@RequestMapping("funding/insert")
	public String insertFunding(Funding funding
								, @RequestParam(name="thumbFile",required=false) MultipartFile thumbImg
								, @RequestParam(name="file1",required=false) MultipartFile img1
								, @RequestParam(name="file2",required=false) MultipartFile img2
								, @RequestParam(name="file3",required=false) MultipartFile img3
								, Model model) {
		
		//잘 가져와지는지 test
		System.out.println(funding);
		System.out.println(thumbImg.getOriginalFilename());
		System.out.println(img1.getOriginalFilename());
		System.out.println(img2.getOriginalFilename());
		System.out.println(img3.getOriginalFilename());
		return "funding/fundingListView";
		
//		return "funding/fundingDetailView";
	}
	
	
	// 후원완료창 확인용
	@RequestMapping("funding/complete")
	public String insertFunding() {
		return "funding/fundingCompleteView";
	}


}
