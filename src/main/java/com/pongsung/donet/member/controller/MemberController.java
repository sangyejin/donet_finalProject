package com.pongsung.donet.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.Pagination;
import com.pongsung.donet.member.model.service.MemberService;
import com.pongsung.donet.member.model.service.MemberServiceImpl;
import com.pongsung.donet.member.model.vo.Bank;
import com.pongsung.donet.member.model.vo.Member;
import com.pongsung.donet.member.model.vo.Payment;

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
		@RequestMapping("myPage.me")
		public String myPage() {
			return "member/myPage";
		}
		
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
		public String deleteMember(String userId) {
			
			memberService.deleteMember(userId);
			
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
			
			return "member/myPage";
			
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
				status.isComplete(); 
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
		
		//후원프로젝트 후원 후 포인트 업데이트
		@RequestMapping("supportAfterPoints")
		public String supportAfterPoints(int point, HttpServletRequest request, Model model) {
			HttpSession session = request.getSession();
			Member loginUser = (Member) session.getAttribute("loginUser");
			
			System.out.println(point);
			loginUser.setPoint(point);
		
			memberService.updatePoint(loginUser);
			
			Member thisUser = memberService.selectThisUser(loginUser);
			
			
			System.out.println("loginUser.getPoint() : " + loginUser.getPoint());
			System.out.println("thisUser.getPoint() : " + thisUser.getPoint());
			
			model.addAttribute("loginUser", thisUser);
			
			return "donation/donationMain";
			
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
		
		// 후원 프로젝트 댓글로 이동
		@RequestMapping("supportReply.me")
			public String selectUserList() {
			
			return "member/supportReply";
		}
		
}
