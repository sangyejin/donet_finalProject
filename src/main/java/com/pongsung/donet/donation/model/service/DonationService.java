package com.pongsung.donet.donation.model.service;

import java.util.ArrayList;
import java.util.List;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.donation.model.vo.Sponsor;
import com.pongsung.donet.donation.model.vo.SupporComment;
import com.pongsung.donet.donation.model.vo.Support;
import com.pongsung.donet.donation.model.vo.SupportImage;
import com.pongsung.donet.donation.model.vo.SupportUsePlan;
import com.pongsung.donet.funding.model.vo.FundingImage;

public interface DonationService {

	int selectDonationListCount();

	List<Support> selectDonationList(PageInfo pi);

	ArrayList selectDonationParticipationCount();


	Support selectDonation(int suNo);

	List<SupportUsePlan> selectSupportUsePlan(int suNo);

	Sponsor selectSponsor(int suNo);

	List<SupporComment> selectSupporComment(int suNo);

	List<Sponsor> selectSponsorList(int suNo);
	
	List<SupportImage> selectImageList(int suNo);

	int insertReply(SupporComment sc);

	ArrayList<SupporComment> selectReplyList(int suNo);

	int deleteReply(int replyNo);

	int selectCategoryListCount(int suCategoryNo);

	List<Support> selectCategoryList(int suCategoryNo);

	int updateReply(SupporComment sc);

	void insertBoard(Support support, List<SupportImage> imgList, List<SupportUsePlan> list) throws Exception;

	

//	int selectGolbalListCount(int categoryNo);
//
//	List<Support> selectGlobalList(PageInfo pi, int categoryNo);




}
