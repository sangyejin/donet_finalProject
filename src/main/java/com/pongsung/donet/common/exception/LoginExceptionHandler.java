package com.pongsung.donet.common.exception;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

	@Service
	/* 로그인 실패 대응 로직 */
	@ControllerAdvice("com.pongsung.donet.member.controller")
	public class LoginExceptionHandler {
	
		@ExceptionHandler({ Exception.class })
		public ModelAndView runtimeExceptionHandler(Exception ex, HttpServletRequest request) {
			ModelAndView view = new ModelAndView();
	
			view.setViewName("member/memberLogin");
			view.addObject("msg", ex.getMessage());
			
			ex.printStackTrace();
	
			return view;
		}


	
}

