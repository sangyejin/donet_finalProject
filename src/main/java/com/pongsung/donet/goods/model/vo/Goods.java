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
public class Goods {
	private int goodsNo;
	private String goodsName;
	private int goodsPrice;
	private int goodsCategoryNo;
	private int goodsCategoryName;
	private String content;
	private String thumbnailOriginName;
	private String thumbnailChangeName;
	private int hits;
}
