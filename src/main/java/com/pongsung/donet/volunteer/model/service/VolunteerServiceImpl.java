package com.pongsung.donet.volunteer.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.event.model.vo.Attachment;
import com.pongsung.donet.volunteer.model.dao.VolunteerDao;
import com.pongsung.donet.volunteer.model.vo.VolAttachment;
import com.pongsung.donet.volunteer.model.vo.Volunteer;
@Service
public class VolunteerServiceImpl implements VolunteerService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private VolunteerDao volunteerDao;
	

	@Override
	public int selectVolunteerListCount() {
		// TODO Auto-generated method stub
		return volunteerDao.selectVolunteerListCount(sqlSession);
	}

	@Override
	public ArrayList<Volunteer> selectVolunteerList(PageInfo pi) {
		// TODO Auto-generated method stub
		return volunteerDao.selectVolunteerList(sqlSession, pi);
	}

	@Override
	public void insertVolunteer(Volunteer vo, List<VolAttachment> attList) {
		int result = volunteerDao.insertVolunteer(sqlSession, vo);
		if(result > 0) {
			for(VolAttachment at : attList) {
				at.setRefVolunteerNo(result);
			}
			if(!attList.isEmpty()) {
				int result2 = volunteerDao.insertVolunteerAttach(sqlSession, attList);
				if(result2 < 0) {
					throw new CommException(" 추가 사진 등록실패 ");
				}
			}
		}else {
			throw new CommException("이벤트 등록 실패 ");
		}
		
	}

	@Override
	public Volunteer selectVolunteer(int vno) {
		// TODO Auto-generated method stub
		return volunteerDao.selectVolunteer(sqlSession, vno);
	}

	@Override
	public List<VolAttachment> selectVolunteerAttachment(int vno) {
		// TODO Auto-generated method stub
		return volunteerDao.selectVolunteerAttachment(sqlSession, vno);
	}

}
