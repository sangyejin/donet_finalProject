package com.pongsung.donet.attendance.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pongsung.donet.attendance.model.dao.AttendanceDao;
import com.pongsung.donet.attendance.model.vo.Attendance;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.member.model.vo.Member;

@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AttendanceDao attendanceDao;
	
	@Override
	public List<Attendance> getCheck(Attendance a) {
		
		return attendanceDao.getCheck(sqlSession, a);
	}

	@Override
	public ArrayList getAttCheck(Attendance a2) {

		return attendanceDao.getAttCheck(sqlSession, a2);
	}

	@Override
	public Member getMemberPoint(Member m) {
		
		return attendanceDao.getMemberPoint(sqlSession, m);
	}

	@Override
	public int checkInsert(Attendance a) {
		
		return attendanceDao.checkInsert(sqlSession, a);
	}

	@Override
	public void pointUpdate(Member m) {
		
		int result = attendanceDao.pointUpdate(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("포인트 업데이트가 실패하였습니다.");
		}
		
	}

}
