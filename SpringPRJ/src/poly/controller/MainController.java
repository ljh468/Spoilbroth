package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.UserDTO;
import poly.service.IUserService;




@Controller
public class MainController {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserService")
	IUserService userService;
	
	
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
	
}
