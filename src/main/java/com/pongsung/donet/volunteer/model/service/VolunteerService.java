package com.pongsung.donet.volunteer.model.service;

import java.util.ArrayList;
import java.util.List;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.event.model.vo.Event;
import com.pongsung.donet.volunteer.model.vo.VolAttachment;
import com.pongsung.donet.volunteer.model.vo.Volunteer;
import com.pongsung.donet.volunteer.model.vo.VolunteerReply;

public interface VolunteerService {


	int selectVolunteerListCount() throws Exception;

	ArrayList<Volunteer> selectVolunteerList(PageInfo pi) throws Exception;

	Volunteer selectVolunteer(int vno) throws Exception;

	List<VolAttachment> selectVolunteerAttachment(int vno) throws Exception;

	void insertVolunteer(Volunteer vo) throws Exception;

	int choseListCount(String chose);

	ArrayList<Volunteer> choseList(PageInfo pi, String chose);

	ArrayList<Volunteer> sortList(PageInfo pi);

	void deleteVolunteer(int vno);

	void updateVolunteer(Volunteer vo);

	int insertReply(VolunteerReply re);

	ArrayList<VolunteerReply> replyList(int vno);

	int replyUpdate(VolunteerReply volReply);

	int deleteReply(int replyNo);

	ArrayList<Volunteer> searchList(PageInfo pi, String keyword);

	void countVolunteer(int vno);


}
