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
public class FundingReply {
	private int replyNo;
	private String writerId;
	private String writerNickName;
	private int refFundingNo;
	private Date createDate;
	private String replyContent;
}
