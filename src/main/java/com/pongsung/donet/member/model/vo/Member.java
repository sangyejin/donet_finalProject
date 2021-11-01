package com.pongsung.donet.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Member {
	
	private String userId; // 유저 ID
	private String userPwd; // 유저 비번
	private String userName; // 유저 이름
	private String userNick; // 유저 닉네임
	private String address; // 유저 주소
	private String email; // 유저 이메일
	private String phone; // 유저 전화번호
	private String birthdate; // 유저 생년월일
	private String userRole; // 유저 역할(개인, 단체, 기업)
	private String status; // 유저 상태
	private Date enrollDate; // 유저 가입일
	private Date modifyDate; // 유저 계정 수정일
	private int point; // 유저 포인트
	
	
}
