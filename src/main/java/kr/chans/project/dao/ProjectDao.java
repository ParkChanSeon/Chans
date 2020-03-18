package kr.chans.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.chans.project.model.ImageVO;
import kr.chans.project.model.ProjectVO;

@Repository("projectDao")
public class ProjectDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String strNameSpace = "kr.chans.ProjectMapper";
	
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	public Integer saveProject(ProjectVO param) {
		
		return sqlSession.insert(strNameSpace + ".saveProject", param);
	}

	
	public Integer saveImage(ImageVO param) {
		
		return sqlSession.insert(strNameSpace + ".saveImage", param);
	}
	
	// 프로젝트매니저에 사용할 리스트
	public List<ProjectVO> selectProjectList() {
		
		List<ProjectVO> result = sqlSession.selectList(strNameSpace + ".selectProjectList");
		
		return result;
	}
	
	// 프로젝트 내용을 보기위한 조회문
	public ProjectVO selectProjectOne(ProjectVO param) {
		
		ProjectVO result = sqlSession.selectOne(strNameSpace + ".selectProjectOne",param);
		
		return result;
	}
	
	// 프로젝트 이미지 리스트들을 보기위한 조회문
	public List<ImageVO> selectImageList(ImageVO param) {
			
			List<ImageVO> result = sqlSession.selectList(strNameSpace + ".selectImageList",param);
			
			return result;
		}
	
	// 메인에서 사용할 로고리스트 가져오기
	public List<ImageVO> selectLogoList (){
		List<ImageVO> result = sqlSession.selectList(strNameSpace + ".selectLogoList");
		
		return result;
	}
	
	
	// 프로젝트 사용유무 변경
	public Integer updateUseYn(ProjectVO param) {
		
		return sqlSession.update(strNameSpace + ".updateUseYn",param);
	}
	
}
