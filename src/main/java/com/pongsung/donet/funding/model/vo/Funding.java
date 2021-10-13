package com.pongsung.donet.funding.model.vo;

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
public class Funding {
	private int fdNo;
	private String fpName;
	private String hostName;
	private String goalPrice;
	private Date startDate;
	private Date closeDate;
	private String contents;
	private Date paymetsDate;
	private int categoryNo;
	private int hits;
	private String status;
	private String thumbnailOriginName;
	private String thumbnailChangeNamel;
	private Date fpWriteDate;
}
