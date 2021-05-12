package poly.controller;
import static poly.util.CmmUtil.nvl;

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
public class UserInfoController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserService")
	IUserService userService;
	
	// 로그인
	@RequestMapping(value="user/login")
	public String login(HttpServletRequest request, HttpSession session) {
		log.info(this.getClass().getClass().getName() +"user/login start!!");
		
//		if(session.getAttribute("user_id") != null) {
//			
//			return "/spoilbroth/main";
//		}else {
//			session.invalidate();
//		}
		return "user/login";
	}
	
	@RequestMapping(value="user/loginProc")
	public String loginProc(HttpServletRequest request, HttpSession session, ModelMap model) {
		
		log.info("user/loginProc Start!!");
		String id = nvl(request.getParameter("id"));
		String pwd = nvl(request.getParameter("pwd"));
		
		log.info("id : " + id);
		log.info("pwd : " + pwd);
		
		UserDTO uDTO = new UserDTO();
		
		uDTO.setUser_id(id);
		uDTO.setUser_pwd(pwd);
		
		UserDTO rDTO = new UserDTO();
		rDTO = userService.getUserInfo(uDTO);
		
		String msg = "";
		String url = "";
		if(rDTO == null) {
			log.info("rDTO == null?"+(rDTO==null));
			msg = "아이디 비밀번호를 확인해주세요";
		}else {
			log.info("데이터 조회완료");
			
			session.setAttribute("user_id", rDTO.getUser_id());
			session.setAttribute("pwd", rDTO.getUser_pwd());
			model.addAttribute("user_seq", rDTO.getUser_seq());
			model.addAttribute("user_id", rDTO.getUser_id());
			model.addAttribute("user_pwd", rDTO.getUser_pwd());
			model.addAttribute("user_email", rDTO.getUser_email());
			model.addAttribute("join_dt", rDTO.getJoin_DT());
			
		return "/spoilbroth/main";
		
		}
		url = "/user/login";
		
		log.info("user/loginproc End!!");
		return "/redirect";
	}
	
	// 로그인
		@RequestMapping(value="user/signup")
		public String signup(HttpServletRequest request, HttpSession session) {
			log.info(this.getClass().getClass().getName() +"user/signup start!!");
			
			
			return "user/signup";
		}
		
	
	@RequestMapping(value="spoilbroth/main")
	public String main(HttpServletRequest request, HttpSession session) {
		log.info(this.getClass().getClass().getName() +"user/login start!!");
		
//		if(session.getAttribute("user_id") != null) {
//			
//			return "/spoilbroth/main";
//		}else {
//			session.invalidate();
//		}
		return "spoilbroth/main";
	}
	
	@RequestMapping(value="spoilbroth/main2")
	public String main2(HttpServletRequest request, HttpSession session) {
		log.info(this.getClass().getClass().getName() +"user/login start!!");
		
//		if(session.getAttribute("user_id") != null) {
//			
//			return "/spoilbroth/main";
//		}else {
//			session.invalidate();
//		}
		return "spoilbroth/main2";
	}
	
	
	
	
	
}




