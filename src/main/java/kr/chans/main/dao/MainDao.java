package kr.chans.main.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.chans.main.model.Test;
@Repository("mainDao")
public class MainDao {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String strNameSpace = "kr.chans.MainMapper";
	
	
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public Test test() {
		
		
		return sqlSession.selectOne(strNameSpace + ".test");
	}
	
	
}
