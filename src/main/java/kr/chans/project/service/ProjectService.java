package kr.chans.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.chans.project.dao.ProjectDao;
import kr.chans.project.model.ImageVO;
import kr.chans.project.model.ProjectVO;

@Service
public class ProjectService {

	@Autowired
	private ProjectDao projectDao;
	
	
	// 프로젝트 내용저장
	public void saveProject(ProjectVO param) {
		
		projectDao.saveProject(param);
	}
	
	// 이미지, 로고 파일 저장
	public void saveImage(ImageVO param) {
		
		projectDao.saveImage(param);
	}
	
	// 프로젝트매니저에 사용할 리스트

	public List<ProjectVO> selectProjectList() {
		List<ProjectVO> result = projectDao.selectProjectList();
		return result;
	}
	
	// 프로젝트 내용을 보기위한 조회문
		public ProjectVO selectProjectOne(ProjectVO param) {
			
			ProjectVO result = projectDao.selectProjectOne(param);
			
			return result;
		}
		
	// 프로젝트 이미지 리스트들을 보기위한 조회문
	public List<ImageVO> selectImageList(ImageVO param) {
			
			List<ImageVO> result = projectDao.selectImageList(param);
			
			return result;
		}	
	
	// 메인에서 사용할 로고리스트 가져오기
	public List<ImageVO> selectLogoList(){
	
		List<ImageVO> result = projectDao.selectLogoList();
	
		return result;
	}
	
}
