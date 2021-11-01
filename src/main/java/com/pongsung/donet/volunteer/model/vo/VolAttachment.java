package com.pongsung.donet.volunteer.model.vo;


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
public class VolAttachment {

	private int fileNo;			// 파일 고유 번호
	private String originName;	// 파일 원본명
	private String changeName;	// 파일 수정명
	private String fileLocation;	// 파일이 저장된 폴더 경로
	private int refVolunteerNo;		// 참조하고 있는 게시글 번호
	
}
