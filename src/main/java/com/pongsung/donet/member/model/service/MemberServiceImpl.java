package com.pongsung.donet.member.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.donation.model.vo.Sponsor;
import com.pongsung.donet.donation.model.vo.Support;
import com.pongsung.donet.funding.model.vo.FundingSupporter;
import com.pongsung.donet.member.model.dao.MemberDao;
import com.pongsung.donet.member.model.vo.Bank;
import com.pongsung.donet.member.model.vo.Member;
import com.pongsung.donet.member.model.vo.Payment;
import com.pongsung.donet.member.model.vo.Review;
import com.pongsung.donet.member.model.vo.ReviewComment;
import com.pongsung.donet.member.model.vo.ReviewImage;

@Service
public class MemberServiceImpl implements MemberService {
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m) {
		
		Member loginUser = memberDao.loginMember(sqlSession, m);
		
		System.out.println("로그인 유저 값 : " + loginUser);
		
		if (loginUser == null) {
			throw new CommException("loginUser확인");
		}
		
		System.out.println(bCryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())); 
		
		if(!bCryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			throw new CommException("암호 불일치!!!");
		}
		
		return loginUser;
	}


	@Override
	public void insertMember(Member m) {
		
		int result = memberDao.inserMember(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("회원가입에 실패하였습니다.");
		}
	}


	@Override
	public Member updateMember(Member m) {
		
		int result = memberDao.updateMember(sqlSession, m);
		
		//memberDao.insertMember(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("회원수정에 실패하였습니다.");
		}else {
			Member loginUser = memberDao.loginMember(sqlSession, m);
			return loginUser;
		}
	}


	@Override
	public void deleteMember(String userId) {
		
		int result = memberDao.deleteeMember(sqlSession, userId);
		
		if(result < 0) {
			throw new CommException("회원탈퇴에 실패하였습니다.");
		}
		
	}


	@Override
	public Member updatePwdMember(Member m) {
		
		int result = memberDao.updatePwdMember(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("failed to update the PWD");
		}else {
			Member loginUser = memberDao.loginMember(sqlSession, m);
			return loginUser;
		}
	}


	@Override
	public Member findUserIdMember(Member m) {
		
		Member userInfo = memberDao.findUserIdMember(sqlSession, m);
		System.out.println("서비스 임플 result의 값 : " + userInfo);
		
		if(userInfo == null) {
			throw new CommException("아이디를 찾지 못하였습니다. 다시 시도해주세요.");
		}
		
		return userInfo;
	}


	@Override
	public Member findUserPwdMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m) {
		
		Member userInfo = memberDao.findUserPwdMember(sqlSession, m);
		
		System.out.println("비밀번호 값 : " + userInfo);
		
		if(userInfo == null) {
			throw new CommException("비밀번호를 찾지 못하였습니다. 다시 시도해주세요.");
		}
		
		return userInfo;
	}

	@Override
	public ArrayList<Bank> selectBkList() {
		return memberDao.selectBkList(sqlSession);

	}


	@Override
	public void insertCard(Payment payment) {
		int result = memberDao.insertCard(sqlSession, payment);

		if (result > 0) {
			System.out.println("결제 내역 인서트 완료, 포인트 업데이트 시작");
			
			int updateResult = memberDao.updatePoint(sqlSession, payment);
			
			if(updateResult < 0) {
				throw new CommException("포인트 업데이트 실패");
			}
			
			
		}else {
			throw new CommException("결제 내역 추가 실패");

		}
				
	}


	@Override
	public Member selectThisUser(Payment payment) {
		return memberDao.selectThisUser(sqlSession, payment);
	}


	@Override
	public Member selectThisUser(Member loginUser) {
		return memberDao.selectThisUser(sqlSession, loginUser);
	}


	@Override
	public void updatePoint(Member loginUser) {
		int updateResult = memberDao.updatePointMember(sqlSession, loginUser);
		
		if(updateResult < 0) {
			throw new CommException("포인트 업데이트 실패");
		}
		
	}
	
	@Override
	public int selectUserListCount() {
		// TODO Auto-generated method stub
		return memberDao.selectUserListCount(sqlSession);
	}


	@Override
	public ArrayList<Member> selectUserList(PageInfo pi) {
		// TODO Auto-generated method stub
		return memberDao.selectUserList(sqlSession, pi);
	}


//=====================================================================
	// 후원 후기
	
	@Override
	public int seletDonationReviewListCount() {
		// TODO Auto-generated method stub
		return memberDao.selectDonationReviewListCount(sqlSession);
	}


	@Override
	public List<Support> selectDonationReviewList(PageInfo pi) {
		// TODO Auto-generated method stub
		return memberDao.selectDonationReviewList(sqlSession, pi);
	}


	@Override
	public List<Sponsor> selectSupportList(Support support) {
		// TODO Auto-generated method stub
		return memberDao.selectSupportList(sqlSession, support);
	}


	
	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor={Exception.class,CommException.class})
	@Override
	public void insertReview(Review review, List<ReviewImage> imgList) throws Exception{
		
		int reNo = memberDao.insertReview(sqlSession, review);
		
		if(reNo > 0) {
			if(!imgList.isEmpty()) {
				for(ReviewImage fi: imgList) {
					fi.setReNo(reNo);
					System.out.println("임플 ri의 값 : " + fi);
				}
				int resultInsertImg = memberDao.insertImgList(sqlSession, imgList);
				if(resultInsertImg < 0) {
					throw new CommException("후기 이미지 첨부 등록 실패");
				}
			}
		}else {
			throw new CommException("후기 등록 실패");
		}
		
	}

	// 후기 상세 보기
	@Override
	public Review selectReview(int reNo) {

		Review rv = null;
		int result = memberDao.increaseCount(sqlSession, reNo);
		
		if (result < 0) {
			throw new CommException("조회수 증가 실패");
		}else {
			rv = memberDao.selectReview(sqlSession, reNo);
		}
		
		return rv;
	}


	@Override
	public List<ReviewImage> selectReviewImage(int reNo) {
		// TODO Auto-generated method stub
		return memberDao.selectReviewImage(sqlSession, reNo);
	}


	@Override
	public ArrayList<ReviewComment> selectReviewReplyList(int reNo) {
		
		System.out.println("후원 후기 댓글 리스트 서비스 임플 되는지 확인");
		
		return memberDao.selectReviewReplyList(sqlSession, reNo);
	}


	@Override
	public int insertReviewReply(ReviewComment rc) {
		int result = memberDao.insertReviewReply(sqlSession, rc);
		
		if(result < 0) {
			throw new CommException("후기 댓글 작성 실패");
		}

		return result;
	}


	@Override
	public int deleteReviewReply(int reNo) {

		int result = memberDao.deleteReviewReply(sqlSession, reNo);
		
		if (result < 0) {
			throw new CommException("댓글 삭제 실패");
		}
		
		return result;
	}


	@Override
	public int updateReviewReply(ReviewComment rc) {
		
		int result = memberDao.updateReviewReply(sqlSession, rc);
		
		if (result < 0) {
			throw new CommException("댓글 수정 실패");
		}
		
		return result;
	}


	@Override
	public int deleteReview(int reNo) {
		
		int result = memberDao.deleteReview(sqlSession, reNo);
		
		if (result < 0) {
			throw new CommException("후기 삭지 실패");
		}
		
		return result;
	}


	@Override
	public void updateReview(Review review) throws Exception{
		
		int result = memberDao.updateReview(sqlSession, review);
		
		if (result < 0) {
			throw new CommException("후기 수정 실패");
		}
		
	}


	@Override
	public int selectSponsorListCount() {
		// TODO Auto-generated method stub
		return memberDao.selectSponsorListCount(sqlSession);
	}


	@Override
	public ArrayList<Sponsor> selectSponsorList(String userId) {
		// TODO Auto-generated method stub
		return memberDao.selectSponsorList(sqlSession, userId);
	}


	@Override
	public int selectFundingSupporterListCount() {
		// TODO Auto-generated method stub
		return memberDao.selectFundingSupporterListCount(sqlSession);
	}
	
	
	@Override
	public ArrayList<FundingSupporter> selectFundingSuppoterList(String userId) {
		// TODO Auto-generated method stub
		return memberDao.selectFundingSuppoterList(sqlSession, userId);
	}


	@Override
	public void updateNewReivewImageList(List<ReviewImage> imgList) throws Exception {
		int result=memberDao.updateNewReivewImageList(sqlSession, imgList);
		if(result<0) {
			throw new Exception("후원 후기 사진 update 실패");
		}
	}


	



	


	
		
		
	
	
}
