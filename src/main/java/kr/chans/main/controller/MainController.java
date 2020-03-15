package kr.chans.main.controller;

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
	public String mainView() {
		
		
		AdminPwVO param = new AdminPwVO();
		param.setApPw("qkrckstjs1828!");
		
		AdminPwVO adminPwVO = commonService.adminPwCheck(param);
		System.out.println("1");
		if(adminPwVO != null) {
			System.out.println("2");
			System.out.println(adminPwVO.getApNo());
			System.out.println(adminPwVO.getApId());
			System.out.println(adminPwVO.getApPw());
			
		}
		
		
		return "/main/main";
	}
	
}
