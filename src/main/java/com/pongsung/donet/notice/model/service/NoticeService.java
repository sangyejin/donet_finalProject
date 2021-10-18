package com.pongsung.donet.notice.model.service;

import java.util.ArrayList;

import com.pongsung.donet.notice.model.vo.Notice;
import com.pongsung.donet.common.PageInfo;

public interface NoticeService {

	int selectNoticeListCount();

	ArrayList<Notice> selectNoticeList(PageInfo pi);

}
