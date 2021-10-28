package com.pongsung.donet.attendance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pongsung.donet.attendance.service.AttendanceService;
import com.pongsung.donet.attendance.service.AttendanceServiceImpl;

@Controller
@RequestMapping("attendance/Calendar")
public class AttendanceController {

	@Autowired
	private AttendanceService attendanceService;
	
	@Autowired
	private AttendanceServiceImpl attendanceServiceImpl;
	
	
}
