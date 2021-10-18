package com.pongsung.donet.event.model.vo;

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
public class EventReply {

	private int eventReplyNo;			//댓글 번호 
	private int refEventNo;				//참조 게시글 번호 
	private String eventReplyWriter;	//댓글 작성자 
	private String eventReplyContent;	//댓글 내용
	private String eventReplyStatus;	//댓글 상태 (공개,비공개)
	private Date eventReplyDate;		//댓글 작성일 
	
}
