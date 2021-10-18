package com.pongsung.donet.donation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class donationController {

	@RequestMapping("list.do")
	public String donationList() {
		
		return "donation/donationMain";
	}

	@RequestMapping("reist.do")
	public String registDonation() {
		
		return "donation/registration";
	}
	
	
}
