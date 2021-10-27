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
public class SupporComment {

	private int scNo;
	private String comment;
	private int suNo;
	private String scWriter;
	private Date scdate;
	private String scSatuts;
}
