package com.pongsung.donet.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pongsung.donet.common.Pagination;
import com.pongsung.donet.notice.model.service.NoticeService;
import com.pongsung.donet.notice.model.vo.Notice;
import com.pongsung.donet.common.PageInfo;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService NoService;
	
	@RequestMapping("list.no")
	public String selectNoticeList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			Model model) {

		int listCount = NoService.selectNoticeListCount();
		System.out.println(listCount);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Notice> list = NoService.selectNoticeList(pi);
		System.out.println("list : " + list);
		System.out.println("listCount : " + listCount);

		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "customerSupport/notice";
	}
	
	//select
}
