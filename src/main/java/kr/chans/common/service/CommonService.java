package kr.chans.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.chans.common.dao.CommonDao;
import kr.chans.common.model.AdminPwVO;

@Service
public class CommonService {

	@Autowired
	CommonDao commonDao;
	
	
	public AdminPwVO adminPwCheck(AdminPwVO param) {
		
		AdminPwVO result = commonDao.adminPwCheck(param);
		
		return result;
	}
	
	
}
