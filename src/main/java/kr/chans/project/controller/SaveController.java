package kr.chans.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class SaveController {

	
	@RequestMapping(value="/admin/login", method=RequestMethod.GET)
	public String adminPage(HttpServletRequest request) {
		System.out.println("!!!");
		
		return "/admin/login";
	}
	
	
    
    @RequestMapping(value = "/post/projects", method=RequestMethod.POST)
    public String requestupload2(MultipartHttpServletRequest mtfRequest,  HttpServletRequest request) {
    	
    	
    	
    	
    	
    	
        List<MultipartFile> fileList = mtfRequest.getFiles("file");
        String src = mtfRequest.getParameter("src");
        System.out.println("src value : " + src);

        String path = "\\upload\\image\\";
        
        
        File dir = new File(path);
		
		if( !dir.exists() )
			dir.mkdirs();
		
		Random random = new Random();
		
		for(MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			String fileName = "image_" + random.nextLong() + originFileName.substring(originFileName.indexOf("."));

			File f = new File(dir, fileName);
			
			
			
			try {
				mf.transferTo(f);
				// 디비에도 저장하기 
				
			} catch (Exception e) {	
				System.out.println("file upload EXCEPTION !!");
				e.printStackTrace();
				
				
			}
	        
		
		}
		
		

        return "redirect:/";
    }


	
	
}
