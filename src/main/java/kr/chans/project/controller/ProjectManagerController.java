package kr.chans.project.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.chans.common.model.AdminVO;
import kr.chans.common.util.AJaxResVO;
import kr.chans.project.model.ImageVO;
import kr.chans.project.model.ProjectVO;
import kr.chans.project.service.ProjectService;

@Controller
public class ProjectManagerController {

	@Autowired
	private ProjectService projectService;
	
	
	@RequestMapping(value="/admin/projectManager", method = RequestMethod.GET)
	public String projectMangerView(HttpServletRequest request, HttpSession session) {
		
		if(session.getAttribute("loginUser") != null) {
			
		try {
		
			List<ProjectVO> list = projectService.selectProjectList();
			
				if(list != null && list.size()>0) {
					
					request.setAttribute("projectList", list);
					
				}
				
				
				
			} catch (Exception e) {
				
			}
			
			
			
			
			
		} else {
			// 로그인 하지 않았을 경우 로그인화면으로 다시 보내기
			return "redirect:/admin/login";
			
		}
		
		return "/admin/projectManager";
	}
	
	
	@RequestMapping(value="/admin/projects",  method = RequestMethod.POST)
	public @ResponseBody AJaxResVO saveProject(MultipartHttpServletRequest mtfRequest,  HttpServletRequest request){
		
		AJaxResVO jRes = new AJaxResVO();
		
		AdminVO loginUser = new AdminVO();
		
		loginUser = (AdminVO) request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
		
		String pTitle = mtfRequest.getParameter("pTitle");
		String pStartDate = mtfRequest.getParameter("pStartDate");
		String pEndDate = mtfRequest.getParameter("pEndDate");
		String pSummary = mtfRequest.getParameter("pSummary");	
		String pDetail = mtfRequest.getParameter("pDetail");	
		
		String pCreateDate = currentDate();
		String pCreateTime = currentTime();
		
		
		
		String pCreateUser = loginUser.getAdminId();
		
		/*System.out.println("pTitle : " + pTitle);
		System.out.println("pStartDate : " + pStartDate);
		System.out.println("pEndDate : " + pEndDate);
		System.out.println("pSummary : " + pSummary);
		System.out.println("pDetail : " + pDetail);
		System.out.println("pCreateUser : " + pCreateUser);*/
		pStartDate = changeProjectDate(pStartDate);
		pEndDate = changeProjectDate(pEndDate);
		
		
		
		
		ProjectVO param = new ProjectVO();
		
		param.setpTitle(pTitle);
		param.setpStartDate(pStartDate);
		param.setpEndDate(pEndDate);
		param.setpSummary(pSummary);
		param.setpDetail(pDetail);
		param.setpCreateDate(pCreateDate);
		param.setpCreateTime(pCreateTime);
		param.setpCreateUser(pCreateUser);
		
		// 프로젝트 저장
		projectService.saveProject(param);
		
		System.out.println("프로젝트 내용 저장");
		
		System.out.println("리턴퇴는 키값은? : " + param.getpNo());
		
		
		
		MultipartFile pLogoFile = mtfRequest.getFile("pLogoFile");
    	
        List<MultipartFile> pImageFiles = mtfRequest.getFiles("pImageFiles[]");
       
        
        String path = "\\upload\\logo\\";
        
        
     // 로고 파일 업로드
        File dir = new File(path);
		
		if( !dir.exists() )
			dir.mkdirs();
		
		Random random = new Random();
		
	
			String originFileName = pLogoFile.getOriginalFilename(); // 원본 파일 명
			String fileName = "logo_" + random.nextLong() + originFileName.substring(originFileName.indexOf("."));
			String iExtension = originFileName.substring(originFileName.lastIndexOf("."), originFileName.length());
			
			File f = new File(dir, fileName);
			
			System.out.println("로고파일 : " + fileName);
			
			try {
				pLogoFile.transferTo(f);
				// 디비에도 저장하기 
				
				ImageVO logoParam = new ImageVO();
				
				logoParam.setiProjectNo(param.getpNo());
				logoParam.setiType("logo");
				logoParam.setiCreateDate(param.getpCreateDate());
				logoParam.setiCreateTime(param.getpCreateTime());
				logoParam.setiPath(path);
				logoParam.setiName(fileName);
				logoParam.setiRealName(originFileName);
				logoParam.setiExtension(iExtension);
				logoParam.setiSize(pLogoFile.getSize()+"");
				
				// 로고 저장
				projectService.saveImage(logoParam);
				
				
			} catch (Exception e) {	
				System.out.println("files upload EXCEPTION !!");
				e.printStackTrace();
				
				
			}
	        
		
        
        
        
        // 이미지 파일들 업로드
		path = "\\upload\\image\\";	
			
        dir = new File(path);
		
		if( !dir.exists() )
			dir.mkdirs();
		
		random = new Random();
		
		for(MultipartFile mf : pImageFiles) {
			originFileName = mf.getOriginalFilename(); // 원본 파일 명
			fileName = "image_" + random.nextLong() + originFileName.substring(originFileName.indexOf("."));
			iExtension = originFileName.substring(originFileName.lastIndexOf("."), originFileName.length());
			
			 f = new File(dir, fileName);
			
			 System.out.println("이미지 파일 : " + fileName);
			
			try {
				mf.transferTo(f);
				// 디비에도 저장하기 
				
				ImageVO imageParam = new ImageVO();
				
				imageParam.setiProjectNo(param.getpNo());
				imageParam.setiType("image");
				imageParam.setiCreateDate(param.getpCreateDate());
				imageParam.setiCreateTime(param.getpCreateTime());
				imageParam.setiPath(path);
				imageParam.setiName(fileName);
				imageParam.setiRealName(originFileName);
				imageParam.setiExtension(iExtension);
				imageParam.setiSize(mf.getSize()+"");
				
				// 이미지 저장
				projectService.saveImage(imageParam);
				
			} catch (Exception e) {	
				System.out.println("files upload EXCEPTION !!");
				e.printStackTrace();
				
				
			}
	        
		
		}
		
		jRes.setResult("SUCCESS");
		jRes.setSuccess(AJaxResVO.SUCCESS_Y);
		
		
		
	} else {
		jRes.setResult("Login Fail");
		jRes.setSuccess(AJaxResVO.SUCCESS_N);
	}


		
		
		return jRes;
	}
	
	
	public String changeProjectDate(String pDate) {
		
		String yM = "";
		
		
		yM = pDate.substring(0,7);
		
		
	//	System.out.println("changeProjectDate : "+ yM);
		return yM;
		
	}
	
	public String currentDate() {
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
		
		Date time = new Date();
		
		String date = format1.format(time);
		
		// System.out.println("현재날짜 : " + date);
		
		return date;
	}
	
	public String currentTime() {
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "HH:mm:ss");
		
		Date time = new Date();
		
		String date = format1.format(time);
		
		// System.out.println("현재시간 : " + date);
		
		return date;
	}
	
	
	// 프로젝트 사용유무 변경
	@RequestMapping(value="/admin/projects/use" , method = RequestMethod.PUT)
	public @ResponseBody AJaxResVO updateUseYn(
			@RequestBody ProjectVO data, HttpServletRequest request) {
		/*
		 * 	put 요청의 경우 
		 *  ajax 
		 *  contentType :"application/json"
		 *  JSON.stringify() 필수 
		 *  controller에서는 @RequestBody로 받아야한다.
		 *  request.parameter("")는 get,pos에서만 사용가
		 */
		AdminVO loginUser = (AdminVO) request.getSession().getAttribute("loginUser");
		
		AJaxResVO jRes = new AJaxResVO();
		
		if(loginUser != null) {
			
			String pUseYn = data.getpUseYn();
			String pNo = data.getpNo();
			
			
			// System.out.println("pUseYn : " + pUseYn);
			// System.out.println("pNo : " + pNo);
			
			if(pUseYn != null && !"".equals(pUseYn)
				&& pNo != null && !"".equals(pNo)) {
				
				ProjectVO param = new ProjectVO();
				
				param.setpNo(pNo);
				param.setpUseYn(pUseYn);
				
				try {
					
				int result = projectService.updateUseYn(param);
				
				if(result > 0) {
					jRes.setResult("SUCCESS");
					jRes.setSuccess(AJaxResVO.SUCCESS_Y);
					
				}else {
					jRes.setResult("Fail");
					jRes.setSuccess(AJaxResVO.SUCCESS_N);
					
				}
				
				
				} catch (Exception e) {
					jRes.setResult("Exception");
					jRes.setSuccess(AJaxResVO.SUCCESS_N);
					e.printStackTrace();
				}
				
			
			}else {
				
				jRes.setResult("Parameter Error");
				jRes.setSuccess(AJaxResVO.SUCCESS_N);
				
			}
			
			
		}else {
			
			jRes.setResult("Login Fail");
			jRes.setSuccess(AJaxResVO.SUCCESS_N);
		}
		
		
		
		
		return jRes;
	}
	
	
}
