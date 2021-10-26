package com.pongsung.donet.funding.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class FundingSupporter {
	private int fsNo; //후원 번호
	private int fpNo; //프로젝트 번호
	private String fpSupporter; //후원자 아이디
	private Date fpSupportDate; //후원신청 날짜
	private int fpPrice; //후원 포인트
	private int fgNo; //선물번호
	private String takeName; //받는이 이름
	private String takeAddress; //받는이 주소
	private String takePhone; //받는이 전화번호
	private int takePostCode; //받는이 우편번호
	
}
