package com.pongsung.donet.volunteer.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.volunteer.model.vo.VolAttachment;
import com.pongsung.donet.volunteer.model.vo.Volunteer;
@Repository
public class VolunteerDao {

	public int selectVolunteerListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("volunteerMapper.selectVolunteerListCount");
	}

	public ArrayList<Volunteer> selectVolunteerList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("volunteerMapper.selectVolunteerList", null, rowBounds);
	}


	public int insertVolunteerAttach(SqlSessionTemplate sqlSession, List<VolAttachment> attList) {
		// TODO Auto-generated method stub
		return sqlSession.insert("volunteerMapper.insertVolunteerAttach", attList);
	}

	public int insertVolunteer(SqlSessionTemplate sqlSession, Volunteer vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("volunteerMapper.insertVolunteer", vo);
	}

	public Volunteer selectVolunteer(SqlSessionTemplate sqlSession, int vno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("volunteerMapper.selectVolunteer", vno);
	}

	public List<VolAttachment> selectVolunteerAttachment(SqlSessionTemplate sqlSession, int vno) {
		// TODO Auto-generated method stub
		return  sqlSession.selectList("volunteerMapper.selectVolunteerAttachment", vno);
	}

	public void countVolunteer(SqlSessionTemplate sqlSession, int vno) {
		// TODO Auto-generated method stub
		  sqlSession.selectOne("volunteerMapper.countVolunteer", vno);
	}

	public int choseListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("volunteerMapper.choseListCount");
	}

	public ArrayList<Volunteer> choseList(SqlSessionTemplate sqlSession, PageInfo pi, String chose) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("volunteerMapper.choseList",chose);
	}

	public ArrayList<Volunteer> sortList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("volunteerMapper.sortList", null, rowBounds);
	}

}
