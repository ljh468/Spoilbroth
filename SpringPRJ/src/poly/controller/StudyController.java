package poly.controller;

import static poly.util.CmmUtil.nvl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.StudyListDTO;
import poly.dto.UserDTO;
import poly.service.IStudyService;
import poly.service.IUserService;




@Controller
public class StudyController {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserService")
	IUserService userService;
	
	@Resource(name="StudyService")
	IStudyService studyService;
	
	
	/**
	 * MyStudy Maching 메인화면
	 * 
	 */
	@RequestMapping(value = "study/match")
	public String match(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception{
		log.info(this.getClass().getClass().getName() + "study/match start!!");
		
		String user_id = (String)session.getAttribute("user_id");
		
		// 추천 스터디 목록조회
		
		
		// 모든 스터디 목록 조회
		List<StudyListDTO> pList = studyService.getAllStudyList();
		int count = pList.size();
		System.out.println("count : " + count) ;
		
		for(StudyListDTO pDTO : pList) {
			System.out.println(pDTO.getStudy_name());
		}
		
		model.addAttribute("pList", pList);
		log.info(this.getClass().getClass().getName() + "study/match end!!");

		return "study/match";
	}
	
	

	
	@RequestMapping(value = "study/studyopen")
	public String studyopen(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception{
		log.info(this.getClass().getClass().getName() + "study/studyopen start!!");
		
		
		log.info(this.getClass().getClass().getName() + "study/studyopen end!!");

		return "study/studyopen";
	}
	
	@RequestMapping(value = "study/openProc")
	public String openProc(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception{
		log.info(this.getClass().getClass().getName() + "study/openProc start!!");
		
		log.info("study/openProc Start!!");
		String study_name = nvl(request.getParameter("study_name"));
		String pwd = nvl(request.getParameter("user_pwd"));
		
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
			url = "/user/login.do";
		}else {
			log.info("데이터 조회완료");
			
			session.setAttribute("user_id", rDTO.getUser_id());
			session.setAttribute("user_pwd", rDTO.getUser_pwd());
			session.setAttribute("join_dt", rDTO.getJoin_dt());
			
			msg = "환영합니다.";
			url = "/spoilbroth/mystudy.do";
		
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		log.info("user/loginproc End!!");
		return "/redirect";
		log.info(this.getClass().getClass().getName() + "study/openProc end!!");

		return "redirect";
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
