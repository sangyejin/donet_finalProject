package com.pongsung.donet.notice.model.service;

import java.util.ArrayList;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.notice.model.vo.Category;
import com.pongsung.donet.notice.model.vo.FrequentlyAskedQuestions;
import com.pongsung.donet.notice.model.vo.Notice;
import com.pongsung.donet.notice.model.vo.Search;

public interface NoticeService {
	
	//notice

	ArrayList<Notice> selectNoticeList(PageInfo pi, Search keyword);

	int selectNoticeListCount(Search keyword);

	Notice selectThisNotice(int noticeNo);

	Notice selectPrevNotice(int noticeNo);

	Notice selectNextNotice(int noticeNo);

	void deleteGo(int noticeNo);

	void insertNotice(Notice no);

	//void insertSaveNotice(Notice no);

	void updateNotice(Notice no);
	
	/******************************************************************************************************************/
	//FAQ 

	int selectFaqListCount(Category ctgry);

	ArrayList<FrequentlyAskedQuestions> selectFaqList(PageInfo pi,Category ctgry);

	void insertFaq(FrequentlyAskedQuestions faq);

	FrequentlyAskedQuestions selectThisFaq(int faqNo);

	void updateFaq(FrequentlyAskedQuestions faq);

	void deleteFaq(int faqNo);


}