package com.pongsung.donet.attendance.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pongsung.donet.attendance.service.AttendanceService;
import com.pongsung.donet.attendance.service.AttendanceServiceImpl;
import com.pongsung.donet.member.controller.MemberController;

@Controller
@RequestMapping("attendance/Calendar")
public class AttendanceController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private AttendanceService attendanceService;
	
	@Autowired
	private AttendanceServiceImpl attendanceServiceImpl;
	
	
}
