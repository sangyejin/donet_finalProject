package com.pongsung.donet.goods.model.vo;

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
public class Beneficiary {
	private int beNo;
	private String beName;
	private String beTel;
	private String beAddress;
	private String beEmail;
	private Date beRegistration;
}
