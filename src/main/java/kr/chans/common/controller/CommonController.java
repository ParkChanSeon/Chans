package kr.chans.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import kr.chans.common.model.AdminPwVO;
import kr.chans.common.model.AdminVO;
import kr.chans.common.service.CommonService;
import kr.chans.common.util.AJaxResVO;

@Controller
public class CommonController {

	
	@Autowired
	private CommonService commonService;
	
	@Autowired
    PasswordEncoder passwordEncoder;
	
	

	
	@RequestMapping(value="/admin/login", method=RequestMethod.GET)
	public String adminPage(HttpServletRequest request) {
		System.out.println("!!!");
		
		return "/admin/login";
	}
	
	
	@RequestMapping(value="/admin/login" ,method = RequestMethod.POST)
	public @ResponseBody AJaxResVO adminLogin(HttpServletRequest request) {
		AJaxResVO jRes = new AJaxResVO();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		
		if(!"".equals(id) && !"".equals(pw)) {
			
			try {
			AdminVO param = new AdminVO();
			
			param.setAdminId(id);
			
			AdminVO resultVO = commonService.loginCheck(param);
			
			if(resultVO != null) {
				
				boolean match = passwordEncoder.matches(pw, resultVO.getAdminPw());
			// System.out.println("match : " + match);
				if(match) {
					resultVO.setAdminPw("");
					jRes.setSuccess(AJaxResVO.SUCCESS_Y);
					jRes.addAttribute("loginUser",resultVO);
					
					// session 에 저장 !!
					request.getSession().setAttribute("loginUser", resultVO);
					
					
				} else {
					jRes.setSuccess(AJaxResVO.SUCCESS_N);
					jRes.setResult("Password Error");
					
				}
				
				
				
				
			} else {
				// ID 가 존재하지 않음	
				jRes.setSuccess(AJaxResVO.SUCCESS_N);
				jRes.setResult("Id Error");
			}
			
			} catch(Exception e) {
				jRes.setSuccess(AJaxResVO.SUCCESS_N);
				jRes.setResult("Exception");
				
			}
			
			
			
		} else {
			
			jRes.setSuccess(AJaxResVO.SUCCESS_N);
			jRes.setResult("PARAM Error");
		}
		
		
		
		
		
		return jRes;
	}
	
	
	@RequestMapping(value="/logout" ,method = RequestMethod.POST)
	public @ResponseBody AJaxResVO logout(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		AJaxResVO jRes = new AJaxResVO();
			
		
			session.invalidate();
			System.out.println("session.invalidate()");
			
			jRes.setResult("1");
			jRes.setSuccess(AJaxResVO.SUCCESS_Y);
			
			return jRes;
	}
	
	
	@RequestMapping(value="/admin/registration",method = RequestMethod.POST)
	public @ResponseBody AJaxResVO regAdmin (HttpServletRequest request) {
		
		AJaxResVO jRes = new AJaxResVO();
		
		
		String regId = request.getParameter("regId");
		String regPw = request.getParameter("regPw");
		String confirmPw = request.getParameter("confirmPw");
		
		if(!"".equals(regId) && !"".equals(regId) && !"".equals(regId)) {
			
			try {
			// 1. 가져온 아이디가 있는지 중복검사 먼저.
			
			AdminVO param = new AdminVO();
			
			param.setAdminId(regId);
				
			AdminVO result = commonService.regIdCheck(param);
			
				if(result != null) {
					jRes.setSuccess(AJaxResVO.SUCCESS_N);
					jRes.setResult("Id Duplication");
					
				} else {
					// 해당 아이디가 없을 경우 인서트 , 관리자 비밀번호도 검사해야함.
					
					AdminPwVO confirmPwParam = new AdminPwVO();
					confirmPwParam.setApId("admin01");
					confirmPwParam.setApPw(confirmPw);
					
					AdminPwVO adminPwVO = commonService.adminPwCheck(confirmPwParam);
					
					if(adminPwVO != null) {
						
						String encoderPw = passwordEncoder.encode(regPw);
						
						
						// System.out.println("endoderPw : " + encoderPw);
						
						param.setAdminPw(encoderPw);
						
						
						int resultCount = 0 ; 
						
						resultCount = commonService.regAdmin(param);
						
							if(resultCount > 0 ) {
								jRes.setSuccess(AJaxResVO.SUCCESS_Y);
								jRes.setResult("SUCCESS");
								
							} else {
								jRes.setSuccess(AJaxResVO.SUCCESS_N);
								jRes.setResult("SignUp Error");
							}
						
						
					} else {
						jRes.setSuccess(AJaxResVO.SUCCESS_N);
						jRes.setResult("ConfirmPw Error");
						
					}
					
					
					
					
				}
		
			} catch(Exception e) {
				
				jRes.setSuccess(AJaxResVO.SUCCESS_N);
				jRes.setResult("Exception");
			}
			
			
			
		
		} else {
			
			jRes.setSuccess(AJaxResVO.SUCCESS_N);
			jRes.setResult("Parameter Error");
			
		}
		return jRes;
	}
	
	
}
