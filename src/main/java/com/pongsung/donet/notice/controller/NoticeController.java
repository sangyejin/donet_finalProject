package com.pongsung.donet.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.Pagination;
import com.pongsung.donet.notice.model.service.NoticeService;
import com.pongsung.donet.notice.model.vo.Notice;
import com.pongsung.donet.notice.model.vo.Search;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService NoService;
	
	@RequestMapping("list.no")
	public String selectNoticeList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			Model model) {

		int listCount = NoService.selectNoticeListCount(null);
		System.out.println(listCount);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Notice> list = NoService.selectNoticeList(pi, null);
		System.out.println("list : " + list);
		System.out.println("listCount : " + listCount);

		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "customerSupport/notice";
	}
	
	
	
	//search
	@RequestMapping("search.no")
	public String selectOfSearched( Model model,@RequestParam(value = "currentPage", required = false, defaultValue = "1")  int currentPage,
									@RequestParam(name = "searchtype", required = false) String searchtype,
									@RequestParam(name = "mInput", required = false) String mInput ) {
		
		System.out.println("searchtype : " + searchtype);
		System.out.println("mInput : " + mInput);
		
		Search sc = new Search();
		
		switch(searchtype) {
		case "writer":
			sc.setWriter(mInput);
			break;

		case "title":
			sc.setTitle(mInput);
			break;

		case "content":
			sc.setContent(mInput);
			break;
		}
		
		
		int listCount = NoService.selectNoticeListCount(sc);
		System.out.println(listCount);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Notice> list = NoService.selectNoticeList(pi, sc);
		System.out.println("list : " + list);
		System.out.println("listCount : " + listCount);

		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "customerSupport/notice";
		
	}
}
