package com.pongsung.donet;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pongsung.donet.donation.model.service.DonationService;
import com.pongsung.donet.donation.model.vo.Support;
import com.pongsung.donet.event.model.service.EventService;
import com.pongsung.donet.event.model.vo.Event;
import com.pongsung.donet.funding.model.service.FundingService;
import com.pongsung.donet.funding.model.vo.Funding;
import com.pongsung.donet.goods.model.service.GoodsService;
import com.pongsung.donet.goods.model.vo.Goods;
import com.pongsung.donet.notice.model.service.NoticeService;
import com.pongsung.donet.notice.model.vo.Notice;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private GoodsService goodsService;
	
	@Autowired 
	FundingService fundingService;
	
	@Autowired 
	DonationService donationService;
	
	@Autowired
	private EventService eventService;
	
	@Autowired
	private NoticeService noticeService;
	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		//List<Event> eventList = eventService.selectTopEventList();
		List<Goods> goodsList = goodsService.selectTopGoodsList();
		//List<Notice> noticeList = noticeService.selectTopNoticeList();
		List<Funding> fundingList = fundingService.selectTopFundingList();
		//List<Support> supportList = donationService.selectTopDonationList();
		
		//model.addAttribute("eventList",eventList);
		model.addAttribute("goodsList",goodsList);
		//model.addAttribute("noticeList",noticeList);
		model.addAttribute("fundingList",fundingList);
		//model.addAttribute("supportList",supportList);
		
		return "main";
	}
	
}
