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
public class SupportImage {
	private int suNo;
	private int imgNo;
	private String imgOriginName;
	private String imgChangeName;
}
