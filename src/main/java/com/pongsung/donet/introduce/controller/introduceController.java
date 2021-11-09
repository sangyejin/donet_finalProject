package com.pongsung.donet.introduce.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pongsung.donet.introduce.model.service.ChartService;
import com.pongsung.donet.introduce.model.vo.ChartFunding;
import com.pongsung.donet.introduce.model.vo.ChartSupport;

@Controller
public class introduceController {

	@Autowired
	private ChartService chartService;
	
	@RequestMapping("introduce.pr")
	public String introduceProject() {

		return "introduce/introduceProject";
	}
	
	@RequestMapping("introduce.how")
	public String howtoDonation() {

		return "introduce/howtoDonation";
	}

	@RequestMapping("introduce.chart")
	@ResponseBody
	public ModelAndView donationDetail(ModelAndView mv){
		List<ChartSupport> s = chartService.selectDonation();
		List<ChartFunding> f = chartService.selectSponsor();
		
		mv.addObject("s", s).setViewName("introduce/staticChart");
		mv.addObject("f", f).setViewName("introduce/staticChart");
		
		return mv;
	}
	





}
