package com.pongsung.donet.volunteer.model.service;

import java.util.ArrayList;
import java.util.List;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.volunteer.model.vo.VolAttachment;
import com.pongsung.donet.volunteer.model.vo.Volunteer;

public interface VolunteerService {


	int selectVolunteerListCount();

	ArrayList<Volunteer> selectVolunteerList(PageInfo pi);

	void insertVolunteer(Volunteer vo, List<VolAttachment> attList);

	Volunteer selectVolunteer(int vno);

	List<VolAttachment> selectVolunteerAttachment(int vno);

}
