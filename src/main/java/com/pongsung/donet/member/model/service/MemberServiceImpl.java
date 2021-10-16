package com.pongsung.donet.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.member.model.dao.MemberDao;
import com.pongsung.donet.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m) {
		
		Member loginUser = memberDao.loginMember(sqlSession, m);
		
		if (loginUser == null) {
			throw new CommException("loginUser확인");
		}
		
		System.out.println(bCryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())); 
		
		if(!bCryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			throw new CommException("암호 불일치!!!");
		}
		
		return loginUser;
	}


	@Override
	public void insertMember(Member m) {
		
		int result = memberDao.inserMember(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("회원가입에 실패하였습니다.");
		}
	}


	@Override
	public Member updateMember(Member m) {
		
		int result = memberDao.updateMember(sqlSession, m);
		
		//memberDao.insertMember(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("회원수정에 실패하였습니다.");
		}else {
			Member loginUser = memberDao.loginMember(sqlSession, m);
			return loginUser;
		}
	}


	@Override
	public void deleteMember(String userId) {
		
		int result = memberDao.deleteeMember(sqlSession, userId);
		
		if(result < 0) {
			throw new CommException("회원탈퇴에 실패하였습니다.");
		}
		
	}


	@Override
	public Member updatePwdMember(Member m) {
		
		int result = memberDao.updatePwdMember(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("failed to update the PWD");
		}else {
			Member loginUser = memberDao.loginMember(sqlSession, m);
			return loginUser;
		}
	}

}
