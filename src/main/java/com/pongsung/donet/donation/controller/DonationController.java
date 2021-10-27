package com.pongsung.donet.donation.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.Pagination;
import com.pongsung.donet.donation.model.service.DonationService;
import com.pongsung.donet.donation.model.vo.Sponsor;
import com.pongsung.donet.donation.model.vo.SupporComment;
import com.pongsung.donet.donation.model.vo.Support;
import com.pongsung.donet.donation.model.vo.SupportUsePlan;

@SessionAttributes("loginUser") 
@Controller
public class DonationController {

	@Autowired
	private DonationService donationService;
	
	@InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }
	
	@RequestMapping("list.do")
	public String donationList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		
		int listCount = donationService.selectDonationListCount();
		System.out.println("listCount"+listCount);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 9);
		System.out.println("pi"+pi);
		
		List<Support> list = donationService.selectDonationList(pi);
		System.out.println("support"+list);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		System.out.println("model "+model);
		
		return "donation/donationMain";
	}
	
	@RequestMapping("detail.do")
	public ModelAndView donationDetail(int suNo, ModelAndView mv){
		Support s = donationService.selectDonation(suNo);
		Sponsor p = donationService.selectSponsor(suNo);
		List<SupportUsePlan> u = donationService.selectSupportUsePlan(suNo);
		List<SupporComment> c = donationService.selectSupporComment(suNo);
		List<Sponsor> pList = donationService.selectSponsorList(suNo);
		
		mv.addObject("s", s).setViewName("donation/donationDetail");
		mv.addObject("p", p).setViewName("donation/donationDetail");
		mv.addObject("u", u).setViewName("donation/donationDetail");
		mv.addObject("c", c).setViewName("donation/donationDetail");
		mv.addObject("pList", pList).setViewName("donation/donationDetail");

		System.out.println("c "+c);
		System.out.println("pList "+pList);
		return mv;
	}

	@RequestMapping("reist.do")
	public String registDonation() {
		
		return "donation/registration";
	}
	
/*	@RequestMapping("global")
	public String global(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model, int categoryNo) {
		int listCount = donationService.selectGolbalListCount(categoryNo);
		System.out.println("listCount"+listCount);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 9);
		System.out.println("pi"+pi);
		
		List<Support> list = donationService.selectGlobalList(pi,categoryNo);
		System.out.println("support"+list);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		System.out.println("model "+model);		
		return "donation/global";
	}*/
	
	
	@ResponseBody
	@RequestMapping("insert.re")
	public String insertReply(SupporComment sc) {
		int result = donationService.insertReply(sc);
		System.out.println(result);
		System.out.println(sc);
		
		return String.valueOf(result);
	}
	

}
