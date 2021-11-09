package com.pongsung.donet.funding.model.service;


import java.util.List;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.funding.model.vo.Funding;
import com.pongsung.donet.funding.model.vo.FundingCategory;
import com.pongsung.donet.funding.model.vo.FundingFilterOrder;
import com.pongsung.donet.funding.model.vo.FundingGoods;
import com.pongsung.donet.funding.model.vo.FundingImage;
import com.pongsung.donet.funding.model.vo.FundingReply;
import com.pongsung.donet.funding.model.vo.FundingSupporter;

public interface FundingService {

	int selectFundingListCount(FundingFilterOrder filterOrder);

	List<Funding> selectFundingList(PageInfo pi,FundingFilterOrder filterOrder);

	List<FundingCategory> selectFundingCategoryList();

	void insertFunding(Funding funding, List<FundingImage> imgList,List<FundingGoods> fundingGoodsList)  throws Exception;

	Funding selectFunding(int fpNo);

	List<FundingImage> selectFundingImageList(int fpNo);

	List<FundingGoods> selectFundingGoodsList(int fpNo);

	List<FundingReply> selectFundingReplyList(int fpNo);

	int insertFundingReply(FundingReply fundingReply) throws Exception;

	int deleteFundingReply(int replyNo) throws Exception;

	void deleteFunding(int fpNo) throws Exception;

	int updateFundingReply(FundingReply fundingReply) throws Exception;

	void insertFundingSupporter(FundingSupporter fundingSupporter) throws Exception;

	void updateFundingHitsCount(int fpNo) throws Exception;

	List<Funding> selectTopFundingList();

	void updateFunding(Funding funding) throws Exception;

	void updateNewFundingImageList(List<FundingImage> imgList) throws Exception;


}
