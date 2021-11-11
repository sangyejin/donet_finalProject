package com.pongsung.donet.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.pongsung.donet.member.model.vo.Member;
import com.pongsung.donet.notice.model.service.NoticeService;
import com.pongsung.donet.notice.model.vo.Ask;
import com.pongsung.donet.notice.model.vo.Category;
import com.pongsung.donet.notice.model.vo.FrequentlyAskedQuestions;
import com.pongsung.donet.notice.model.vo.Notice;
import com.pongsung.donet.notice.model.vo.Search;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService NoService;

	// main list
	@RequestMapping("list.no")
	public String selectNoticeList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
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

	// search
	@RequestMapping("search.no")
	public String selectOfSearched(Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "searchtype", required = false) String searchtype,
			@RequestParam(name = "mInput", required = false) String mInput) {

		System.out.println("searchtype : " + searchtype);
		System.out.println("mInput : " + mInput);

		Search sc = new Search();

		switch (searchtype) {
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

	// detail
	@RequestMapping("detail.no")
	public ModelAndView selectThisNotice(int noticeNo, ModelAndView mv) {
		System.out.println("noticeNo : " + noticeNo);
		Notice no = NoService.selectThisNotice(noticeNo);

		/* 이전글, 다음글 */
		Notice prevNote = NoService.selectPrevNotice(noticeNo);
		Notice nextNote = NoService.selectNextNotice(noticeNo);

		System.out.println("prevNote : " + prevNote);
		System.out.println("nextNote : " + nextNote);

		mv.addObject("no", no);
		mv.addObject("prevNote", prevNote);
		mv.addObject("nextNote", nextNote);

		mv.setViewName("customerSupport/notice/detailNotice");

		return mv;
	}

	/*
	 * temp insert tiqkf
	 * 
	 * @RequestMapping("insertSave.no") public String
	 * insertSaveNotice(@RequestParam(name="noticeWriter") String noticeWriter,
	 * 
	 * @RequestParam(name="noticeTitle") String noticeTitle,
	 * 
	 * @RequestParam(name="noticeContent") String noticeContent, HttpServletRequest
	 * request, Model model,
	 * 
	 * @RequestParam(name="noticeOrigin", required=false) MultipartFile file) {
	 * 
	 * System.out.println("noticeWriter : " + noticeWriter + ", noticeTitle : " +
	 * noticeTitle + " , noticeContent : " + noticeContent);
	 * System.out.println("file.getOriginalFilename() : " +
	 * file.getOriginalFilename());
	 * 
	 * Notice no = new Notice();
	 * 
	 * no.setNoticeTitle(noticeTitle); no.setNoticeWriter(noticeWriter);
	 * no.setNoticeContent(noticeContent);
	 * 
	 * if(!file.getOriginalFilename().equals("")) { String changeName =
	 * saveFile(file, request); if(changeName != null) {
	 * no.setNoticeOrigin(file.getOriginalFilename()); no.setNoticeNew(changeName);
	 * }
	 * 
	 * } NoService.insertSaveNotice(no);
	 * 
	 * return "redirect:list.no"; }
	 */

	// insert
	@RequestMapping("goAddForm.no")
	public String goAddForm() {
		return "customerSupport/notice/addNotice";
	}

	@RequestMapping("insert.no")
	public String insertNotice(@RequestParam(name = "noticeWriter") String noticeWriter,
			@RequestParam(name = "noticeTitle") String noticeTitle,
			@RequestParam(name = "noticeContent") String noticeContent, HttpServletRequest request, Model model,
			@RequestParam(name = "noticeOrigin", required = false) MultipartFile file) {

		System.out.println("noticeWriter : " + noticeWriter + ", noticeTitle : " + noticeTitle + " , noticeContent : "
				+ noticeContent);
		System.out.println("file.getOriginalFilename() : " + file.getOriginalFilename());

		Notice no = new Notice();

		no.setNoticeTitle(noticeTitle);
		no.setNoticeWriter(noticeWriter);
		no.setNoticeContent(noticeContent);

		if (!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);
			if (changeName != null) {
				no.setNoticeOrigin(file.getOriginalFilename());
				no.setNoticeNew(changeName);
			}

		}
		NoService.insertNotice(no);

		return "redirect:list.no";
	}

	// fileUpload
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "//notice_uploadFiles//";

		System.out.println("savePath : " + savePath);

		String originName = file.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		String ext = originName.substring(originName.lastIndexOf(".")); // . 뒤의 확장자 전부 가져와서 조합

		String changeName = currentTime + ext;

		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			throw new CommException("file upload error");
		}

		return changeName;
	}

	// update
	@RequestMapping("goUpdateForm.no")
	public ModelAndView updateForm(int noticeNo, ModelAndView mv) {
		System.out.println("noticeNo : " + noticeNo);
		Notice no = NoService.selectThisNotice(noticeNo);

		mv.addObject("no", no);
		mv.setViewName("customerSupport/notice/adjustDeleteNotice");

		return mv;
	}

	@RequestMapping("update.no")
	public ModelAndView updateNotice(@RequestParam(name = "noticeWriter") String noticeWriter,
			@RequestParam(name = "noticeTitle") String noticeTitle,
			@RequestParam(name = "noticeContent") String noticeContent, @RequestParam(name = "noticeNo") int noticeNo,
			HttpServletRequest request, ModelAndView model,
			@RequestParam(name = "noticeOrigin", required = false) MultipartFile file) {

		System.out.println("noticeWriter : " + noticeWriter + ", noticeTitle : " + noticeTitle + " , noticeContent : "
				+ noticeContent + ", noticeNo : " + noticeNo);
		System.out.println("file.getOriginalFilename() : " + file.getOriginalFilename());

		Notice no = new Notice();

		no.setNoticeNo(noticeNo);
		no.setNoticeTitle(noticeTitle);
		no.setNoticeWriter(noticeWriter);
		no.setNoticeContent(noticeContent);

		
		if (!file.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(file, request);

			no.setNoticeOrigin(file.getOriginalFilename());
			no.setNoticeNew(changeName);

		}
		
		NoService.updateNotice(no);

		model.addObject("noticeNo", noticeNo).setViewName("redirect:detail.no");

		return model;
	}

	// delete
	@RequestMapping("goDelete.no")
	public String deleteGo(int noticeNo, HttpServletRequest request) {
		// 게시글을 삭제한다=표시상태를 'N'으로 돌린다=언젠가 다시 보이게 하고싶을 수도 있으니 파일은 삭제 안할 심산...
		NoService.deleteGo(noticeNo);
		
		/*이전 게시글로 안보내줌
		Notice prevNote = NoService.selectPrevNotice(noticeNo);
		*/

		return "redirect:list.no";
	}

	
	
	/******************************************************************************************************************/
	// FAQ List
	@RequestMapping("list.faq")
	public String selectFaqList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {

		int listCount = NoService.selectFaqListCount(null);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<FrequentlyAskedQuestions> list = NoService.selectFaqList(pi, null);
		System.out.println("list : " + list);
		System.out.println("listCount : " + listCount);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "customerSupport/faq/faqList";
	}

	// FAQ Search
	@RequestMapping("search.faq")
	public String selectOfFaq(Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "searchtype", required = false) int searchtype,
			@RequestParam(name = "mInput", required = false) String mInput) {

		System.out.println("searchtype : " + searchtype);
		System.out.println("mInput : " + mInput);

		Category ctgry = new Category();
		ctgry.setFTypeNo(searchtype);
		ctgry.setFTypeName(mInput);

		int listCount = NoService.selectFaqListCount(ctgry);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<FrequentlyAskedQuestions> list = NoService.selectFaqList(pi, ctgry);
		System.out.println("list : " + list);
		System.out.println("listCount : " + listCount);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "customerSupport/faq/faqList";

	}

	// FAQ Insert
	@RequestMapping("goAddForm.faq")
	public String goAddFaq() {
		return "customerSupport/faq/addFaq";
	}

	@RequestMapping("insert.faq")
	public String insertFaq(@RequestParam(name = "faqQuestion") String faqQuestion,
			@RequestParam(name = "searchtype") int faqType, @RequestParam(name = "faqAnswered") String faqAnswered,
			HttpServletRequest request, Model model) {

		System.out
				.println("faqQuestion : " + faqQuestion + ", faqType : " + faqType + " , faqAnswered : " + faqAnswered);

		FrequentlyAskedQuestions faq = new FrequentlyAskedQuestions();

		faq.setFaqQuestion(faqQuestion);
		faq.setFaqType(faqType);
		faq.setFaqAnswered(faqAnswered);

		NoService.insertFaq(faq);

		return "redirect:list.faq";
	}

	// update
	@RequestMapping("goUpdateForm.faq")
	public ModelAndView updateFaq(int faqNo, ModelAndView mv) {
		System.out.println("faqNo : " + faqNo);
		FrequentlyAskedQuestions faq = NoService.selectThisFaq(faqNo);
		System.out.println("*** faq : " + faq);

		mv.addObject("faq", faq);
		mv.setViewName("customerSupport/faq/adjustDeleteFaq");

		return mv;
	}

	@RequestMapping("update.faq")
	public String updateFaq(@RequestParam(name = "faqNo") int faqNo,
			@RequestParam(name = "faqQuestion") String faqQuestion,
			@RequestParam(name = "faqAnswered") String faqAnswered, HttpServletRequest request, ModelAndView model) {

		System.out.println("faqNo : " + faqNo + ", faqQuestion : " + faqQuestion + " , faqAnswered : " + faqAnswered);

		FrequentlyAskedQuestions faq = new FrequentlyAskedQuestions();

		faq.setFaqNo(faqNo);
		faq.setFaqQuestion(faqQuestion);
		faq.setFaqAnswered(faqAnswered);

		NoService.updateFaq(faq);

		return "redirect:list.faq";
	}

	// delete
	@RequestMapping("delete.faq")
	public String deleteFaq(int faqNo, HttpServletRequest request) {
		NoService.deleteFaq(faqNo);

		return "redirect:list.faq";
	}
	
	/******************************************************************************************************************/
	
	// main list
		@RequestMapping("list.one")
		public String selectOneList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage
				,Model model
				,HttpServletRequest request) {
			
			//로그인 유저 가져오기
			HttpSession session = request.getSession();
			Member loginUser = (Member) session.getAttribute("loginUser");
			
			System.out.println("loginUser : " + loginUser);
			System.out.println("loginUser.getUserRole() : " + loginUser.getUserRole());

			
			int listCount = NoService.selectOneListCount(loginUser);

			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

			ArrayList<Ask> list = NoService.selectOneList(pi, loginUser);
			System.out.println("list : " + list);
			System.out.println("listCount : " + listCount);

			model.addAttribute("list", list);
			model.addAttribute("pi", pi);

			return "customerSupport/oneOone/faceToFace";
		}
		
	//insert
		@RequestMapping("goAskForm.one")
		public String goAskForm() {
			return "customerSupport/oneOone/addAsk";
		}
		
		@RequestMapping("insert.one")
		public String insertOne(@RequestParam(name = "askTitle") String askTitle,
				@RequestParam(name = "searchtype") int oneType,
				@RequestParam(name = "askContent") String askContent, 
				HttpServletRequest request, Model model,
				@RequestParam(name = "askOriginImg", required = false) MultipartFile file) {

			//로그인 유저 가져오기
			HttpSession session = request.getSession();
			Member loginUser = (Member) session.getAttribute("loginUser");

			System.out.println("askTitle : " + askTitle + ", oneType : " + oneType + " , askContent : "+ askContent + " loginUser.getUserId() : " + loginUser.getUserId());
			System.out.println("file.getOriginalFilename() : " + file.getOriginalFilename());

			Ask ask = new Ask();
			
			/*set*/
			
			ask.setAskTitle(askTitle);
			ask.setAskTypeNo(oneType);
			ask.setAskContent(askContent);
			ask.setAskId(loginUser.getUserId());
			
			if (!file.getOriginalFilename().equals("")) {
				String changeName = saveFile(file, request);
				if (changeName != null) {
					ask.setAskOriginImg(file.getOriginalFilename());
					ask.setAskNewImg(changeName);
				}
			}
			
			NoService.insertOne(ask);

			return "redirect:list.one";
		}

		// update
		@RequestMapping("goUpdateForm.one")
		public ModelAndView updateOne(int askNo, ModelAndView mv) {
			System.out.println("askNo : " + askNo);
			
			Ask ask = NoService.selectThisAsk(askNo);
			System.out.println("*** ask : " + ask);

			mv.addObject("ask", ask);
			mv.setViewName("customerSupport/oneOone/updateAskAd");

			return mv;
		}
		
		@RequestMapping("update.one")
		//잘되는데...
		public String updateOne( @RequestParam(name = "askNo") int askNo,
				HttpServletRequest request, Model model,
				@RequestParam(name = "answered", required = false) String answered) {
			
			System.out.println("askNo : " + askNo + " , answered : "+ answered);
			Ask ask = new Ask();
			
			ask.setAskNo(askNo);
			ask.setAnswered(answered);
			
			NoService.updateOne(ask);

			return "redirect:list.one";
		}
		
		// delete
		//왜 삭제만 쥐랄이지?
		@RequestMapping("delete.one")
		public String deleteOne(int askNo, HttpServletRequest request) {
			
			HttpSession session = request.getSession();

			System.out.println("진짜청컨대삭제좀돼라샹넘아");
			System.out.println("askNo : " + askNo);
			NoService.deleteOne(askNo);
			
			session.setAttribute("msg", "문의 삭제 완료");


			return "redirect:list.one";
		}
		
		
}