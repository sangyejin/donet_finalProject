package com.pongsung.donet.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.Pagination;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.notice.model.service.NoticeService;
import com.pongsung.donet.notice.model.vo.Notice;
import com.pongsung.donet.notice.model.vo.Search;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService NoService;
	
	
	//main list
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
		
		return "customerSupport/notice/notice";
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
		
		return "customerSupport/notice/notice";
		
	}
	
	//detail
	@RequestMapping("detail.no")
	public ModelAndView selectThisNotice(int noticeNo, ModelAndView mv) {
		System.out.println("noticeNo : " + noticeNo );
		Notice no = NoService.selectThisNotice(noticeNo);
		
		/*이전글, 다음글*/
		Notice prevNote = NoService.selectPrevNotice(noticeNo);
		Notice nextNote = NoService.selectNextNotice(noticeNo);

		System.out.println("prevNote : " + prevNote );
		System.out.println("nextNote : " + nextNote );

		
		mv.addObject("no", no);
		mv.addObject("prevNote", prevNote);
		mv.addObject("nextNote", nextNote);

		mv.setViewName("customerSupport/notice/detailNotice");
		
		return mv;
	}
	
	//insert
	@RequestMapping("goAddForm.no")
	public String goAddForm() {
		return "customerSupport/notice/addNotice";
	}
	
	@RequestMapping("insert.no")
	public String insertNotice(Notice no,
								HttpServletRequest request, 
								Model model, 
								@RequestParam(name="noticeOrigin", required=false) MultipartFile file) {
		System.out.println("Notice : " + no);
		System.out.println("file.getOriginalFilename() : " + file.getOriginalFilename());

		//no.setNoticeWriter(noticeWriter);
		
		if(!file.getOriginalFilename().equals(""))	{
			String changeName = uploadFile(file, request);
			if(changeName != null) {
				no.setNoticeOrigin(file.getOriginalFilename());
				no.setNoticeNew(changeName);
			}
					
		}
		NoService.insertNotice(no);
				
		return "redirect:list.no";
	}
	
	//fileUpload
	private String uploadFile(MultipartFile file, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "//upload_files//";

		System.out.println("savePath : " + savePath);

		String originName = file.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		String ext = originName.substring(originName.lastIndexOf(".")); // . 뒤의 확장자 전부 가져와서 조합

		String changeName = currentTime + ext;

		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();

			throw new CommException("file upload error");
		}

		return changeName;
	}
	
	//update
	@RequestMapping("goUpdateForm.no")
	public String updateForm() {
		return "customerSupport/notice/adjustDeleteNotice";
	}
	
	//delete
	@RequestMapping("goDelete.no")
	public String deleteGo(int noticeNo, HttpServletRequest request) {
		//게시글을 삭제한다=표시상태를 'N'으로 돌린다=언젠가 다시 보이게 하고싶을 수도 있으니 파일은 삭제 안할 심산...
		NoService.deleteGo(noticeNo);
		
		return "redirect:list.no";
	}
	
}