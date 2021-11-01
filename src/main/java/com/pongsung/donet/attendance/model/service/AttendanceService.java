package com.pongsung.donet.attendance.model.service;

import java.util.ArrayList;
import java.util.List;

import com.pongsung.donet.attendance.model.vo.Attendance;
import com.pongsung.donet.member.model.vo.Member;

public interface AttendanceService {

	List<Attendance> getCheck(Attendance a);

	ArrayList getAttCheck(Attendance a2);

	Member getMemberPoint(Member m);

	int checkInsert(Attendance a);

	void pointUpdate(Member m);

}
