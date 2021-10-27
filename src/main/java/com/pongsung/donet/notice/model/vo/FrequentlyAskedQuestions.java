package com.pongsung.donet.notice.model.vo;

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

public class FrequentlyAskedQuestions {
	private int rowNum;
	private int faqNo;
	private String faqQuestion;
	private String faqAnswered;
	private int faqType;
	private String faqTypeName;

}