package com.pongsung.donet.funding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FundingController {
	
	//펀딩프로젝트 리스트 확인용
	@RequestMapping("funding/list")
	public String seletcFundingList() {
		return "funding/fundingListView";
	}
	
	@RequestMapping("funding/detail")
	public String seletcFundingDetail() {
		return "funding/";
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
