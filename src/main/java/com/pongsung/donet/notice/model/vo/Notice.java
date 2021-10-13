package com.pongsung.donet.notice.model.vo;

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
public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private String noticeWriter;
	private int noticeCount;
	private char noticeSave; //임시 저장 여부
	private char noticeStatus; //관리자 상태 관리 컬럼

}
