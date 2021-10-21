package com.pongsung.donet.notice.model.service;

import java.util.ArrayList;

import com.pongsung.donet.notice.model.vo.Notice;
import com.pongsung.donet.notice.model.vo.Search;
import com.pongsung.donet.common.PageInfo;

public interface NoticeService {

	ArrayList<Notice> selectNoticeList(PageInfo pi, Search keyword);

	int selectNoticeListCount(Search keyword);

	Notice selectThisNotice(int noticeNo);

	Notice selectPrevNotice(int noticeNo);

	Notice selectNextNotice(int noticeNo);

}