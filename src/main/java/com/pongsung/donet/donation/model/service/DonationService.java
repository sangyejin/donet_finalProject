package com.pongsung.donet.donation.model.service;

import java.util.ArrayList;
import java.util.List;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.donation.model.vo.Sponsor;
import com.pongsung.donet.donation.model.vo.Support;

public interface DonationService {

	int selectDonationListCount();

	List<Support> selectDonationList(PageInfo pi);

	ArrayList selectDonationParticipationCount();

	List<Sponsor> selectSponsorList(PageInfo pi);

	Support selectDonation(int suNo);

}
