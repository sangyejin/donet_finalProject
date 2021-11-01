package com.pongsung.donet.member.model.service;

import java.util.ArrayList;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.member.model.vo.Member;

public interface MemberService {
	
	Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m);

	void insertMember(Member m);

	Member updateMember(Member m);

	void deleteMember(String userId);

	Member updatePwdMember(Member m);

	Member findUserIdMember(Member m);

	Member findUserPwdMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m);

	int selectUserListCount();

	ArrayList<Member> selectUserList(PageInfo pi);

}
