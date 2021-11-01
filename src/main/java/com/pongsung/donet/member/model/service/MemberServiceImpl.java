package com.pongsung.donet.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.member.model.dao.MemberDao;
import com.pongsung.donet.member.model.vo.Bank;
import com.pongsung.donet.member.model.vo.Member;
import com.pongsung.donet.member.model.vo.Payment;

@Service
public class MemberServiceImpl implements MemberService {
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m) {
		
		Member loginUser = memberDao.loginMember(sqlSession, m);
		
		System.out.println("로그인 유저 값 : " + loginUser);
		
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


	@Override
	public Member findUserIdMember(Member m) {
		
		Member userInfo = memberDao.findUserIdMember(sqlSession, m);
		System.out.println("서비스 임플 result의 값 : " + userInfo);
		
		if(userInfo == null) {
			throw new CommException("아이디를 찾지 못하였습니다. 다시 시도해주세요.");
		}
		
		return userInfo;
	}


	@Override
	public Member findUserPwdMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m) {
		
		Member userInfo = memberDao.findUserPwdMember(sqlSession, m);
		
		System.out.println("비밀번호 값 : " + userInfo);
		
		if(userInfo == null) {
			throw new CommException("비밀번호를 찾지 못하였습니다. 다시 시도해주세요.");
		}
		
		return userInfo;
	}

	@Override
	public ArrayList<Bank> selectBkList() {
		return memberDao.selectBkList(sqlSession);

	}


	@Override
	public void insertCard(Payment payment) {
		int result = memberDao.insertCard(sqlSession, payment);

		if (result > 0) {
			System.out.println("결제 내역 인서트 완료, 포인트 업데이트 시작");
			
			int updateResult = memberDao.updatePoint(sqlSession, payment);
			
			if(updateResult < 0) {
				throw new CommException("포인트 업데이트 실패");
			}
			
			
		}else {
			throw new CommException("결제 내역 추가 실패");

		}
				
	}


	@Override
	public Member selectThisUser(Payment payment) {
		return memberDao.selectThisUser(sqlSession, payment);
	}


	@Override
	public Member selectThisUser(Member loginUser) {
		return memberDao.selectThisUser(sqlSession, loginUser);
	}


	@Override
	public void updatePoint(Member loginUser) {
		int updateResult = memberDao.updatePointMember(sqlSession, loginUser);
		
		if(updateResult < 0) {
			throw new CommException("포인트 업데이트 실패");
		}
		
	}
	
	@Override
	public int selectUserListCount() {
		// TODO Auto-generated method stub
		return memberDao.selectUserListCount(sqlSession);
	}


	@Override
	public ArrayList<Member> selectUserList(PageInfo pi) {
		// TODO Auto-generated method stub
		return memberDao.selectUserList(sqlSession, pi);
	}
	
}
