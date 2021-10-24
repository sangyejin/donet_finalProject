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
	private int fpNo;
	private String fpName;
	private String hostName;
	private String hostId;
	private String goal;
	private String raised;
	private Date startDate;
	private Date closeDate;
	private String content;
	private Date paymentDate;
	private String categoryName;
	private int categoryNo;
	private int hits;
	private String status;
	private String thumbnailOriginName;
	private String thumbnailChangeName;
	private int numberSupporter;
	private Date fpWriteDate;
	
}
