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
	
	@RequestMapping("global")
	public String global() {
		
		return "donation/global";
	}
	
	@RequestMapping("environment")
	public String environment() {
		
		return "donation/environment";
	}
	
	@RequestMapping("animal")
	public String animal() {
		
		return "donation/animal";
	}
	
	@RequestMapping("child")
	public String child() {
		
		return "donation/child";
	}
	
	@RequestMapping("vulnerable")
	public String vulnerable() {
		
		return "donation/vulnerable";
	}
}
