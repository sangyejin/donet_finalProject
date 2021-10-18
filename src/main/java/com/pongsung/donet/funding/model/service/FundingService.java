package com.pongsung.donet.funding.model.service;

import java.util.List;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.funding.model.vo.Funding;

public interface FundingService {

	int selectFundingListCount();

	List<Funding> selectFundingList(PageInfo pi);


}
