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
public class FundingGoods {
	private int fpNo;
	private int fgNo;
	private String fgName;
	private String fgContent;
	private int fgPrice;
}
