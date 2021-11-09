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
public class Review {
	
	private int reNo; // 후기번호
	private String userId; // 작성자
	private String reTitle; // 후기제목
	private String reSuTitle; // 후원한 종목 제목
	private String reContent; // 후기내용
	private int reCount; // 후기 조회수
	private Date reDate; // 작성일
	private String thumbnailOrigin; //썸네일 원본명
	private String thumbnailChange; //썸네일 변경명 // 변경완료 
	private String reStatus; // 후기 상태
	
}
