package com.pongsung.donet.member.model.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.pongsung.donet.member.model.vo.Member;

public interface MemberService {
	
	Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m);

	void insertMember(Member m);

	Member updateMember(Member m);

	void deleteMember(String userId);

	Member updatePwdMember(Member m);

}
