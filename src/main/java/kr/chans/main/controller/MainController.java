package kr.chans.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.chans.common.model.AdminPwVO;
import kr.chans.common.service.CommonService;
import kr.chans.common.util.AJaxResVO;
import kr.chans.main.model.Test;
import kr.chans.main.service.MainService;
import kr.chans.project.model.ImageVO;
import kr.chans.project.model.ProjectVO;
import kr.chans.project.service.ProjectService;

@Controller
public class MainController {

	@Autowired
	MainService service;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	ProjectService projectService;
	
	@RequestMapping("/")
	public String mainView(HttpServletRequest request, HttpSession session) {
		
		try {
			
			List<ImageVO> logoList = projectService.selectLogoList();
			
			request.setAttribute("logoList",logoList);
			
			
			
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		
		
		
		
		
		return "/main/main";
	}
	
	
	@RequestMapping(value="/project/{idx}" , method=RequestMethod.GET)
	public @ResponseBody AJaxResVO getProjectInfo(@PathVariable("idx") String idx, HttpServletRequest request) {
		
		AJaxResVO jRes = new AJaxResVO();
		
		try {
		
		ProjectVO projectParam = new ProjectVO();
			
		projectParam.setpNo(idx);
		
		// 프로젝트 정보 가져오기
		ProjectVO result = projectService.selectProjectOne(projectParam);
		
		
		if(result != null) {
		
		// 프로젝트 정보 jRes에 저장
		jRes.addAttribute("project",result);
			
		ImageVO imageParam = new ImageVO();
		imageParam.setiProjectNo(idx);
		imageParam.setiType("image");
		// 프로젝트 이미지 가져오기
		List<ImageVO> imageList = projectService.selectImageList(imageParam);	
		
		if(imageList != null && imageList.size() > 0 ) {
			//이미지 정보 jRes에 저장
			jRes.addAttribute("imageList",imageList);
		}
		
		
		jRes.setSuccess(AJaxResVO.SUCCESS_Y);
		
		
		
		
		
		} else {
			jRes.setResult("The project does not exist");
			jRes.setSuccess(AJaxResVO.SUCCESS_N);
			
		}
		
		}catch(Exception e) {
			jRes.setResult("Exception");
			jRes.setSuccess(AJaxResVO.SUCCESS_N);
			e.printStackTrace();
		}
		
		return jRes;
	}
	
	
}
