package com.pongsung.donet.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pongsung.donet.member.controller.MemberController;
import com.pongsung.donet.member.model.vo.Member;

public class OneListInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		logger.debug("=====================OneListInterceptor=====================");
		HttpSession session = request.getSession();

		Member loginUser = (Member) session.getAttribute("loginUser");

		if (loginUser == null) {
			logger.info("비로그인 상태에서 [" + request.getRequestURI() + "] 접 근 시 도");
			session.setAttribute("msg", "1:1 문의는 로그인 후에 이용 가능합니다.");
			response.sendRedirect("/donet/loginForm.me");
			return false;
		}
		return true;

	}

}
