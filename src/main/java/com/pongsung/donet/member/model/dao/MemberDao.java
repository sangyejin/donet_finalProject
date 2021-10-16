package com.pongsung.donet.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pongsung.donet.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		System.out.println("맴버 다오 sqlSession : " + sqlSession);
		System.out.println("맴버 다오 맴버 m : " + m.getUserId());
		System.out.println("맴버 다오 매버 m 비번 : " + m.getUserPwd());
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int inserMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int deleteeMember(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.deleteMember", userId);
	}

	public int updatePwdMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updatePwdMember", m);
	}

}
