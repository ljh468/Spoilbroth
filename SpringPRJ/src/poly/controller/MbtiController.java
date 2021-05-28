package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.service.IUserService;




@Controller
public class MbtiController {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserService")
	IUserService userService;
	
	// MBTI 학습전
	@RequestMapping(value = "mbti/mbtimain")
	public String mbtimain(HttpServletRequest request, HttpSession session) {
		log.info(this.getClass().getClass().getName() + "mbtimain start!!");

		return "mbti/mbtimain";
	}
	
	// MBTI 학습후
	@RequestMapping(value = "mbti/mbtimain2")
	public String mbtimain2(HttpServletRequest request, HttpSession session) {
		log.info(this.getClass().getClass().getName() + "mbtimain start!!");

		return "mbti/mbtimain2";
	}
	
	// MBTI 검사화면
	@RequestMapping(value = "mbti/mbtiexamine")
	public String mbtiexamine(HttpServletRequest request, HttpSession session) {
		log.info(this.getClass().getClass().getName() + "mbtimain start!!");

		return "mbti/mbtiexamine";
	}
}
