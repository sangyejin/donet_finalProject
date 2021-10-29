package com.pongsung.donet.common.footer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class footerController {
	
	@RequestMapping("terms.fo")
	public String goterms() {
		return "common/termsAndConditions";
	}
	
	@RequestMapping("moral.fo")
	public String gomoral() {
		return "common/moral";
	}

}
