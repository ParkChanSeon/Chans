package kr.chans.common.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.chans.common.model.AdminPwVO;

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
	
	
	
	
}
