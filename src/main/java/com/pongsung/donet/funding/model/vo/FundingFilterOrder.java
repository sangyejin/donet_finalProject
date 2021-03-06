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
public class FundingFilterOrder {
	private int categoryNo;
	private String period;
	private String order;
	private String search;
}
