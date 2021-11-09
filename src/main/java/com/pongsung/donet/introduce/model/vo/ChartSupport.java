package com.pongsung.donet.introduce.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
public class ChartSupport {
	private int suNo; //번호
	private String suTitle; //후원명
	private String suWriter; //주최자

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date suStart; //시작일
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date suLast; //마감일
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date suDate; //작성일
	
	private String content;
	private String target;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date bstart; //사업시작일
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date blast; //사업마감일
	
	private String thumbnailOrigin; //썸네일 원본명
	private String thumbnailChange; //썸네일 변경명 //변경완료//NOTION에 업데이트해야함
	private int categoryNo;
	private String status;
	private int total;
	private int totalamount;
	private int hits;
	private int ddate;
	private long goal;
	
}
