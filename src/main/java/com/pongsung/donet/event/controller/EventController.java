package com.pongsung.donet.event.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pongsung.donet.common.Pagination;
import com.pongsung.donet.event.model.service.EventService;
import com.pongsung.donet.event.model.vo.Event;
import com.pongsung.donet.common.PageInfo;

@Controller
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping("list.ev")
	public String selectList(@RequestParam(value="currentpage", required=false, defaultValue="1") int currentPage, Model model) {
		
		int listCount = eventService.selectEventListCount();
		System.out.println("listCount check : "+listCount); //페이지 카운트확인하기 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10 , 5);
		
		ArrayList<Event> list = eventService.selectEventList(pi);
		System.out.println("list check : "+list); //리스트 확인 
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		
		
		return "event/eventList";
		
	}
}
