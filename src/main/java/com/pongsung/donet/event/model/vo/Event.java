package com.pongsung.donet.event.model.vo;

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
public class Event {

	private int eventNo;
	private String eventTitle;
	private String eventContent;
	private String eventOrigin;
	private String eventChange;
	private Date eventStart;
	private Date eventLast;
	private String eventStatus;
	
}
