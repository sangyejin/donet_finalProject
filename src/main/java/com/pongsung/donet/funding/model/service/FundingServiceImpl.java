package com.pongsung.donet.funding.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.funding.model.dao.FundingDao;
import com.pongsung.donet.funding.model.vo.Funding;
import com.pongsung.donet.funding.model.vo.FundingCategory;
import com.pongsung.donet.funding.model.vo.FundingGoods;
import com.pongsung.donet.funding.model.vo.FundingImage;
import com.pongsung.donet.funding.model.vo.FundingReply;
import com.pongsung.donet.funding.model.vo.FundingSupporter;


@Service
public class FundingServiceImpl implements FundingService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FundingDao fundingDao;

	@Override
	public int selectFundingListCount() {
		return fundingDao.selectFundingListCount(sqlSession);
	}
	
	@Override
	public List<Funding> selectFundingList(PageInfo pi) {
		// TODO Auto-generated method stub
		return fundingDao.selectFundingList(sqlSession,pi);
	}

	@Override
	public List<FundingCategory> selectFundingCategoryList() {
		return fundingDao.selectFundingCategoryList(sqlSession);
	}

	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor={Exception.class,CommException.class})
	@Override
	public void insertFunding(Funding funding, List<FundingImage> imgList,List<FundingGoods> fundingGoodsList) throws Exception {
		int fpNo=fundingDao.insertFunding(sqlSession,funding);
		if(fpNo>0) { // 펀딩 db insert 성공
			if(!imgList.isEmpty()) { //추가 사진이 있으면
				for(FundingImage fi: imgList) {
					fi.setFpNo(fpNo);
				}
				int resultInsertImg=fundingDao.insertFundingImgList(sqlSession,imgList);
				if(resultInsertImg<0) { //추가사진 db insert 실패
					throw new CommException("펀딩 프로젝트 등록 실패 - 이미지");
				}
			}
			if(!fundingGoodsList.isEmpty()) { //선물이 있으면
				for(FundingGoods fg: fundingGoodsList) {
					fg.setFpNo(fpNo);
				}
				int resultInsertFundingGoods=fundingDao.insertFundingGoodsList(sqlSession, fundingGoodsList);
				if(resultInsertFundingGoods<0) { //선물 db insert 실패
					throw new CommException("펀딩 프로젝트 등록 실패 - 선물");
				}
			}
			
		}
		else { //펀딩 db insert 실패
			throw new CommException("펀딩 프로젝트 등록 실패");
		}

	}

	@Override
	public Funding selectFunding(int fpNo) {
		return fundingDao.selectFunding(sqlSession,fpNo);
	}

	@Override
	public List<FundingImage> selectFundingImageList(int fpNo) {
		return fundingDao.selectFundingImageList(sqlSession,fpNo);
	}

	@Override
	public List<FundingGoods> selectFundingGoodsList(int fpNo) {
		return fundingDao.selectFundingGoodsList(sqlSession,fpNo);
	}

	@Override
	public List<FundingReply> selectFundingReplyList(int fpNo) {
		return fundingDao.selectFundingReplyList(sqlSession,fpNo);
	}

	@Override
	public int insertFundingReply(FundingReply fundingReply) {
		int result=fundingDao.insertFundingReply(sqlSession,fundingReply);
		if(result<0) {
			throw new CommException("댓글 등록 실패");
		}
		return result;
	}

	@Override
	public int deleteFundingReply(int replyNo) {
		int result=fundingDao.deleteFundingReply(sqlSession,replyNo);
		if(result<0) {
			throw new CommException("댓글 등록 실패");
		}
		return result;
	}

	@Override
	public void deleteFunding(int fpNo) {
		int result=fundingDao.deleteFunding(sqlSession,fpNo);
		if(result<0) {
			throw new CommException("펀딩 프로젝트 삭제 실패");
		}
	}

	@Override
	public int updateFundingReply(FundingReply fundingReply) {
		// TODO Auto-generated method stub
		int result=fundingDao.updateFundingReply(sqlSession,fundingReply);
		if(result<0) {
			throw new CommException("펀딩 댓글 수정 실패");
		}
		return result;
	}

	@Override
	public void insertFundingSupporter(FundingSupporter fundingSupporter) {
		int result=fundingDao.insertFundingSupporter(sqlSession,fundingSupporter);
		if(result<0) {
			throw new CommException("펀딩 후원 실패");
		}
	}



}

