package com.pongsung.donet.donation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.Pagination;
import com.pongsung.donet.donation.model.service.DonationService;
import com.pongsung.donet.donation.model.vo.Sponsor;
import com.pongsung.donet.donation.model.vo.Support;

@Controller
public class DonationController {

	@Autowired
	private DonationService donationService;
	
	@RequestMapping("list.do")
	public String donationList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		
		System.out.println("컨트롤러");
		int listCount = donationService.selectDonationListCount();
		System.out.println("listCount"+listCount);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 9);
		System.out.println("pi"+pi);
		
		List<Support> list = donationService.selectDonationList(pi);
		System.out.println("support"+list);
		
		List<Sponsor> sponsor = donationService.selectSponsorList(pi);
		System.out.println("sponsor"+sponsor);
		
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("sponsor", sponsor);
		
		System.out.println("model "+model);
		
		return "donation/donationMain";
	}
	
	@RequestMapping(value = "/donet/detail.do", method = RequestMethod.GET)
	public ModelAndView donationDetail(int suNo, ModelAndView mv){
		Support s = donationService.selectDonation(suNo);
		
		mv.addObject("s", s).setViewName("donation/donationDetail");
		return mv;
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
