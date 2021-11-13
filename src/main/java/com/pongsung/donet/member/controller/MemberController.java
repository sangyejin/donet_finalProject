package com.pongsung.donet.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.Pagination;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.donation.model.vo.Sponsor;
import com.pongsung.donet.donation.model.vo.Support;
import com.pongsung.donet.funding.model.vo.FundingImage;
import com.pongsung.donet.funding.model.vo.FundingSupporter;
import com.pongsung.donet.member.model.service.MemberService;
import com.pongsung.donet.member.model.service.MemberServiceImpl;
import com.pongsung.donet.member.model.vo.Bank;
import com.pongsung.donet.member.model.vo.Member;
import com.pongsung.donet.member.model.vo.Payment;
import com.pongsung.donet.member.model.vo.Review;
import com.pongsung.donet.member.model.vo.ReviewComment;
import com.pongsung.donet.member.model.vo.ReviewImage;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired // 빈스캐닝을 통해서 인터페이스를 구현한 클래스(구현체) 중에 @Service로 등록되어 있는 빈을 찾아서 자동으로 주입해준다.
	private MemberService memberService;
	
	@Autowired // target class test(CGLIB 프록시 test)
	private MemberServiceImpl memberServiceImpl;
	
	// 로그인 페이지
		@RequestMapping("loginForm.me")
		public String loginForm() {
			//logger.debug("====== START ========");
			//logger.info("====== START info ========");
			return "member/memberLogin";
		}
	
	
	// 암호화처리 로그인
		@RequestMapping("login.me")
		public String loingMember(Member m, Model model) throws Exception{
			
				
				Member loginUser = memberService.loginMember(bCryptPasswordEncoder, m);
				System.out.println("MemberController에서 loginUser 값 : " + loginUser);
				model.addAttribute("loginUser", loginUser);
				return "redirect:/"; //redirect:index.jsp
			
		}
		
		// 로그아웃
		@RequestMapping("logout.me")
		public String logoutMember(SessionStatus status) {
			
			status.setComplete(); // 현재 컨트롤러에  @SessionAttributes에 의해 저장된 오브젝트를 제거합니다.
						
			return "redirect:/";
		} 
		

		// 회원 등록 페이지로 이동
		@RequestMapping("enrollForm.me")
		public String enrollForm() {
			//logger.debug("====== START ========");
			//logger.info("====== START info ========");
			return "member/memberEnrollForm";
		}
		
		// 마이 페이지로 이동
//		@RequestMapping("myPage.me")
//		public String myPage() {
//			return "member/myPage";
//		}
		
		// 출석 체크용 달력으로 이동
		@RequestMapping("calendar.me")
		public String calendar() {
			return "attendance/Calendar";
		}
		
		
		@RequestMapping("insert.me")
		public String insertMember(@ModelAttribute Member m ,@RequestParam("post") String post,
															 @RequestParam("address1") String address1,
															 @RequestParam("address2") String address2 , HttpSession session) {
			
			
			m.setAddress(post+"/"+address1+"/"+address2);
			System.out.println(m);
			
			System.out.println("암호화전 : " + m.getUserPwd());
			
			// 암호화 작업
			
			String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());
			
			System.out.println("암호화 후 : "+ encPwd);
			
			m.setUserPwd(encPwd);
			
			memberService.insertMember(m);
			session.setAttribute("msg", "회원가입 성공");
			
			return "redirect:/";
		}	
		
		@RequestMapping("delete.me")
		public String deleteMember(String userId, HttpSession session) {
			
			memberService.deleteMember(userId);
			session.setAttribute("msg", "회원 탈퇴가 완료되었습니다.");
			return "redirect:logout.me";
		}
		
		// 회원정보 수정하기
		@RequestMapping("update.me")
		public String updateMember(@ModelAttribute Member m, @RequestParam("post") String post,
															 @RequestParam("address1") String address1,
															 @RequestParam("address2") String address2, Model model) {
			System.out.println("post의 값 : " + post);
			System.out.println("address1의 값 : " + address1);
			System.out.println("address2의 값 : " + address2);
			System.out.println("Member m의 값 : " + m);
			System.out.println("Model의 값 : " + model);

			
			m.setAddress(post+"/"+address1+"/"+address2);
			
			Member userInfo = memberService.updateMember(m);
			//Member userInfo = memberServiceImpl2.updateMember(m);
			
			model.addAttribute("loginUser", userInfo);
			
			System.out.println("addAttribute Model의 값 : " + model);
			
			return "redirect:/";
			
			}
		
		// 비밀번호 변경하기
		@RequestMapping("updatePwd.me")
		public String updatePwdMember (@ModelAttribute Member m, @RequestParam("userId") String userId,
																 @RequestParam("newPwd") String newPwd, Model model, SessionStatus status) {
			
			String encPwd = bCryptPasswordEncoder.encode(newPwd);
			System.out.println("encPwd의 값 : " + encPwd);
			
			m.setUserId(userId);
			m.setUserPwd(encPwd);
			
			System.out.println("m.getUserPwd() 의 값 : " + m.getUserPwd() + ", m.getUserId()의 값 : " + m.getUserId());
			
			Member userInfo = memberService.updatePwdMember(m);
			System.out.println("userInfo의 값 : " + userInfo);
						
			
			if(userInfo != null) {
				model.addAttribute("msg", "비밀번호가 변경되었습니다.");
				model.addAttribute("loginUser", userInfo);
				status.setComplete(); 
				return "member/memberLogin";
			}else {
				model.addAttribute("msg", "비밀번호 변경에 실패했습니다.");
				 return "common/errorPage";
			}	
		}
		
//		public String findUserIdMember(@ModelAttribute Member m ,@RequestParam("email") String email,
//				 @RequestParam("phone") String phone, Model model) {
//		
		
		@RequestMapping("findUserId.me")
		public String findUserIdMember(@ModelAttribute Member m, Model model) {
			
			
			System.out.println("아이디 찾는 유저 : " + model);
			
			Member userInfo = memberService.findUserIdMember(m);
			System.out.println("아이디 찾기 userInfo의 값 : " + userInfo);
			
			
			if(userInfo != null) {
				model.addAttribute("msg", "아이디 : " + userInfo.getUserId());
				System.out.println("userInfo : " + userInfo.getUserId());
				model.addAttribute("userInfo", userInfo);
				return "member/memberLogin";
			}else {
				model.addAttribute("msg", "아이디 찾지 못하였습니다.");
				return "common/errorPage";
			}
			
		}
		
		
		@RequestMapping("findUserPwd.me")
		public String findUserPwdMember(@ModelAttribute Member m, Model model) {
			
			
			System.out.println("비밀번호 찾는 유저 : " + model);
			
			Member userInfo = memberService.findUserPwdMember(bCryptPasswordEncoder, m);
			System.out.println("비밀번호 찾기 userInfo의 값 : " + userInfo);
			
			
			if(userInfo != null) {
				model.addAttribute("msg", "새로운 비밀번호를 만들어주세요. ");
				System.out.println("userInfo : " + userInfo.getUserPwd());
				model.addAttribute("userInfo", userInfo);
				return "member/findPwdChange";
			}else {
				model.addAttribute("msg", "비밀전호를 찾지 못하였습니다.");
				return "common/errorPage";
			}
			
		}
		
			

		//point charging
		@RequestMapping("point.me")
		public String chargeMyPoint(Model model) {
			ArrayList<Bank> bkList = memberService.selectBkList();
			
			//데이터베이스 은행명 가져오기
			model.addAttribute("bkList", bkList);
			
			return "member/point/payment";
		}
		
		@RequestMapping("insertCard.me")
		public String insertCard(@RequestParam(name = "cardNumber1") String cardNumber1,
								@RequestParam(name = "cardNumber2") String cardNumber2,
								@RequestParam(name = "cardNumber3") String cardNumber3,
								@RequestParam(name = "cardNumber4") String cardNumber4,
								@RequestParam(name = "expireM") String expireM,
								@RequestParam(name = "expireY") String expireY,
								@RequestParam(name = "cvcNum") int cvcNum,
								@RequestParam(name = "cardBankName") int cardBankName,
								@RequestParam(name = "surname") String surname,
								@RequestParam(name = "fstname") String fstname,
								@RequestParam(name = "amount") String amount,
								HttpServletRequest request, Model model
								) {
			
			System.out.println("카드결제 인서트 : 컨트롤러"); //결제내역 기록
			System.out.println(", expireM : " + expireM + " , expireY : " + expireY + ", cvcNum : " + cvcNum + ", cardBankName : " + cardBankName + ", surname : " + surname + " ,fstname :  " + fstname);
			System.out.println("cardNumber1: " + cardNumber1 + " cardNumber2 : " + cardNumber2 + ", cardNumber3 : " + cardNumber3 + ", cardNumber4 : " + cardNumber4);

			Payment payment = new Payment();
			
			//로그인 유저 가져오기
			HttpSession session = request.getSession();
			Member loginUser = (Member) session.getAttribute("loginUser");
			
			String expireDate = expireM+expireY; //유효기간
			String fullName = surname+fstname; //이름
			String cardNumber = cardNumber1 + cardNumber2 + cardNumber3 + cardNumber4;
			
			String amounts[] = amount.split(",");
			
			String temp = "";
			System.out.println("temp 선언");
			
			for(String str : amounts) {
				temp = temp + str ;
				System.out.println("temp  : " + temp);

			}
			
			payment.setUserId(loginUser.getUserId());
			payment.setCardNo(cardNumber);
			payment.setPayExpiry(Integer.parseInt(expireDate));
			payment.setPayCvc(cvcNum);
			payment.setBNo(cardBankName);
			payment.setPayName(fullName);
			payment.setPointAmount(Integer.parseInt(temp));
			
			memberService.insertCard(payment);
			
			//유저정보 새로 가져와서 넘겨주기
			
			Member thisUser = memberService.selectThisUser(loginUser);
			
			
			System.out.println("loginUser.getPoint() : " + loginUser.getPoint());
			System.out.println("thisUser.getPoint() : " + thisUser.getPoint());

			model.addAttribute("loginUser", thisUser);
			
			session.setAttribute("msg", "포인트 충전이 완료되었습니다. 잔액은 마이페이지에서 확인 가능합니다.");
			
			return "redirect:/myPage.me";

		}
		

		@RequestMapping("updatePoint.me")
		public String updatePoint(@RequestParam(name = "amount") String amount, HttpServletRequest request, Model model) {
			
			HttpSession session = request.getSession();
			Member loginUser = (Member) session.getAttribute("loginUser");
			
			String amounts[] = amount.split(",");
			
			String temp = "";
			System.out.println("temp 선언");
			
			for(String str : amounts) {
				temp = temp + str ;
				System.out.println("temp  : " + temp);

			}
			
			
			//포인트 셋
			loginUser.setPoint(Integer.parseInt(temp));
			
			//포인트 업데이트
			memberService.updatePoint(loginUser);
			
			//업데이트 된 정보로 받아오기
			Member thisUser = memberService.selectThisUser(loginUser);
			
			
			System.out.println("loginUser.getPoint() : " + loginUser.getPoint());
			System.out.println("thisUser.getPoint() : " + thisUser.getPoint());

			model.addAttribute("loginUser", thisUser);
			
			session.setAttribute("msg", "포인트 충전이 완료되었습니다. 잔액은 마이페이지에서 확인 가능합니다.");
			
			return "redirect:/myPage.me";
			
		}

		//회원 목록
		@RequestMapping("userList.me")
		public String selectUserList(@RequestParam(value="currentPage", required = false , defaultValue ="1") int currentPage, Model model) {
			
			int listCount = memberService.selectUserListCount();
			System.out.println("userListCount : " + listCount );
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			
			ArrayList<Member> list = memberService.selectUserList(pi);
			System.out.println("list의 값 : " + list);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return "member/memberUserList";
		}
		
		//마이페이지 이동 및 목록들 모음
		@RequestMapping("myPage.me")
		public String selectSponsorList(String userId, Model model) {
			
			System.out.println("마이페이지로 넘어온 아이디 : " + userId);
			
			int listCount = memberService.selectSponsorListCount();
			System.out.println("userListCount : " + listCount );
			
			int fdSupListCount = memberService.selectFundingSupporterListCount();
			System.out.println("fdSupListCount : " + fdSupListCount );
			
			
			// 후원 기부 목록		
			ArrayList<Sponsor> sponsorList = memberService.selectSponsorList(userId);
			// 펀딩 기부 목록
			ArrayList<FundingSupporter> fundingSupporterList = memberService.selectFundingSuppoterList(userId);
			
			
			System.out.println("sponsorList의 값 : " + sponsorList);
			System.out.println("fundingSupporterList의 값 : " + fundingSupporterList);
			model.addAttribute("fundingSupporterList", fundingSupporterList);
			model.addAttribute("sponsorList", sponsorList);
			model.addAttribute("userId", userId);
					
			return "member/myPage";
		}
		
//===========================================================================
		// 후원 후기로 이동
//		@RequestMapping("supportReviewList.me")
//			public String supportReviewList() {
//			
//			return "member/supportReviewList";
//		}
		
		//후원 후기 작성하기로 이동
		@RequestMapping("supportReviewWrite.me")
			public String supportReviewWrite(Support support, Model model) {
					
			List<Sponsor> list = memberService.selectSupportList(support);
			System.out.println("list의 값 : " + list);
			
			model.addAttribute("list", list);
			
			System.out.println("model의 값 : " + model );
			
			return "member/supportReviewWrite";
		}
		
		// 후원 후기 상세보기로 이동 supportReviewDetail.me
		@RequestMapping("supportReviewDetail.me")
			public ModelAndView supportReviewDetail(int reNo,  ModelAndView mv) {
				System.out.println("선택한 후기 번호" + reNo);
				
				Review rv = memberService.selectReview(reNo);
				List<ReviewImage> at = memberService.selectReviewImage(reNo);
				
				
				mv.addObject("rv", rv).setViewName("member/supportReviewDetail");
				mv.addObject("at", at).setViewName("member/supportReviewDetail");
				
				System.out.println("rv의 값 " + rv);
				System.out.println("at의 값 " + at);
				System.out.println("mv의 값 " + mv);
				
			return mv;
		}
		
		// 일단 맴버안에서 만든다음 기능이 잘 될 경우 도네이션으로 코드를 옮기자
		
		@RequestMapping("supportReviewList.me")
		public String donationReviewList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
			
			int listCount = memberService.seletDonationReviewListCount();
			System.out.println("listCount의 값 : " + listCount);
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 9);
			System.out.println("pi"+pi);
			
			List<Support> list = memberService.selectDonationReviewList(pi);
			System.out.println("support 의 값 : "+list);
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			System.out.println("model 의 값 : "+model);
			
			return "member/supportReviewList";
			
		}

		

		
//		@RequestMapping(value="insertReview.me")
//		public String insertReview(Review review, MultipartHttpServletRequest request,
//				 @RequestParam(name="file", required=false) MultipartFile file) {
//			
//			review.setReContent((review.getReContent()).replace("\n", "<br>"));
//			System.out.println("작성된 후기를 등록중입니다.");
//			
//			if(!file.getOriginalFilename().equals("")) {
//				String changeName = saveFile(file, request);
//				if(changeName != null) {
//					review.setThumbnailOrigin(file.getOriginalFilename());
//					review.setThumbnailChange(changeName);
//				}
//			}
//			
//			memberService.insertReview(review);
//			
//			return "redirect:supportReviewList.me";
//			
//		}
		
		@RequestMapping("insertReview.me")
		public String insertReview(Review review, HttpServletRequest request, MultipartHttpServletRequest multipartRequest,
				 Model model)throws Exception {
			
			//review.setReContent((review.getReContent()).replace("\n", "<br>"));
			System.out.println("작성된 후기를 등록중입니다.");
			System.out.println("reivew의 값 : " + review );
			
			
			Map<String, MultipartFile> mMap = multipartRequest.getFileMap();
			List<ReviewImage> imgList = new ArrayList<>();
			
//			logger.info("mMap의 값: "+ mMap );
//			logger.info("multipartRequest.getFileMap()의 값: "+ multipartRequest.getFileMap() );
			
			Map<String, List<MultipartFile>> paramMap = multipartRequest.getMultiFileMap();
			for (Entry<String, List<MultipartFile>> entry : paramMap.entrySet()) {
//				logger.info("paramMap의 값: "+ paramMap );
				
				List<MultipartFile> fileList = entry.getValue();
				
//				System.out.println("fileList 의 값 : " + fileList);
				
//				logger.info("paramMap의 값: "+ paramMap );
//				logger.info("fileList 의 값: "+fileList);
//				logger.info("fileList.size() 의 값: "+fileList.size());
				
				for(int i = 0; i < fileList.size(); i++) {
					String fileName=fileList.get(i).getOriginalFilename();
					logger.info("fileName의 값: "+ fileName );
					if(fileName != "") {
						String originName = fileList.get(i).getOriginalFilename();
						String changeName = saveFile(fileList.get(i), request);
						System.out.println("changeName 의 값 : " + changeName);
						if((entry.getKey()).equals("thumbFile")) { //썸네일 들어오는 곳
							review.setThumbnailOrigin(originName);
							review.setThumbnailChange(changeName);
						}
							else if(!(entry.getKey()).equals("files")){
							ReviewImage img = new ReviewImage();
							img.setImgChangeName(changeName);
							img.setImgOriginName(originName);
							System.out.println("img의 값 : " + img);
							img.setImgNo(Integer.valueOf( (entry.getKey()).substring((entry.getKey()).length()-1)));
							logger.info("현재 태그 imgNo: "+ (entry.getKey()).substring((entry.getKey()).length()-1) );
							System.out.println("에러나는 img 의 값 " + img);
							imgList.add(img);	
						}											
				}
				
			}
		}
			logger.info("review :: imgList :: "+ imgList);
			memberService.insertReview(review, imgList);
			
			return "redirect:supportReviewList.me";
			
		}
		
				
		// 후원 후기 댓글 목록
		@ResponseBody
		@RequestMapping(value = "rvList.me", headers="Accept=*/*" , produces = "application/json; charset=utf-8")
		public String selectReviewReplyList(int reNo) {
			System.out.println("경로가 잘 가는지 확인");
			ArrayList<ReviewComment> reviewCommentList = memberService.selectReviewReplyList(reNo);
			System.out.println("reviewCommentList의 값 : " + reviewCommentList);
			
			return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(reviewCommentList);
		}
		
		@ResponseBody
		@RequestMapping("insertReComent.me")
		public String insertReviewReply(ReviewComment rc) {
			int result = memberService.insertReviewReply(rc);
			
			return String.valueOf(result);
			
		}
		
		@ResponseBody
		@RequestMapping(value="reReplydelete.me/{reNo}")
		public String deleteReviewReply(@PathVariable("reNo") int reNo) {
			int result = memberService.deleteReviewReply(reNo);
			System.out.println("reNo의 값 :" + reNo);
			System.out.println("result의 값 : " + result);
			
			return String.valueOf(result);
			
		}
		
		@ResponseBody
		@RequestMapping(value="reReviewupdate.me/{reNo}/{reBno}")
		public String updateReviewReply(@PathVariable("reBno")int suNo, @PathVariable("reNo")int reNo, ReviewComment rc) {
			rc.setReNo(reNo);
			int result = memberService.updateReviewReply(rc);
			return String.valueOf(result);
		}
		
		@ResponseBody
		@RequestMapping(value="Reviewdelete.me/{reNo}")
		public String deleteReview(@PathVariable("reNo") int reNo) {
			int result = memberService.deleteReview(reNo);
			System.out.println("후기 reNo의 값 :" + reNo);
			System.out.println("result의 값 : " + result);
			
			return String.valueOf(result);
			
		}
		
//		@RequestMapping("updateReview.me")
//		public ModelAndView updateReview(Review review, ModelAndView mv, MultipartHttpServletRequest request, 
//				@RequestParam(value="file", required=false) MultipartFile file) {
//			
//			review.setReContent((review.getReContent()).replace("\n", "<br>"));
//			System.out.println("작성된 후기를 수정중입니다.");
//			
//			if(!file.getOriginalFilename().equals("")) {
//				
//				if(review.getThumbnailChange() != null) {
//					deleteFile(review.getThumbnailChange(), request);
//				}
//				
//				String changeName = saveFile(file, request);
//				review.setThumbnailOrigin(file.getOriginalFilename());
//				review.setThumbnailChange(changeName);
//			}
//			
//			memberService.updateReview(review);
//			System.out.println("update 중입니다. 리뷰 객체를 확인 : " + review);
//			mv.addObject("reNo", review.getReNo()).setViewName("redirect:supportReviewDetail.me");
//			System.out.println("후기 업데이트 mv의 값 : " + mv);
//			return mv;
//			
//		}
		
		@RequestMapping("updateReview.me")
		public String updateReview(int reNo, Review review, Model model, HttpServletRequest request, 
				MultipartHttpServletRequest multipartRequest)  throws Exception {
			
			logger.info("updateReview::: " + review);
			//review.setReContent((review.getReContent()).replace("\n", "<br>"));
			System.out.println("작성된 후기를 수정중입니다.");
			
			Map<String, MultipartFile> mMap= multipartRequest.getFileMap(); // key : tag name, value: multipartFile list
			List<ReviewImage> imgList = new ArrayList<>(); // 후기 수정 추가 img 저장하는 리스트
			
			Map<String, List<MultipartFile>> paramMap = multipartRequest.getMultiFileMap();
			for (Entry<String, List<MultipartFile>> entry : paramMap.entrySet()) {
			
				List<MultipartFile> fileList=entry.getValue(); //multipartFile List
				logger.info("현재 태그 name: "+entry.getKey()+fileList.size());
				
				for(int i = 0; i < fileList.size(); i++) {
					String fileName=fileList.get(i).getOriginalFilename();
					logger.info("fileName의 값: "+ fileName );
					if(fileName != "") {
						String originName = fileList.get(i).getOriginalFilename();
						String changeName = saveFile(fileList.get(i), request);
						logger.info("updateReivew:::::: "+ originName+"   "+changeName);
						if((entry.getKey()).equals("thumbFile")) { //썸네일 들어오는 곳
							review.setThumbnailOrigin(originName);
							review.setThumbnailChange(changeName);
						}
							else if(!(entry.getKey()).equals("files")){
							ReviewImage img = new ReviewImage();
							img.setReNo(reNo);
							img.setImgChangeName(changeName);
							img.setImgOriginName(originName);
							System.out.println("img의 값 : " + img);
							img.setImgNo(Integer.valueOf( (entry.getKey()).substring((entry.getKey()).length()-1)));
							logger.info("현재 태그 imgNo: "+ (entry.getKey()).substring((entry.getKey()).length()-1) );
							System.out.println("에러나는 img 의 값 " + img);
							imgList.add(img);	
						}											
					}
				
				}
			}
			
						
			memberService.updateReview(review);
			System.out.println("update 중입니다. 리뷰 객체를 확인 : " + review);
			
			if(!imgList.isEmpty()) {
				memberService.updateNewReivewImageList(imgList);
			}
		
			return "redirect:supportReviewList.me";
			
		}

		
		// 후원 후기 업데이트 폼으로 이동
		@RequestMapping("supportReviewUpdateForm.me")
		public ModelAndView supportReviewUpdate(int reNo, ModelAndView mv) {
			// 수정하는 페이지로 이동하는 코드
			System.out.println("선택한 후기 번호" + reNo);
			
			Review rv = memberService.selectReview(reNo);
			List<ReviewImage> at = memberService.selectReviewImage(reNo);
			
			mv.addObject("rv", rv).setViewName("member/supportReviewUpdateForm");
			mv.addObject("at", at).setViewName("member/supportReviewUpdateForm");;
			
			System.out.println("후기 수정 rv의 값 " + rv);
			System.out.println("후기 수정 at의 값 " + at);
			System.out.println("후기 수정 mv의 값 " + mv);
			
			return mv;
		}
		
		// 게시글 content내에 있는 이미지 저장
		@RequestMapping(value="/member/contentFile", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String uploadFundingSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
			JsonObject jsonObject = new JsonObject();
			String resources = request.getSession().getServletContext().getRealPath("resources");
			String savePath = resources  + "/upload_files/donationReview/";
			
		
			String originalFileName = multipartFile.getOriginalFilename();
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			String saveFileName = UUID.randomUUID()+extension;
			System.out.println("resources : "+resources+"   "+"resources/upload_files/donationReview/" + saveFileName);
				
			File targetFile = new File(savePath+saveFileName);
			
			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile);
				jsonObject.addProperty("url", "resources/upload_files/donationReview/" + saveFileName);
				jsonObject.addProperty("responseCode", "succcess");
			} catch(IOException e) {
				FileUtils.deleteQuietly(targetFile);
				jsonObject.addProperty("responseCode", "error");
				e.printStackTrace();
			}	

			String result = jsonObject.toString();
			return result;
		}
		
		private String saveFile(MultipartFile file, HttpServletRequest request) {
			
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources  + "/upload_files/donationReview/";
			
			System.out.println("savePath"+savePath);
			
			String originName = file.getOriginalFilename();
			String ext = originName.substring(originName.lastIndexOf("."));
			String changeName =System.currentTimeMillis() + "_" + (int)( Math.random() * 10000000) + ext;

			System.out.println("saveFile 메소드 changeName : "+changeName);
				try {
					file.transferTo(new File(savePath+changeName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					throw new CommException("파일 업로드 실패");
				}
			return changeName;
		}
		
		private void deleteFile(String fileName, HttpServletRequest request) {
			// TODO Auto-generated method stub
			String resources=request.getSession().getServletContext().getRealPath("resources");
			String savePath=resources+"/upload_files/donationReview/";
			System.out.println("savePath"+savePath);
			
			File deleteFile= new File(savePath+fileName);
			deleteFile.delete();
			
		}
}			
