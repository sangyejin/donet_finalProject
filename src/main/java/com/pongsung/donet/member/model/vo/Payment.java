package com.pongsung.donet.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Payment {
	/*PAY_NO	NUMBER	No
		USER_ID	VARCHAR2(30 BYTE)	No
		CARD_NO	VARCHAR2(100 BYTE)	Yes
		PAY_CVC	NUMBER	Yes
		PAY_EXPIRY	NUMBER	Yes
		PAY_ACCOUNT	VARCHAR2(100 BYTE)	Yes
		PAY_NAME	VARCHAR2(30 BYTE)	No
		B_NO	NUMBER	No
		*/
	
	private int payNo; //결제번호
	private String userId; //아이디 -현재로그인된 유저
	private String cardNo; //카드번호
	private int payCvc; //CVC번호
	private int payExpiry; // 카드 유효기간
	private String payName; //예금주
	private int bNo; //은행번호
	private int pointAmount; //포인트

}
