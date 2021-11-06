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
public class ReviewComment {
	
	private int reNo; // 후원 후기 댓글 번호
	private String reContent; // 후원후기 댓글 내용
	private int reBno; // 게시글 번호
	private String reWriter; // 작성자
	private Date reCreateDate; // 댓글 작성일
	private String reSatuts; // 댓글 상태
	
	
}
