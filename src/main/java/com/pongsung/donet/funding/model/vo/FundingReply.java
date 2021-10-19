package com.pongsung.donet.funding.model.vo;

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
	private String replyWriter;
	private int refFundingNo;
	private String peplyContent;
}
