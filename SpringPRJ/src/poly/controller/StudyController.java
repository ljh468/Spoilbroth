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
		log.info(this.getClass().getClass().getName() + "spoilbroth/match start!!");
		
		
		log.info(this.getClass().getClass().getName() + "spoilbroth/match end!!");

		return "study/match";
	}
	
	@RequestMapping(value = "study/studyopen")
	public String studyopen(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception{
		log.info(this.getClass().getClass().getName() + "study/studyopen start!!");
		
		
		log.info(this.getClass().getClass().getName() + "study/studyopen end!!");

		return "study/studyopen";
	}
	
	@RequestMapping(value = "study/contest")
	public String contest(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception{
		log.info(this.getClass().getClass().getName() + "study/contest start!!");
		
		
		log.info(this.getClass().getClass().getName() + "study/contest end!!");

		return "study/contest";
	}
	
	@RequestMapping(value = "study/contestdetail")
	public String contestdetail(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception{
		log.info(this.getClass().getClass().getName() + "study/contestdetail start!!");
		
		
		log.info(this.getClass().getClass().getName() + "study/contestdetail end!!");

		return "study/contestdetail";
	}
	
	@RequestMapping(value = "study/studyinfo")
	public String studyinfo(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception{
		log.info(this.getClass().getClass().getName() + "study/studyinfo start!!");
		
		
		log.info(this.getClass().getClass().getName() + "study/studyinfo end!!");

		return "study/studyinfo";
	}
	
	@RequestMapping(value = "study/studyboard")
	public String studyboard(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception{
		log.info(this.getClass().getClass().getName() + "study/contestdetail start!!");
		
		
		log.info(this.getClass().getClass().getName() + "study/contestdetail end!!");

		return "study/studyboard";
	}
	
	
}
