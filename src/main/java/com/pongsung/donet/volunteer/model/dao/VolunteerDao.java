package com.pongsung.donet.volunteer.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.volunteer.model.vo.VolAttachment;
import com.pongsung.donet.volunteer.model.vo.Volunteer;
import com.pongsung.donet.volunteer.model.vo.VolunteerReply;
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

	public int countVolunteer(SqlSessionTemplate sqlSession, int vno) {
		return sqlSession.update("volunteerMapper.countVolunteer", vno);
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

	public int deleteVolunteer(SqlSessionTemplate sqlSession, int vno) {
		// TODO Auto-generated method stub
		return sqlSession.update("volunteerMapper.deleteVolunteer", vno);
	}

	public int updateVolunteer(SqlSessionTemplate sqlSession, Volunteer vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("volunteerMapper.updateVolunteer", vo);
	}

	public int insertReply(SqlSessionTemplate sqlSession, VolunteerReply re) {
		// TODO Auto-generated method stub
		return sqlSession.insert("volunteerMapper.insertReply", re);
	}

	public ArrayList<VolunteerReply> replyList(SqlSessionTemplate sqlSession, int vno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("volunteerMapper.replyList", vno);
	}

	public int replyUpdate(SqlSessionTemplate sqlSession, VolunteerReply volReply) {
		// TODO Auto-generated method stub
		return sqlSession.update("volunteerMapper.replyUpdate", volReply);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("volunteerMapper.deleteReply", replyNo);
	}

	public ArrayList<Volunteer> searchList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("volunteerMapper.searchList", keyword);
	}

}
