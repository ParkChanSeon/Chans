package kr.chans.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.chans.common.dao.CommonDao;
import kr.chans.common.model.AdminPwVO;
import kr.chans.common.model.AdminVO;

@Service
public class CommonService {

	@Autowired
	CommonDao commonDao;
	
	
	public AdminPwVO adminPwCheck(AdminPwVO param) {
		
		AdminPwVO result = commonDao.adminPwCheck(param);
		
		return result;
	}
	
	
		// 관리자 새로 추가 등록시 아이디 중복 검사.
		public AdminVO regIdCheck(AdminVO param) {
			AdminVO result = commonDao.regIdCheck(param);
			
			return result;
			
		}
	
		
		// 관리자 새로 추가 등록 insert 
		public Integer regAdmin(AdminVO param) {
			Integer result = commonDao.regAdmin(param);
			
			return result;
		}
	
		
		// 관리자 로그인 
		public AdminVO loginCheck(AdminVO param) {
			AdminVO result = commonDao.loginCheck(param);
			return result;
		}
		
}
