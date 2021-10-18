package com.pongsung.donet.volunteer.model.vo;

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
public class Volunteer {

	private int volNo;
	private String volTitle;
	private String volContent;
	private String volwriter;
	private Date volDate;
	private char volStatus;
	private String volCategory;
	
	
}