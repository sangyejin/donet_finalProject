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
public class FundingImage {
	private int fpNo;
	private int imgNo;
	private String imgOriginName;
	private String imgChangeName;
}
