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
public class GoodsPurchase {
	private int purchaseNo;
	private String userId;
	private int beneficiaryNo;
	private String beneficiaryName;
	private int goodsNo;
	private int purchaseAmount;
	private int purchasePrice;
	private Date purchaseDate;
}
