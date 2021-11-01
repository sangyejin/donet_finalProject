package com.pongsung.donet.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.member.model.vo.Bank;
import com.pongsung.donet.member.model.vo.Member;
import com.pongsung.donet.member.model.vo.Payment;

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

	public Member findUserIdMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		System.out.println("===아이디 찾기 오류 찾는중===");

		System.out.println("맴버 다오 sqlSession : " + sqlSession);
		System.out.println("맴버 다오 맴버 m : " + m.getUserId());
		System.out.println("맴버 다오 매버 m 비번 : " + m.getUserPwd());
		System.out.println("맴버 다오 맴버 m : " + m.getEmail());
		System.out.println("맴버 다오 매버 m 비번 : " + m.getPhone());
		
		
		return sqlSession.selectOne("memberMapper.findUserIdMember", m);
	}

	public Member findUserPwdMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		System.out.println("===비밀번호 찾기 오류 찾는중===");

		System.out.println("맴버 다오 sqlSession : " + sqlSession);
		System.out.println("맴버 다오 맴버 m 아이디 : " + m.getUserId());
		System.out.println("맴버 다오 매버 m 이름 : " + m.getUserName());
		System.out.println("맴버 다오 맴버 m 이메일 : " + m.getEmail());
		System.out.println("맴버 다오 매버 m 비밀번호 : " + m.getUserPwd());
		
		return sqlSession.selectOne("memberMapper.findUserPwdMember", m);
	}


	public ArrayList<Bank> selectBkList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectBkList");

	}

	public int insertCard(SqlSessionTemplate sqlSession, Payment payment) {
		return sqlSession.insert("memberMapper.insertCard", payment);
	}

	public int updatePoint(SqlSessionTemplate sqlSession, Payment payment) {
		return sqlSession.update("memberMapper.updatePoint", payment);
		
	}

	public Member selectThisUser(SqlSessionTemplate sqlSession, Payment payment) {
		return sqlSession.selectOne("memberMapper.selectThisUser", payment);
	
	}
	
	public Member selectThisUser(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.selectOne("memberMapper.selectThisUser", loginUser);

	}

	public int updatePointMember(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.update("memberMapper.updatePointMember", loginUser);
	}
	
	public int selectUserListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectUserListCount");
	}

	public ArrayList<Member> selectUserList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1)* pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectUserList", null, rowBounds);
	}

}
