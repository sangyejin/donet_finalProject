package com.pongsung.donet.attendance.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pongsung.donet.attendance.model.vo.Attendance;
import com.pongsung.donet.member.model.vo.Member;

@Repository
public class AttendanceDao {

	public List<Attendance> getCheck(SqlSessionTemplate sqlSession, Attendance a) {
		// TODO Auto-generated method stub
		return (List)sqlSession.selectList("attendanceMapper.getCheck", a);
	}

	public ArrayList getAttCheck(SqlSessionTemplate sqlSession, Attendance a2) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("attendanceMapper.getAttCheck", a2);
	}

	public int checkInsert(SqlSessionTemplate sqlSession, Attendance a) {
		// TODO Auto-generated method stub
		return sqlSession.insert("attendanceMapper.checkInsert", a);
	}
	
	public Member getMemberPoint(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.getMemberPoint", m);
	}
	
	public int pointUpdate(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.pointUpdate", m);
	}

}
