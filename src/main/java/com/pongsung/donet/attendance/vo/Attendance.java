package com.pongsung.donet.attendance.vo;

import java.sql.Date;

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
public class Attendance {

	private int attNum; // 출석번호
	private String userId; // 출석한 유저 아이디
	private String attCheck; // 출석여부
	private Date attDate; // 출석한 날짜
	
	
}
