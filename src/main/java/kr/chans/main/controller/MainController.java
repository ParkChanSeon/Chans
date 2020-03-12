package kr.chans.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.chans.main.model.Test;
import kr.chans.main.service.MainService;

@Controller
public class MainController {

	@Autowired
	MainService service;
	
	@RequestMapping("/")
	public String mainView() {
		
		/*Test test = service.test();
		
		
		if (test != null)
			System.out.println(test.getTest01() + " // " + test.getTest02());
		*/
		
		return "/main/main";
	}
	
}
