package com.pongsung.donet.notice.model.vo;

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

public class Ask {
	private int rowNum;
	private int askNo;
	private String askTitle;
	private String askContent;
	private String askOriginImg;
	private String askNewImg;
	private String askId;
	private String answered;
	private String askTypeName;
	private Date askDate;
	private String askStatus;
	private String userRole;


}