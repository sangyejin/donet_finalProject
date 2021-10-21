package com.pongsung.donet.introduce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class introduceController {

	@RequestMapping("introduce.pr")
	public String introduceProject() {

		return "introduce/introduceProject";
	}
	@RequestMapping("introduce.how")
	public String introduceHowto() {

		return "introduce/howtoDonation";
	}

}
