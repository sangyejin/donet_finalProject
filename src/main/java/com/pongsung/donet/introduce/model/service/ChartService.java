package com.pongsung.donet.introduce.model.service;

import java.util.List;

import com.pongsung.donet.donation.model.vo.Sponsor;
import com.pongsung.donet.introduce.model.vo.ChartFunding;
import com.pongsung.donet.introduce.model.vo.ChartSupport;

public interface ChartService {

	List<ChartSupport> selectDonation();

	List<ChartFunding> selectSponsor();
	
}
