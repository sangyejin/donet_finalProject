package com.pongsung.donet.attendance.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.pongsung.donet.attendance.model.service.AttendanceService;
import com.pongsung.donet.attendance.model.service.AttendanceServiceImpl;
import com.pongsung.donet.attendance.model.vo.Attendance;
import com.pongsung.donet.member.controller.MemberController;
import com.pongsung.donet.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class AttendanceController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private AttendanceService attendanceService;
	
	@Autowired
	private AttendanceServiceImpl attendanceServiceImpl;
	
	@RequestMapping("calendar.at")
	public String enrollForm() {
		//logger.debug("====== START ========");
		//logger.info("====== START info ========");
		return "attendance/Calendar";
	}
	
	@GetMapping("calendar.at")
	public ModelAndView Calendar(Attendance a, HttpSession session) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		//출석체크 데이터를 가져오는 리스트 입니다.
		Member m = (Member) session.getAttribute("loginUser");
		a.setUserId(m.getUserId());
		
		List<Attendance> attL = attendanceService.getCheck(a);
		System.out.println("attL 의 값 : " + attL);
		
		Attendance a2 = new Attendance();
		a2.setUserId(m.getUserId());
		
		// 출석한 날짜를 표시해주기
		ArrayList mCheck = attendanceService.getAttCheck(a2);
		System.out.println("mCheck의 값 : " + mCheck);
		
		
		mv.addObject("mCheck", mCheck);
		mv.addObject("getCheck", attL);
		mv.setViewName("attendance/Calendar");
		
		return mv;
		
	}
	

	
	@ResponseBody
	@PostMapping("checkInsert")
	public String checkInsert(Attendance a, Member m, HttpSession session) throws Exception {
		
		m.setUserId(a.getUserId());
		
		// 포인트를 가지고 와서
		m = attendanceService.getMemberPoint(m); 
		
		// 1500포인트를 더해줍니다.
		int memberPoint = m.getPoint()+1500;
		
		System.out.println("맴버 포인트  + 1500 : " + memberPoint);
		int result = attendanceService.checkInsert(a);
		
		//session.setAttribute("msg", "출석 실패!!");
		
		if(result > 0) {			
			// 출석되었을 때 1500 포인트를 셋팅해주고 세션에 담아줍니다.
			m.setPoint(memberPoint);
			attendanceService.pointUpdate(m);
			session.setAttribute("member", m);
			session.setAttribute("msg", "출석되었습니다. 1500포인트가 적립되었습니다.");
			
		}
		
		//포인트 리스트 기록 추가하기
		//System.out.println("memberNick : " + m.getUserNick());
		
		return "Welcome!!";
		
	}
	
	
}
