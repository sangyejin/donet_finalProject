package com.pongsung.donet.donation.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.donation.model.dao.SupportDao;
import com.pongsung.donet.donation.model.vo.Sponsor;
import com.pongsung.donet.donation.model.vo.SupporComment;
import com.pongsung.donet.donation.model.vo.Support;
import com.pongsung.donet.donation.model.vo.SupportCategory;
import com.pongsung.donet.donation.model.vo.SupportFilter;
import com.pongsung.donet.donation.model.vo.SupportImage;
import com.pongsung.donet.donation.model.vo.SupportUsePlan;

@Service
public class DonationServiceImpl implements DonationService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SupportDao supportDao;
	
	@Override
	public int selectDonationListCount() {
		return supportDao.selectDonationListCount(sqlSession);
	}

	@Override
	public List<Support> selectDonationList(PageInfo pi) {
		return supportDao.selectDonationList(sqlSession,pi);
	}

	@Override
	public ArrayList selectDonationParticipationCount() {
		return supportDao.selectDonationParticipationCount(sqlSession);
	}



	@Override
	public Support selectDonation(int suNo) {
		Support s = null;
		int result = supportDao.increaseCount(sqlSession, suNo);
		
		if (result < 0) {
			throw new CommException("조회수 증가 실패");
		} else {
			s = supportDao.selectBoard(sqlSession, suNo);
		}

		return s;
	}

	@Override
	public List<SupportUsePlan> selectSupportUsePlan(int suNo) {
		return supportDao.selectSupportUsePlan(sqlSession, suNo);
	}

	@Override
	public Sponsor selectSponsor(int suNo) {
		return supportDao.selectSponsor(sqlSession, suNo);
	}

	@Override
	public List<SupporComment> selectSupporComment(int suNo) {
		return supportDao.selectSupporComment(sqlSession, suNo);
	}

	@Override
	public List<Sponsor> selectSponsorList(int suNo) {
		return supportDao.selectSponsorList(sqlSession, suNo);
	}
	
	@Override
	public List<SupportImage> selectImageList(int suNo) {
		return supportDao.selectImageList(sqlSession,suNo);
	}

	@Override
	public ArrayList<SupporComment> selectReplyList(int suNo) {
		return supportDao.selectReplyList(sqlSession, suNo);
	}
	
	@Override
	public int insertReply(SupporComment sc) {
		int result = supportDao.insertReply(sqlSession, sc);

		if (result < 0) {
			throw new CommException("Reply 추가 실패");
		}
		
		return result;
	}

	@Override
	public int deleteReply(int replyNo) {
		
		int result = supportDao.deleteReply(sqlSession, replyNo);
		
		if(result < 0) {
			throw new CommException("댓글 삭제 실패");
		}
		return result;
	}

	@Override
	public int selectCategoryListCount(int suCategoryNo) {
		return supportDao.selectCategoryListCount(sqlSession, suCategoryNo);
	}

	@Override
	public List<Support> selectCategoryList(int suCategoryNo) {
		return supportDao.selectCategoryList(sqlSession,suCategoryNo);
	}

	@Override
	public int updateReply(SupporComment sc) {
		int result = supportDao.updateReply(sqlSession, sc);
		if(result < 0) {
			throw new CommException("댓글 수정 실패");
		}
		return result;
	}

	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor={Exception.class,CommException.class})
	@Override
	public void insertBoard(Support support, List<SupportImage> imgList, List<SupportUsePlan> list) throws Exception{
		int suNo=supportDao.insertBoard(sqlSession,support);
		if(suNo>0) {
			if(!imgList.isEmpty()) { 
				for(SupportImage fi: imgList) {
					fi.setSuNo(suNo);
				}
				int resultInsertImg=supportDao.insertImgList(sqlSession,imgList);
				if(resultInsertImg<0) { 
					throw new CommException("게시글 이미지 등록 실패");
				}
			}
			if(!list.isEmpty()) { 
				for(SupportUsePlan up: list) {
					up.setSuNo(suNo);
				}
				int resultInsertUsePlan=supportDao.insertUsePlan(sqlSession, list);
				if(resultInsertUsePlan<0) { 
					throw new CommException("게시글 기부계획서 등록 실패");
				}
			}
			
		}
		else { 
			throw new CommException("게시글 DB 등록 실패");
		}
		
	}

	@Override
	public int selectDonationCaListCount(SupportCategory suCategory) {
		return supportDao.selectDonationCaListCount(sqlSession, suCategory);
	}

	@Override
	public List<Support> selectDonationCaList(PageInfo pi, SupportCategory suCategory) {
		return supportDao.selectDonationCaList(sqlSession, pi, suCategory);
	}

	@Override
	public int selectDonationOrListCount(SupportFilter supportFilter) {
		return supportDao.selectDonationOrListCount(sqlSession, supportFilter);
	}

	@Override
	public List<Support> selectDonationOrList(PageInfo pi, SupportFilter supportFilter) {
		return supportDao.selectDonationOrList(sqlSession, pi, supportFilter);
	}

	@Override
	public Support selectSupport(int suNo) {
		return supportDao.selectSupport(sqlSession,suNo);
	}

	@Override
	public int insertSupportCharity(Sponsor s) {
		int result = supportDao.insertSupportCharity(sqlSession, s);

		if (result < 0) {
			throw new CommException("후원자 추가 실패");
		}
		
		return result;
		
	}

	@Override
	public int updatePoints(int points) {
		int result = supportDao.updatePoints(sqlSession,points);
		if(result<0) {
			throw new CommException("포인트 수정 실패");
		}
		return result;
	}

	@Override
	public List<Support> selectTopDonationList() {
		// TODO Auto-generated method stub
		return supportDao.selectTopDonationList(sqlSession);
	}







}
