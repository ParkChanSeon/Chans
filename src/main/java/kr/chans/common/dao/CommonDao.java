package kr.chans.common.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.chans.common.model.AdminPwVO;
import kr.chans.common.model.AdminVO;

@Repository("commonDao")
public class CommonDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String strNameSpace = "kr.chans.LoginMapper";
	
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	
	public AdminPwVO adminPwCheck(AdminPwVO param) {
		
		AdminPwVO result = sqlSession.selectOne(strNameSpace + ".adminPwCheck", param);
		
		return result;
	}
	
	// 관리자 새로 추가 등록시 아이디 중복 검사.
	public AdminVO regIdCheck(AdminVO param) {
		AdminVO result = sqlSession.selectOne(strNameSpace + ".regIdCheck",param);
		
		return result;
	}
	
	// 관리자 새로 추가 등록 insert 
	public Integer regAdmin(AdminVO param) {
		Integer result = sqlSession.insert(strNameSpace + ".regAdmin",param);
		return result;
	}
	
	
	// 관리자 로그인 
		public AdminVO loginCheck(AdminVO param) {
			AdminVO result = sqlSession.selectOne(strNameSpace + ".loginCheck",param);
			return result;
		}
	
	
	
}
