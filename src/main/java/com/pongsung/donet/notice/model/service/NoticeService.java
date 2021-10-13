package com.pongsung.donet.notice.model.service;

import java.util.ArrayList;

import com.pongsung.donet.notice.model.vo.Notice;
import com.pongsung.donet.notice.model.vo.PageInfo;

public interface NoticeService {

	int selectNoticeListCount();

	ArrayList<Notice> selectNoticeList(PageInfo pi);

}
