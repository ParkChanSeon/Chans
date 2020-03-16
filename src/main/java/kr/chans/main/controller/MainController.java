package kr.chans.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.chans.common.model.AdminPwVO;
import kr.chans.common.service.CommonService;
import kr.chans.main.model.Test;
import kr.chans.main.service.MainService;

@Controller
public class MainController {

	@Autowired
	MainService service;
	
	@Autowired
	CommonService commonService;
	
	
	
	@RequestMapping("/")
	public String mainView(HttpServletRequest request, HttpSession session) {
		
		
		
		
		return "/main/main";
	}
	
}
