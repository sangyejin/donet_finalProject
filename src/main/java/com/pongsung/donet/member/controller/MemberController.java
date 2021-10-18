package com.pongsung.donet.member.controller;

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

import com.pongsung.donet.member.model.service.MemberService;
import com.pongsung.donet.member.model.service.MemberServiceImpl;
import com.pongsung.donet.member.model.vo.Member;

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
			
			status.isComplete(); // 현재 컨트롤러에  @SessionAttributes에 의해 저장된 오브젝트를 제거합니다.
			
			return "redirect:/";
		} 
		
		
		@RequestMapping("enrollForm.me")
		public String enrollForm() {
			//logger.debug("====== START ========");
			//logger.info("====== START info ========");
			return "member/memberEnrollForm";
		}
		
		@RequestMapping("myPage.me")
		public String myPage() {
			return "member/myPage";
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
																 @RequestParam("newPwd") String newPwd, Model model) {
			
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
				return "member/myPage";
			}else {
				model.addAttribute("msg", "비밀번호 변경에 실패했습니다.");
				 return "common/errorPage";
			}
			 	
			
		}
	
}
