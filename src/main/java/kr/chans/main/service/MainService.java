package kr.chans.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.chans.main.dao.MainDao;
import kr.chans.main.model.Test;



@Service
public class MainService {

	@Autowired
	MainDao dao;
	
	// 아이디 중복 확인
	public Test test() {
		
		return dao.test();
	}
	
	
}
