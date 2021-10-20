package com.pongsung.donet.funding.model.service;


import java.util.List;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.funding.model.vo.Funding;
import com.pongsung.donet.funding.model.vo.FundingCategory;
import com.pongsung.donet.funding.model.vo.FundingImage;

public interface FundingService {

	int selectFundingListCount();

	List<Funding> selectFundingList(PageInfo pi);

	List<FundingCategory> selectFundingCategoryList();

	void insertFunding(Funding funding, List<FundingImage> imgList);


}
