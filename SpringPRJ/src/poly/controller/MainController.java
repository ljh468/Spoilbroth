package poly.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import poly.dto.UserDTO;
import poly.service.IImgService;
import poly.service.IUserService;
import static poly.util.CmmUtil.nvl;




@Controller
public class MainController {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserService")
	IUserService userService;
	
	@Resource(name="ImgService")
	IImgService imgService;
	
	@RequestMapping(value = "index")
	public String Index() {
		log.info(this.getClass());

		return "/index";
	}
	
	// MyStudy 메인화면
	@RequestMapping(value = "spoilbroth/mystudy")
	public String mystudy(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception{
		
		log.info(this.getClass().getClass().getName() + "spoilbroth/mystudy start!!");
		
		
		String id = (String) session.getAttribute("user_id");
		String pwd = (String) session.getAttribute("user_pwd");
		
		System.out.println("user_id : " + id);
		System.out.println("user_pwd : " + pwd);
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_id(id);
		uDTO.setUser_pwd(pwd);

		UserDTO rDTO = new UserDTO();
		rDTO = userService.getUserInfo(uDTO);
		System.out.println(rDTO.getUser_study());
		
		model.addAttribute("user_id", nvl(rDTO.getUser_id()));
		model.addAttribute("user_name", nvl(rDTO.getUser_name()));
		model.addAttribute("user_email", nvl(rDTO.getUser_email()));
		model.addAttribute("user_dept", nvl(rDTO.getUser_dept()));
		model.addAttribute("user_mbti", nvl(rDTO.getUser_mbti()));
		model.addAttribute("user_study", nvl(rDTO.getUser_study()));
		
		
		log.info(this.getClass().getClass().getName() + "spoilbroth/mystudy end!!");

		return "spoilbroth/mystudy";
	}
	
	// 프로필 이미지 불러오기 ( InputStream으로 파일 불러옴 )
	@RequestMapping(value="/getImage", method=RequestMethod.GET)
	public void getImage(HttpServletRequest request, HttpSession session, HttpServletResponse response, @RequestParam (value="user_id") String user_id) 
			throws Exception {
		
		log.info("user_id : " + user_id);
		
		// 가장 최근에 등록한 프로필 사진 정보가져오기
		log.info("getImgList start! ");
		Map<String, String> pMap = imgService.getImgList(user_id);
		log.info("getImgList end! ");
		
		
		String realFile = pMap.get("SAVE_FILE_PATH")+"\\"; // 파일이 저장된 경로 C:\\upload\\
		String fileNm = pMap.get("SAVE_FILE_NAME"); // 파일명
		String ext = pMap.get("EXT"); // 파일 확장자
		log.info("realFile : " + realFile);
		log.info("fileNm : " + fileNm);
		log.info("ext : " + ext);

		BufferedOutputStream out = null;
		InputStream in = null;

		try {
			response.setContentType("image/" + ext);
			response.setHeader("Content-Disposition", "inline;filename=" + fileNm);
			File file = new File(realFile+fileNm);
			
			if(file.exists()){
				in = new FileInputStream(file);
				out = new BufferedOutputStream(response.getOutputStream());
				int len;
				byte[] buf = new byte[1024];
				while ((len = in.read(buf)) > 0) {
					out.write(buf, 0, len);
				}
			}
		} catch (Exception e) {
			log.info(e.getStackTrace());
		} finally {
			if(out != null){ out.flush(); }
			if(out != null){ out.close(); }
			if(in != null){ in.close(); }
		}
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
		model.addAttribute("join_dt", rDTO.getJoin_dt());

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
	

	
	
	
}
