package com.pongsung.donet.donation.model.vo;

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
public class SupportUsePlan {

	private int suNo;
	private int upNo;
	private String content;
	private int amount;
	private String division;
}
