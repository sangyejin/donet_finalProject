package com.pongsung.donet.donation.model.vo;

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
public class SupporComment {
	private int replyNo;
	private String replyContent;
	private int refBoardNo;
	private String replyWriter;
	private Date createDate;
	private String scSatuts;
}
