package poly.controller;

import static poly.util.CmmUtil.nvl;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
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

import poly.dto.BoardDTO;
import poly.dto.OcrDTO;
import poly.dto.StudyListDTO;
import poly.dto.UserDTO;
import poly.service.IImgService;
import poly.service.IBoardService;
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
	
	@Resource(name = "BoardService")
	IBoardService boardService;

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
			sDTO.setStudy_creator(user_id);

			log.info("insertStudyInfo start!!");
			int res = studyService.insertStudyInfo(sDTO);
			log.info("insertStudyInfo end!!");

			// 스터디 개설하면서 유저정보 DB에 스터디이름 추가
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
		log.info("rDTO : " + rDTO.getUser_email());
		log.info("sDTO : " + sDTO.getStudy_creator());

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

		if (res == 1 && res2 == 1) {
			msg = study_name + "에 가입되었습니다.";
			url = "/study/studyboard.do?study_name=" + study_name;
		} else {
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
		
		// 스터디 게시판 데이터 가져오기
		String study_seq = nvl(sDTO.getStudy_seq());
		log.info("study_seq : " + study_seq);
		List<BoardDTO> rList = boardService.getBoardList(study_seq);
		if(rList==null) {
			rList = new ArrayList<>();
		}
		
		model.addAttribute("rList", rList); // 스터디별 게시판 정보
		model.addAttribute("sDTO", sDTO); // 스터디 정보
		model.addAttribute("rDTO", rDTO); // 유저 정보
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

	// 스터디 탈퇴하기
	@RequestMapping(value = "/study/leave", method = RequestMethod.GET)
	public String leave(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

		log.info("/study/leave start !! ");
		String user_id = (String) session.getAttribute("user_id");
		String study_name = nvl(request.getParameter("study_name"));

		String msg = "";
		String url = "";

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// 스터디 정보에서 스터디 맴버 가져오기
		StudyListDTO pDTO = studyService.getStudyInfo(study_name);
		log.info("members : " + pDTO.getStudy_member());
		String[] arr = pDTO.getStudy_member().split(",");

		ArrayList<String> list = new ArrayList<String>(Arrays.asList(arr));
		arr = null;
		String leave_study_member = "";
		for (int i = 0; i < list.size(); i++) {
			String str = list.get(i);
			if (str.equals(user_id)) {
				list.remove(i);
			}
		}
		leave_study_member = String.join(",", list);
		log.info("leave_study_member : " + leave_study_member);
		list = null;

		// 스터디 정보에서 탈퇴하는 아이디 지우기
		Map<String, String> pMap = new HashMap<String, String>();
		pMap.put("sutdy_member", leave_study_member);
		pMap.put("study_name", study_name);

		log.info("updateLeaveUser Start!!");
		int res = studyService.updateLeaveUser(pMap);
		log.info("updateLeaveUser End!!");
		pMap = null;
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// 유저 정보에서 가입한 스터디 목록 가져오기
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_id(user_id);
		uDTO = userService.getUserInfo(uDTO);
		arr = uDTO.getUser_study().split(",");

		list = new ArrayList<String>(Arrays.asList(arr));
		arr = null;
		String leave_user_study = "";
		for (int i = 0; i < list.size(); i++) {
			String str = list.get(i);
			if (str.equals(study_name)) {
				list.remove(i);
			}
		}
		leave_user_study = String.join(",", list);
		log.info("leave_user_study : " + leave_user_study);

		// 유저 정보에서 탈퇴하는 스터디 지우기
		pMap = new HashMap<String, String>();
		pMap.put("user_study", leave_user_study);
		pMap.put("user_id", user_id);

		log.info("updateLeaveStudy Start!!");
		int res2 = userService.updateLeaveStudy(pMap);
		log.info("updateLeaveStudy End!!");
		pMap = null;

		log.info("res : " + res);
		log.info("res2 : " + res2);
		if (res == 1 && res2 == 1) {
			msg = "탈퇴가 완료되었습니다.";
			url = "/spoilbroth/mystudy.do";
		} else {
			msg = "탈퇴에 실패하였습니다.";
			url = "/study/studyboard.do?study_name=" + study_name;
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "/redirect";
	}

	// 스터디 삭제하기 (스터디 개설자만 삭제할수 있음)
	@RequestMapping(value = "/study/del", method = RequestMethod.GET)
	public String del(HttpSession session, HttpServletRequest request, ModelMap model) throws Exception {

		log.info("/study/del start !! ");
		String user_id = (String) session.getAttribute("user_id");
		String study_name = nvl(request.getParameter("study_name"));

		String msg = "";
		String url = "";
		int res = 0;
		int res2 = 0;
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// 모든 유저 user_study에서 study_name을 제거
		
		// 스터디 정보에서 팀원정보를 가져옴
		StudyListDTO pDTO = studyService.getStudyInfo(study_name);
		log.info("members : " + pDTO.getStudy_member());
		String[] arr = pDTO.getStudy_member().split(",");

		ArrayList<String> list = new ArrayList<String>(Arrays.asList(arr));
		arr = null;
		
		// 모든 팀원정보를 조회하면서 스터디 목록 지우기
		for(String user : list) {
			// 유저 정보에서 가입한 스터디 목록 가져오기
			UserDTO uDTO = new UserDTO();
			uDTO.setUser_id(user);
			uDTO = userService.getUserInfo(uDTO);
			arr = uDTO.getUser_study().split(",");

			list = new ArrayList<String>(Arrays.asList(arr));
			arr = null;
			String leave_user_study = "";
			for (int i = 0; i < list.size(); i++) {
				String str = list.get(i);
				if (str.equals(study_name)) {
					list.remove(i);
				}
			}
			leave_user_study = String.join(",", list);
			log.info("leave_user_study : " + leave_user_study);

			// 유저 정보에서 삭제하려는 스터디 지우기
			HashMap<String, String> pMap = new HashMap<String, String>();
			pMap.put("user_study", leave_user_study);
			pMap.put("user_id", user);

			log.info("updateLeaveStudy Start!!");
			res = 0;
			res = userService.updateLeaveStudy(pMap);
			log.info("updateLeaveStudy End!!");
			pMap = null;
		}
		
		// 스터디 삭제
		log.info("deleteStudy Start!!");
		res2 = studyService.deleteStudy(study_name);
		log.info("deleteStudy End!!");
		
		// 스터디 삭제가 완료되면 실행
		if (res2==1) {
			msg = "삭제가 완료되었습니다.";
			url = "/spoilbroth/mystudy.do";
		}else {
			msg = "삭제에 실패하였습니다.";
			url = "/spoilbroth/mystudy.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "/redirect";
	}
}
