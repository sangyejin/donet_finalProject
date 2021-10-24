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
public class Sponsor {
	private String userId; //후원인(사용자)
	private int suNo; //후원 프로젝트 번호
	private int payNo; //결제수단 번호
	private int amount; //결제금액
	private int total;
}
