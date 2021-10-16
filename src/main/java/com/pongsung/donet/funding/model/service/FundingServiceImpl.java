package com.pongsung.donet.funding.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

@Service
public class FundingServiceImpl implements FundingService {
	@Autowired
	private FundingService fundingService;
	
	@RequestMapping("fundingList")
	public String seletFundingList(){
		return "funding/fundingListView.jsp";
	}
}
