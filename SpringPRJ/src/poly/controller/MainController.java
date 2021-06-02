package poly.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import poly.dto.OcrDTO;
import poly.dto.UserDTO;
import poly.service.IImgService;
import poly.service.IUserService;
import poly.util.DateUtil;
import poly.util.FileUtil;




@Controller
public class MainController {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserService")
	IUserService userService;
	
	@Resource(name="ImgService")
	IImgService imgService;
	
	
	// 업로드되는 파일이 저장되는 기본폴더 설정(자바에서 경로는 /로 표현함)
	final private String FILE_UPLOAD_SAVE_PATH = "c:/upload"; // C:\\upload 폴더에 저장
	
	@RequestMapping(value = "index")
	public String Index() {
		log.info(this.getClass());

		return "/index";
	}
	
	/**
	 * MyStudy 메인화면
	 * 
	 */
	@RequestMapping(value = "spoilbroth/mystudy")
	public String mystudy(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception{
		log.info(this.getClass().getClass().getName() + "spoilbroth/mystudy start!!");
		
		UserDTO uDTO = new UserDTO();
//		String id = (String) session.getAttribute("user_id");
		String id = "ljh468";
//		String pwd = (String) session.getAttribute("user_pwd");
		String pwd = "1234";
		System.out.println("user_id : " + id);
		System.out.println("user_pwd : " + pwd);
		uDTO.setUser_id(id);
		uDTO.setUser_pwd(pwd);

		UserDTO rDTO = new UserDTO();
		rDTO = userService.getUserInfo(uDTO);
        
		model.addAttribute("user_id", rDTO.getUser_id());
		model.addAttribute("user_email", rDTO.getUser_email());
		model.addAttribute("user_dept", rDTO.getUser_dept());
		model.addAttribute("user_auth", rDTO.getUser_email());
		model.addAttribute("join_dt", rDTO.getJoin_DT());
		
		log.info(this.getClass().getClass().getName() + "spoilbroth/mystudy end!!");

		return "spoilbroth/mystudy";
	}
	
	
	@RequestMapping(value = "spoilbroth/main")
	public String main(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
		log.info(this.getClass().getClass().getName() + "user/login start!!");

		UserDTO uDTO = new UserDTO();
		String id = (String) session.getAttribute("user_id");
		String pwd = (String) session.getAttribute("user_pwd");
		System.out.println("user_id : " + id);
		System.out.println("user_pwd : " + pwd);
		uDTO.setUser_id(id);
		uDTO.setUser_pwd(pwd);

		UserDTO rDTO = new UserDTO();
		rDTO = userService.getUserInfo(uDTO);

		model.addAttribute("user_seq", rDTO.getUser_seq());
		model.addAttribute("user_id", rDTO.getUser_id());
		model.addAttribute("user_pwd", rDTO.getUser_pwd());
		model.addAttribute("user_email", rDTO.getUser_email());
		model.addAttribute("user_age", rDTO.getUser_age());
		model.addAttribute("user_dept", rDTO.getUser_dept());
		model.addAttribute("user_auth", rDTO.getUser_email());
		model.addAttribute("join_dt", rDTO.getJoin_DT());

		return "spoilbroth/main";
	}

	@RequestMapping(value = "spoilbroth/main2")
	public String main2(HttpServletRequest request, HttpSession session) {
		log.info(this.getClass().getClass().getName() + "user/login start!!");

		return "spoilbroth/main2";
	}
	
	
	@RequestMapping(value = "spoilbroth/main3")
	public String main3(HttpServletRequest request, HttpSession session) {
		log.info(this.getClass().getClass().getName() + "user/login start!!");

		return "spoilbroth/main3";
	}
	
	@RequestMapping(value = "spoilbroth/main4")
	public String main4(HttpServletRequest request, HttpSession session) {
		log.info(this.getClass().getClass().getName() + "user/login start!!");

		return "spoilbroth/main4";
	}
	
	@RequestMapping(value = "FileUplod")
	@ResponseBody
	public Map<String, String> FileUpload(HttpServletRequest  request, HttpServletResponse response, ModelMap model,
			@RequestParam(value = "fileUplod") MultipartFile mf) throws Exception{
		
		log.info("FileUplod start");
		int res = 0;
		
		Map<String, String> rMap = new HashMap<String, String>();
		// 이미지 파일 저장하는 사용자 ID
		String user_id = "ljh468";
		
		// 임의로 정의된 파일명을 원래대로 만들어주기 위한 목적
		String originalFileName = mf.getOriginalFilename();
		
		// 파일 확장자 가져오기
		String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1, originalFileName.length()).toLowerCase();
		
		// 이미지 파일만 실행되도록 함
		if ( ext.equals("jpeg") || ext.equals("jpg") || ext.equals("gif") || ext.equals("png")) {
			
			// 웹서버에 저장되는 파일이름 (영어, 숫자로 파일명 변경)
			String saveFileName = DateUtil.getDateTime("24hhmmss") + "." + ext;
			
			// 웹서버에 업로드한 파일 저장하는 물리적 경로
			String saveFilePath = FileUtil.mkdirForDate(FILE_UPLOAD_SAVE_PATH);
			String fullFileInfo = saveFilePath + "/" + saveFileName;
			
			
			rMap.put("path", fullFileInfo);
			
			// 정상적으로 값이 생성되었는지 로그에 찍어서 확인
			log.info("ext : " + ext);
			log.info("originalFileName : " + originalFileName);
			log.info("saveFileName : " + saveFileName);
			log.info("saveFilePath : " + saveFilePath);
			log.info("fullFileInfo : " + fullFileInfo);
			
			// 업로드 되는 파일을 서버에 저장
			mf.transferTo(new File(fullFileInfo));
			
			OcrDTO pDTO = new OcrDTO();
			
			pDTO.setSave_file_name(saveFileName);
			pDTO.setSave_file_path(saveFilePath);
			pDTO.setOrg_file_name(originalFileName);
			pDTO.setExt(ext);
			pDTO.setChg_id(user_id);
			
			log.info("imgService start!!");
			res = imgService.InsertImage(pDTO);
			log.info("imgService end!!");
		}else {
			log.info("확장자가 올바르지 않음");
		}
		
		return rMap;
	}
	
	
	
}
