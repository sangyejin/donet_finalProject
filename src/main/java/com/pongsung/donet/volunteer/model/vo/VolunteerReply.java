package com.pongsung.donet.volunteer.model.vo;

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
public class VolunteerReply {

	private int volReplyNo; 		//댓글 번호 
	private int volRefNo;			//참조 게시글 번호 
	private String volReplyWriter; 	//댓글 작성자 
	private String volReplyContent; //댓글 내용 
	private String volReplyStatus;	//댓글 상태 (공개,비공개)
	private Date volReplyDate;		//댓글 작성일 
	
}
