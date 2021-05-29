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
public class StudyController {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserService")
	IUserService userService;
	
	
	/**
	 * MyStudy Maching 메인화면
	 * 
	 */
	@RequestMapping(value = "study/match")
	public String mystudy(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception{
		log.info(this.getClass().getClass().getName() + "spoilbroth/mystudy start!!");
		
		
		log.info(this.getClass().getClass().getName() + "spoilbroth/mystudy end!!");

		return "study/match";
	}
	
	
}
