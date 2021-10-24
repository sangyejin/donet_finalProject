package com.pongsung.donet.funding.model.service;


import java.util.ArrayList;
import java.util.List;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.funding.model.vo.Funding;
import com.pongsung.donet.funding.model.vo.FundingCategory;
import com.pongsung.donet.funding.model.vo.FundingGoods;
import com.pongsung.donet.funding.model.vo.FundingImage;
import com.pongsung.donet.funding.model.vo.FundingReply;

public interface FundingService {

	int selectFundingListCount();

	List<Funding> selectFundingList(PageInfo pi);

	List<FundingCategory> selectFundingCategoryList();

	void insertFunding(Funding funding, List<FundingImage> imgList,List<FundingGoods> fundingGoodsList) throws Exception;

	Funding selectFunding(int fpNo);

	List<FundingImage> selectFundingImageList(int fpNo);

	List<FundingGoods> selectFundingGoodsList(int fpNo);

	List<FundingReply> selectFundingReplyList(int fpNo);

	int insertFundingReply(FundingReply fundingReply);

	int deleteFundingReply(int replyNo);


}
