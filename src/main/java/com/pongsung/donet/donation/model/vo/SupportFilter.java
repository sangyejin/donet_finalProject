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
public class SupportFilter {
	private String global;
	private String environment;	
	private String animal;	
	private String child;
	private String vulnerable;	
}
