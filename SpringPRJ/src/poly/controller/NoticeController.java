package poly.controller;

import static poly.util.CmmUtil.nvl;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

import poly.dto.StudyListDTO;
import poly.dto.UserDTO;
import poly.service.IImgService;
import poly.service.INoticeService;
import poly.service.IStudyService;
import poly.service.IUserService;




@Controller
public class NoticeController {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserService")
	IUserService userService;
	
	@Resource(name = "StudyService")
	IStudyService studyService;

	@Resource(name = "NoticeService")
	INoticeService noticeService;
	
	/**
	 * 게시판 리스트 보여주기
	 */
	@RequestMapping(value="notice/NoticeList", method = RequestMethod.GET)
	public String NoticeList(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		
		log.info(this.getClass().getName() + "NoticeList Start! ");
		
		// 공항 리스트 가져오기
		
		
		
		log.info(this.getClass().getName() + "NoticeList End! ");
		return null;
	}

	
	
	
}
