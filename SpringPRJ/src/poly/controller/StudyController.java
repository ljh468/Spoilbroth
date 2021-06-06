package poly.controller;

import static poly.util.CmmUtil.nvl;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
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
import org.springframework.web.multipart.MultipartFile;

import poly.dto.OcrDTO;
import poly.dto.StudyListDTO;
import poly.dto.UserDTO;
import poly.service.IImgService;
import poly.service.IStudyService;
import poly.service.IUserService;
import poly.util.DateUtil;
import poly.util.FileUtil;

@Controller
public class StudyController {

	private Logger log = Logger.getLogger(this.getClass());

	final private String STUDYFILE_UPLOAD_SAVE_PATH = "C:\\studyimg"; // C:\\upload 폴더에 저장 /upload

	@Resource(name = "UserService")
	IUserService userService;

	@Resource(name = "StudyService")
	IStudyService studyService;

	@Resource(name = "ImgService")
	IImgService imgService;

	// MyStudy Maching 메인화면
	@RequestMapping(value = "study/match")
	public String match(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
		log.info(this.getClass().getClass().getName() + "study/match start!!");

		String id = (String) session.getAttribute("user_id");
		String pwd = (String) session.getAttribute("user_pwd");
		String join_dt = (String) session.getAttribute("join_dt");
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_id(id);
		uDTO.setUser_pwd(pwd);

		UserDTO rDTO = new UserDTO();
		rDTO = userService.getUserInfo(uDTO);
		// 추천 스터디 목록조회

		// 모든 스터디 목록 조회
		List<StudyListDTO> pList = studyService.getAllStudyList();
		int count = pList.size();
		System.out.println("count : " + count);

		for (StudyListDTO pDTO : pList) {
			System.out.println(pDTO.getStudy_name());
		}

		model.addAttribute("user_id", nvl(rDTO.getUser_id()));
		model.addAttribute("user_name", nvl(rDTO.getUser_name()));
		model.addAttribute("user_email", nvl(rDTO.getUser_email()));
		model.addAttribute("join_dt", nvl(join_dt));
		model.addAttribute("user_mbti", nvl(rDTO.getUser_mbti()));
		model.addAttribute("user_dept", nvl(rDTO.getUser_dept()));
		model.addAttribute("user_study", nvl(rDTO.getUser_study()));
		model.addAttribute("pList", pList);
		log.info(this.getClass().getClass().getName() + "study/match end!!");

		return "study/match";
	}

	// 스터디 개설하기
	@RequestMapping(value = "study/studyopen")
	public String studyopen(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
		log.info(this.getClass().getClass().getName() + "study/studyopen start!!");

		log.info(this.getClass().getClass().getName() + "study/studyopen end!!");

		return "study/studyopen";
	}

	@RequestMapping(value = "study/inserStudyInfo", method = RequestMethod.POST)
	public String inserStudyInfo(HttpServletRequest request, HttpSession session, ModelMap model,
			@RequestParam(value = "fileUplod2") MultipartFile mf) throws Exception {

		String user_id = (String) session.getAttribute("user_id");

		log.info(this.getClass().getClass().getName() + "study/inserStudyInfo start!!");

		// 가입 결과에 대한 메시지 전달할 변수
		String msg = "";
		String url = "";

		// 웹에서 받는 정보를 저장할 변수
		StudyListDTO sDTO = null;

		try {
			// ###################################################################
			// 개설 스터디 등록
			String study_dt = DateUtil.getDateTime("yyyy-MM-dd");
			String study_field = nvl(request.getParameter("study_field"));
			String study_name = nvl(request.getParameter("study_name"));
			String study_member = (String) session.getAttribute("user_id");
			String study_title = nvl(request.getParameter("study_title"));
			String study_contents = nvl(request.getParameter("study_contents"));

			log.info("study_dt : " + study_dt);
			log.info("study_field : " + study_field);
			log.info("study_name : " + study_name);
			log.info("study_member : " + study_member);
			log.info("study_title : " + study_title);
			log.info("study_contents : " + study_contents);

			sDTO = new StudyListDTO();
			sDTO.setStudy_dt(study_dt);
			sDTO.setStudy_field(study_field);
			sDTO.setStudy_name(study_name);
			sDTO.setStudy_member(study_member);
			sDTO.setStudy_title(study_title);
			sDTO.setStudy_contents(study_contents);

			log.info("insertStudyInfo start!!");
			int res = studyService.insertStudyInfo(sDTO);
			log.info("insertStudyInfo end!!");

			// 스터디 개설하면서 스터디정보 DB에 자신의 아이디 추가
			Map<String, String> sMap = new HashMap<String, String>();
			sMap.put("user_id", user_id);
			sMap.put("study_name", study_name);

			log.info("updateJoinStudy start!!");
			int res2 = userService.updateJoinStudy(sMap);
			log.info("updateJoinStudy end!!");

			// 스터디 등록 끝
			// ###################################################################

			// ###################################################################
			// 스터디 이미지 파일 업로드 시작
			log.info("StudyFileUplod start");
			int studyImg = 0;

			// 임의로 정의된 파일명을 원래대로 만들어주기 위한 목적
			String originalFileName = mf.getOriginalFilename();

			// 파일 확장자 가져오기
			String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1, originalFileName.length())
					.toLowerCase();

			// 이미지 파일만 실행되도록 함
			if (ext.equals("jpeg") || ext.equals("jpg") || ext.equals("gif") || ext.equals("png")) {

				// 웹서버에 저장되는 파일이름 (영어, 숫자로 파일명 변경)
				String saveFileName = DateUtil.getDateTime("24hhmmss") + "." + ext;

				// 웹서버에 업로드한 파일 저장하는 물리적 경로
				String saveFilePath = FileUtil.mkdirForDate(STUDYFILE_UPLOAD_SAVE_PATH);
				String fullFileInfo = saveFilePath + "/" + saveFileName;

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
				pDTO.setChg_id(study_name);
				pDTO.setChg_dt(DateUtil.getDateTime("yyyy-MM-dd-hh:mm:ss"));

				log.info("imgService start!!");
				studyImg = imgService.StudyInsertImage(pDTO);
				log.info("imgService end!!");
			}
			log.info("StudyFileUplod end!!");
			// ###################################################################
			// 스터디 이미지 파일 업로드 끝

			if (res == 1 && studyImg == 1) {
				msg = "스터디그룹이 개설 되었습니다.";
				url = "/study/studyboard.do?study_name=" + study_name;
			} else if (res == 2) {
				msg = "이미 개설된 스터디이름 입니다.";
			} else {
				msg = "오류로 인해  개설이 실패 하였습니다.";
				url = "/study/match.do";
			}

		} catch (Exception e) {
			// 저장이 실패되면 사용자에세 보여줄 메시지
			msg = "실패하였습니다. : " + e.toString();
			log.info(e.toString());
			e.printStackTrace();
		} finally {
			log.info(this.getClass().getName() + "insertStudyInfo End!!");

			// 개설 여부 결과 메시지 전달하기
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			// 회원가입 여부 결과 메시지 전달하기
			model.addAttribute("sDTO", sDTO);

			// 변수 초기화
			sDTO = null;
		}
		log.info(this.getClass().getClass().getName() + "study/inserStudyInfo end!!");
		return "/redirect";
	}

	@RequestMapping(value = "study/contest")
	public String contest(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
		log.info(this.getClass().getClass().getName() + "study/contest start!!");

		log.info(this.getClass().getClass().getName() + "study/contest end!!");

		return "study/contest";
	}

	@RequestMapping(value = "study/contestdetail")
	public String contestdetail(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
		log.info(this.getClass().getClass().getName() + "study/contestdetail start!!");

		log.info(this.getClass().getClass().getName() + "study/contestdetail end!!");

		return "study/contestdetail";
	}

	// 스터디 상세정보 페이지 (가입전 정보보기)
	@RequestMapping(value = "study/studyinfo", method = RequestMethod.GET)
	public String studyinfo(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
		log.info(this.getClass().getClass().getName() + "study/studyinfo start!!");

		String user_id = (String) session.getAttribute("user_id");
		String study_name = nvl(request.getParameter("study_name"));
		log.info("study_name : " + study_name);

		UserDTO uDTO = new UserDTO();

		uDTO.setUser_id(user_id);

		// 유저 정보 가져오기
		UserDTO rDTO = new UserDTO();
		log.info("getUserInfo start");
		rDTO = userService.getUserInfo(uDTO);
		log.info("getUserInfo end");

		// 스터디 정보 가져오기
		StudyListDTO sDTO = new StudyListDTO();
		log.info("getStudyInfo start");
		sDTO = studyService.getStudyInfo(study_name);
		log.info("getStudyInfo end");

		model.addAttribute("sDTO", sDTO);
		model.addAttribute("rDTO", rDTO);
		model.addAttribute("study_name", study_name);
		log.info(this.getClass().getClass().getName() + "study/studyinfo end!!");

		return "study/studyinfo";
	}

	// 스터디 가입하기
	@RequestMapping(value = "study/studysignup")
	public String studysignup(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
		log.info(this.getClass().getClass().getName() + "study/studysignup start!!");

		String user_id = (String) session.getAttribute("user_id");
		String study_name = nvl(request.getParameter("study_name"));

		log.info("user_id : " + user_id);
		log.info("study_name : " + study_name);

		String msg = "";
		String url = "";

		// 스터디 가입하면서 자신의 유저DB에 가입한 스터디이름 추가
		Map<String, String> sMap = new HashMap<String, String>();
		sMap.put("user_id", user_id);
		sMap.put("study_name", study_name);
		
		int res = 0;
		log.info("updateJoinStudy start!!");
		res = userService.updateJoinStudy(sMap);
		log.info("updateJoinStudy end!!");
		// updateJoinStudy 끝
		
		// 가입하려는 스터디 팀원정보에 자신의 아이디추가  
		int res2 = 0;
		log.info("updateJoinUser start!!");
		res2 = studyService.updateJoinUser(sMap); 
		log.info("updateJoinUser end!!");
		
		if(res == 1 && res2 == 1) {
			msg = study_name + "에 가입되었습니다.";
			url = "/study/studyboard.do?study_name="+study_name;
		}else {
			msg = "가입에 실패하였습니다.";
			url = "/study/match.do";
			
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		log.info(this.getClass().getClass().getName() + "study/studysignup end!!");
		return "/redirect";
	}

	// 스터디 게시판 페이지
	@RequestMapping(value = "study/studyboard", method = RequestMethod.GET)
	public String studyboard(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
		log.info(this.getClass().getClass().getName() + "study/studyboard start!!");

		String user_id = (String) session.getAttribute("user_id");
		String study_name = nvl(request.getParameter("study_name"));
		log.info("study_name : " + study_name);

		UserDTO uDTO = new UserDTO();

		uDTO.setUser_id(user_id);

		// 유저 정보 가져오기
		UserDTO rDTO = new UserDTO();
		log.info("getUserInfo start");
		rDTO = userService.getUserInfo(uDTO);
		log.info("getUserInfo end");

		String user_studys = rDTO.getUser_study();
		log.info("user_studys : " + user_studys);
		log.info("contains : " + user_studys.contains(study_name));

		// 스터디 정보 가져오기
		StudyListDTO sDTO = new StudyListDTO();
		log.info("getStudyInfo start");
		sDTO = studyService.getStudyInfo(study_name);
		log.info("getStudyInfo end");

		model.addAttribute("sDTO", sDTO);
		model.addAttribute("rDTO", rDTO);
		model.addAttribute("study_name", study_name);

		log.info(this.getClass().getClass().getName() + "study/studyboard end!!");

		return "study/studyboard";
	}

	// 스터디 이미지 불러오기 ( InputStream으로 파일 불러옴 )
	@RequestMapping(value = "/getStudyImage", method = RequestMethod.GET)
	public void getStudyImage(HttpServletRequest request, HttpSession session, HttpServletResponse response,
			@RequestParam(value = "study_name") String study_name) throws Exception {

		log.info("study_name : " + study_name);

		// 가장 최근에 등록한 프로필 사진 정보가져오기
		log.info("getStudyImgList start! ");
		Map<String, String> pMap = imgService.getStudyImgList(study_name);
		log.info("getStudyImgList end! ");

		String realFile = pMap.get("SAVE_FILE_PATH") + "\\"; // 파일이 저장된 경로 C:\\upload\\
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
			File file = new File(realFile + fileNm);

			if (file.exists()) {
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
			if (out != null) {
				out.flush();
			}
			if (out != null) {
				out.close();
			}
			if (in != null) {
				in.close();
			}
		}
	}
}
