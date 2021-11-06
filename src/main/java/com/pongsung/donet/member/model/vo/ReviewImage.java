package com.pongsung.donet.member.model.vo;

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
public class ReviewImage {

	private int imgNo; // 후원 후기 번호
	private int reNo; // 첨부파일 번호
	private String imgOriginName; // 이미지 변경된 이름
	private String imgChangeName; // 이미지 기존 이름
	
}
