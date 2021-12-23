package poly.controller;

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

import poly.dto.StudyListDTO;
import poly.dto.UserDTO;
import poly.service.IStudyService;
import poly.service.IUserService;
import poly.util.CmmUtil;
import poly.util.EncryptUtil;

@Controller
public class MypageController {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "UserService")
	private IUserService userService;

	@Resource(name = "StudyService")
	IStudyService studyService;

	@RequestMapping(value = "index")
	public String Index() {
		log.info(this.getClass());

		return "/index";
	}

	@RequestMapping(value = "mypage/setting")
	public String setting(HttpServletRequest request, HttpSession session) {
		log.info("mypage/setting\" start!!");

		String user_id = (String) session.getAttribute("user_id");
		if (user_id == null) {
			return "/user/login";
		}
		log.info("mypage/setting\" end!!");
		return "mypage/setting";
	}

	@RequestMapping(value = "mypage/mbtiModify")
	public String mbtiModify(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
		log.info(this.getClass());
		String user_id = (String) session.getAttribute("user_id");

		if (user_id == null) {
			return "/user/login";
		}

		UserDTO uDTO = new UserDTO();
		uDTO.setUser_id(user_id);

		UserDTO pDTO = new UserDTO();
		pDTO = userService.getUserInfo(uDTO);

		model.addAttribute("pDTO", pDTO);

		return "/mypage/mbtiModify";
	}

	@RequestMapping(value = "mypage/userCorrection")
	public String userCorrection(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap model) throws Exception {
		log.info(this.getClass().getName() + "userCorrection Controller Start!!");

		String user_id = (String) session.getAttribute("user_id");
		if (user_id == null) {
			return "/user/login";
		}

		UserDTO uDTO = null;

		uDTO = new UserDTO();
		uDTO.setUser_id(user_id);

		UserDTO rDTO = userService.getUserInfo(uDTO);

		String user_name = CmmUtil.nvl((String) rDTO.getUser_name());
		String user_email = CmmUtil.nvl((String) rDTO.getUser_email());
		// String user_gender = CmmUtil.nvl((String) rDTO.getUser_gender());
		String user_dept = CmmUtil.nvl((String) rDTO.getUser_dept());
		String user_age = CmmUtil.nvl((String) rDTO.getUser_age());

		log.info(user_name);
		log.info(user_email);
		// log.info(user_gender);
		log.info(user_dept);
		log.info(user_age);

		model.addAttribute("user_name", user_name);
		model.addAttribute("user_email", user_email);
		// model.addAttribute(user_gender);
		model.addAttribute("user_dept", user_dept);
		model.addAttribute("user_age", user_age);

		log.info(this.getClass().getName() + "userCorrection Controller End!!");

		return "/mypage/userCorrection";
	}

	@RequestMapping(value = "mypage/passWordChange")
	public String passWordChange(HttpServletRequest request, HttpSession session) {

		log.info(this.getClass().getName() + "비밀번호 변경 페이지!!!");

		String user_id = (String) session.getAttribute("user_id");
		if (user_id == null) {
			return "/user/login";
		}

		return "/mypage/passWordChange";
	}

	@RequestMapping("mypage/passWordChangeProc")
	public String updateUserPassword(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap model) throws Exception {

		log.info(this.getClass().getName() + "비밀번호 변경 컨트롤러 시작!!!");

		String user_id = (String) session.getAttribute("user_id");
		if (user_id == null) {
			return "/user/login";
		}

		String user_pwd = CmmUtil.nvl(request.getParameter("pwd"));

		log.info("user_id : " + user_id);
		log.info("user_pwd " + user_pwd);

		String url = "";
		String msg = "";

		UserDTO pDTO = null;
		pDTO = new UserDTO();

		pDTO.setUser_id(user_id);
		pDTO.setUser_pwd(EncryptUtil.encHashSHA256(user_pwd));

		int res = userService.updateUserPwd(pDTO);

		if (res == 1) {
			url = "/user/login.do";
			msg = "비밀번호 변경이 완료되었습니 다시 로그인 해주세요.";
		} else {
			url = "/mypage/passWordChange.do";
			msg = "비밀번호 변경에 실패하였습니다 다시 시도해주세요.";
		}

		model.addAttribute("url", url);
		model.addAttribute("msg", msg);

		return "/redirect";

	}

	@RequestMapping(value = "mypage/userDelete")
	public String userDelete(HttpServletRequest request, HttpSession session) throws Exception {
		log.info(this.getClass());
		String user_id = (String) session.getAttribute("user_id");
		if (user_id == null) {
			return "/user/login";
		}

		return "/mypage/userDelete";
	}

	@RequestMapping(value = "mypage/userDeleteProc")
	public String userDeleteInfo(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

		log.info(this.getClass().getName() + "유저 정보 삭제 컨트롤러 시작!!!");
		String user_id = (String) session.getAttribute("user_id");
		if (user_id == null) {
			return "/user/login";
		}
		String del_user = CmmUtil.nvl(request.getParameter("delete_user"));
		log.info("user_id : " + user_id);
		log.info("del_user: " + del_user);

		String url = "";
		String msg = "";

		UserDTO pDTO = new UserDTO();
		pDTO.setUser_id(user_id);

		int res = 0;
		int res2 = 0;
		int res3 = 0;

		/**
		 * 유저가 가입한 모든 스터디의 멤버 컬럼에서 탈퇴한 유저 아이디 지우기
		 */
		// 해당 유저가 가입한 스터디이름 가져오기
		String one = userService.getUserStudy(pDTO);
		System.out.println("one : " + one);
		String[] onelist = one.split(",");

		// 가져온 study_name에 해당하는 스터디에서 해당 유저 아이디 제거
		for (String study_name : onelist) {

			// 스터디 정보에서 스터디 맴버 가져오기
			StudyListDTO oDTO = studyService.getStudyInfo(study_name);
			log.info("members : " + oDTO.getStudy_member());
			String[] arr = oDTO.getStudy_member().split(",");

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
			res = studyService.updateLeaveUser(pMap);
			log.info("updateLeaveUser End!!");
			pMap = null;
		}

		/**
		 * 유저가 생성한 스터디의 멤버에 가입되어있는 아이디를 조회해서 유저정보테이블의 USER_STUDY에서 스터디이름 지우기
		 */
		// 탈퇴할 유저가 생성한 스터디이름 가져오기
		log.info("getcreator Start!!");
		List<HashMap<String, Object>> two = studyService.getcreator(pDTO);
		log.info("getcreator end!!");
		System.out.println("two : " + two);
		for (int k = 0; k < two.size(); k++) {
			System.out.println("studyname : " + two.get(k).get("STUDY_NAME"));
			String studyname = (String) two.get(k).get("STUDY_NAME");

			log.info("null ? : " + studyService.getStudyInfo(studyname) == null);

			// 스터디 정보에서 팀원정보를 가져옴
			StudyListDTO spDTO = studyService.getStudyInfo(studyname);
			if (CmmUtil.nvl(spDTO.getStudy_member()) != "") {
				log.info("members : " + spDTO.getStudy_member());
				String[] arr = spDTO.getStudy_member().split(",");

				ArrayList<String> list = new ArrayList<String>(Arrays.asList(arr));
				arr = null;

				// 모든 팀원정보를 조회하면서 스터디 목록 지우기
				for (String user : list) {
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
						if (str.equals(studyname)) {
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
					res2 = userService.updateLeaveStudy(pMap);
					log.info("updateLeaveStudy End!!");
					pMap = null;
				}
			}

			// 스터디 삭제
			log.info("deleteStudy Start!!");
			res3 = studyService.deleteStudy(studyname);
			log.info("deleteStudy End!!");
		}

		// 회원 탈퇴
		res = userService.deleteUserInfo(pDTO);

		if (res == 1) {
			url = "/user/login.do";
			msg = "회원탈퇴가 완료되었습니다.";

		} else {
			url = "/mypage/userDelete.do";
			msg = "다시 입력해주세요.";
		}

		model.addAttribute("url", url);
		model.addAttribute("msg", msg);

		log.info(this.getClass().getClass().getName() + "유저 정보 삭제 컨트롤러 종료!!!");

		return "/redirect";

	}
}
