package com.pongsung.donet.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.donation.model.vo.Sponsor;
import com.pongsung.donet.donation.model.vo.Support;
import com.pongsung.donet.funding.model.vo.FundingSupporter;
import com.pongsung.donet.member.model.vo.Bank;
import com.pongsung.donet.member.model.vo.Member;
import com.pongsung.donet.member.model.vo.Payment;
import com.pongsung.donet.member.model.vo.Review;
import com.pongsung.donet.member.model.vo.ReviewComment;
import com.pongsung.donet.member.model.vo.ReviewImage;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		System.out.println("맴버 다오 sqlSession : " + sqlSession);
		System.out.println("맴버 다오 맴버 m : " + m.getUserId());
		System.out.println("맴버 다오 매버 m 비번 : " + m.getUserPwd());
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int inserMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int deleteeMember(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.deleteMember", userId);
	}

	public int updatePwdMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updatePwdMember", m);
	}

	public Member findUserIdMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		System.out.println("===아이디 찾기 오류 찾는중===");

		System.out.println("맴버 다오 sqlSession : " + sqlSession);
		System.out.println("맴버 다오 맴버 m : " + m.getUserId());
		System.out.println("맴버 다오 매버 m 비번 : " + m.getUserPwd());
		System.out.println("맴버 다오 맴버 m : " + m.getEmail());
		System.out.println("맴버 다오 매버 m 비번 : " + m.getPhone());
		
		
		return sqlSession.selectOne("memberMapper.findUserIdMember", m);
	}

	public Member findUserPwdMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		System.out.println("===비밀번호 찾기 오류 찾는중===");

		System.out.println("맴버 다오 sqlSession : " + sqlSession);
		System.out.println("맴버 다오 맴버 m 아이디 : " + m.getUserId());
		System.out.println("맴버 다오 매버 m 이름 : " + m.getUserName());
		System.out.println("맴버 다오 맴버 m 이메일 : " + m.getEmail());
		System.out.println("맴버 다오 매버 m 비밀번호 : " + m.getUserPwd());
		
		return sqlSession.selectOne("memberMapper.findUserPwdMember", m);
	}


	public ArrayList<Bank> selectBkList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectBkList");

	}

	public int insertCard(SqlSessionTemplate sqlSession, Payment payment) {
		return sqlSession.insert("memberMapper.insertCard", payment);
	}

	public int updatePoint(SqlSessionTemplate sqlSession, Payment payment) {
		return sqlSession.update("memberMapper.updatePoint", payment);
		
	}

	public Member selectThisUser(SqlSessionTemplate sqlSession, Payment payment) {
		return sqlSession.selectOne("memberMapper.selectThisUser", payment);
	
	}
	
	public Member selectThisUser(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.selectOne("memberMapper.selectThisUser", loginUser);

	}

	public int updatePointMember(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.update("memberMapper.updatePointMember", loginUser);
	}
	
	public int selectUserListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectUserListCount");
	}

	public ArrayList<Member> selectUserList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1)* pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectUserList", null, rowBounds);
	}

//=====================================================================================	
	
	public int selectDonationReviewListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectDonationReviewListCount");
	}

	public List<Support> selectDonationReviewList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (List)sqlSession.selectList("memberMapper.selectDonationReviewList", null, rowBounds);
	}
	
	// 회원이 기부한 후원 목록을 후기 작성때 목록으로 불러옴
	public List<Sponsor> selectSupportList(SqlSessionTemplate sqlSession, Support support) {
		// TODO Auto-generated method stub
		return (List)sqlSession.selectList("memberMapper.selectSupportList", support);
	}

	public int insertReview(SqlSessionTemplate sqlSession, Review review) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertReview", review);
	}

	public Review selectReview(SqlSessionTemplate sqlSession, int reNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectReview", reNo);
	}

	public List<ReviewImage> selectReviewImage(SqlSessionTemplate sqlSession, int reNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memberMapper.selectReviewImage", reNo);
	}

	public ArrayList<ReviewComment> selectReviewReplyList(SqlSessionTemplate sqlSession, int reNo) {
		
		System.out.println("후원 후기 댓글 리스트 다오 되는지 확인");
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectReviewReplyList", reNo);
	}

	public int insertReviewReply(SqlSessionTemplate sqlSession, ReviewComment rc) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertReviewReply", rc);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int reNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.increaseCount", reNo);
	}

	public int deleteReviewReply(SqlSessionTemplate sqlSession, int reNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.deleteReviewReply", reNo);
	}

	public int updateReviewReply(SqlSessionTemplate sqlSession, ReviewComment rc) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateReviewReply", rc);
	}

	public int deleteReview(SqlSessionTemplate sqlSession, int reNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.deleteReview", reNo);
	}

	public int updateReview(SqlSessionTemplate sqlSession, Review review) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateReview", review);
	}

	public Review reviewInfo(SqlSessionTemplate sqlSession, Review review) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.reviewInfo", review);
	}

	public int updateReviewImage(SqlSessionTemplate sqlSession, List<ReviewImage> reImgList) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateReviewImage", reImgList);
	}
// 마이페이지 목록 모음
	public int selectSponsorListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectSponsorListCount");
	}

	public ArrayList<Sponsor> selectSponsorList(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("memberMapper.selectSponsorList", userId);
	}
	
	public int selectFundingSupporterListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("fundingMapper.selectFundingSupporterListCount");
	}
	
	public ArrayList<FundingSupporter> selectFundingSuppoterList(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("fundingMapper.selectFundingSuppoterList", userId);
	}

}
