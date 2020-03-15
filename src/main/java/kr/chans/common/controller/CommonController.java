package kr.chans.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.chans.common.model.AdminPwVO;
import kr.chans.common.service.CommonService;

@Controller
public class CommonController {

	
	@Autowired
	private CommonService commonService;
	
	
	@RequestMapping(value="/post/registration/admin")
	public @ResponseBody String regAdmin (HttpServletRequest request) {
		
		
		
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
		
		
		
		return "";
	}
	
	
}
