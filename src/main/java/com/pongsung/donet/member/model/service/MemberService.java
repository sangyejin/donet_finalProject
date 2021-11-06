package com.pongsung.donet.member.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.donation.model.vo.Sponsor;
import com.pongsung.donet.donation.model.vo.Support;
import com.pongsung.donet.member.model.vo.Bank;
import com.pongsung.donet.member.model.vo.Member;
import com.pongsung.donet.member.model.vo.Payment;
import com.pongsung.donet.member.model.vo.Review;
import com.pongsung.donet.member.model.vo.ReviewComment;
import com.pongsung.donet.member.model.vo.ReviewImage;

public interface MemberService {
	
	Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m);

	void insertMember(Member m);

	Member updateMember(Member m);

	void deleteMember(String userId);

	Member updatePwdMember(Member m);

	Member findUserIdMember(Member m);

	Member findUserPwdMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m);

	ArrayList<Bank> selectBkList();

	void insertCard(Payment payment);

	Member selectThisUser(Payment payment);
	
	Member selectThisUser(Member loginUser);

	void updatePoint(Member loginUser);
	
	int selectUserListCount();

	ArrayList<Member> selectUserList(PageInfo pi);

	// 아래부터 후원 후기 부분
	int seletDonationReviewListCount();

	List<Support> selectDonationReviewList(PageInfo pi);

	List<Sponsor> selectSupportList(Support support);

	void insertReview(Review review);

	Review selectReview(int rno);

	List<ReviewImage> selectReviewImage(int rno);

	ArrayList<ReviewComment> selectReviewReplyList(int reNo);

	int insertReviewReply(ReviewComment rc);
	
}
