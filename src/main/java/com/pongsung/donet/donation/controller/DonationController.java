package com.pongsung.donet.donation.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.google.gson.GsonBuilder;
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
		List<Sponsor> pList = donationService.selectSponsorList(suNo);
		
		mv.addObject("s", s).setViewName("donation/donationDetail");
		mv.addObject("p", p).setViewName("donation/donationDetail");
		mv.addObject("u", u).setViewName("donation/donationDetail");
		mv.addObject("pList", pList).setViewName("donation/donationDetail");

		return mv;
	}

	@RequestMapping("reist.do")
	public String registDonation() {
		
		return "donation/registration";
	}
	
	@RequestMapping("select.ca")
	public String global(int suCategoryNo, Model model) {

		List<Support> list = donationService.selectCategoryList(suCategoryNo);
		System.out.println("list"+list);
		
		model.addAttribute("list", list);
		
		System.out.println("model "+model);		
		return "donation/global";
	}
	
	@ResponseBody
	@RequestMapping(value = "list.re", produces = "application/json; charset=utf-8")
	public String selectReplyList(int suNo) {

		ArrayList<SupporComment> commentList = donationService.selectReplyList(suNo);
		System.out.println("commentList "+commentList);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(commentList);
	}
	
	@ResponseBody
	@RequestMapping("insert.re")
	public String insertReply(SupporComment sc) {
		int result = donationService.insertReply(sc);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value="delete.re/{replyNo}")
	public String deleteReply(@PathVariable("replyNo")int replyNo) {
		int result = donationService.deleteReply(replyNo);
		System.out.println(replyNo);
		System.out.println(result);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value="update.re/{suNo}/{replyNo}")
	public String updateReply(@PathVariable("suNo")int suNo, @PathVariable("replyNo")int replyNo, SupporComment sc) {
		sc.setReplyNo(replyNo);
		int result = donationService.updateReply(sc);
		return String.valueOf(result);
	}

	

}
