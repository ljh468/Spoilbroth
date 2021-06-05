package poly.controller;

import static poly.util.CmmUtil.nvl;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import poly.dto.OcrDTO;
import poly.service.IImgService;
import poly.util.DateUtil;
import poly.util.FileUtil;

@Controller
public class ImageController {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "ImgService")
	IImgService imgService;

	// 프로필 이미지가 업로드되는 파일이 저장되는 기본폴더 설정(자바에서 경로는 /로 표현함)
	final private String USERFILE_UPLOAD_SAVE_PATH = "C:\\userimg"; // C:\\upload 폴더에 저장 /upload
	// 스터디 이미지가 업로드되는 기본폴더 설정
	final private String STUDYFILE_UPLOAD_SAVE_PATH = "C:\\studyimg"; // C:\\upload 폴더에 저장 /upload

	// 프로필 이미지파일 업로드 (ajax로 구현)
	@RequestMapping(value = "FileUplod")
	@ResponseBody
	public Map<String, String> UserFileUpload(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@RequestParam(value = "FileUplod") MultipartFile mf, HttpSession session) throws Exception {

		log.info("FileUplod start");
		int res = 0;

		Map<String, String> rMap = new HashMap<String, String>();
		// 이미지 파일 저장하는 사용자 ID
		String user_id = (String) session.getAttribute("user_id");

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
			String saveFilePath = FileUtil.mkdirForDate(USERFILE_UPLOAD_SAVE_PATH);
			String fullFileInfo = saveFilePath + "/" + saveFileName;

			rMap.put("path", fullFileInfo);

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
			pDTO.setChg_id(user_id);
			pDTO.setChg_dt(DateUtil.getDateTime("yyyy-MM-dd-hh:mm:ss"));

			log.info("imgService start!!");
			res = imgService.InsertImage(pDTO);
			log.info("imgService end!!");

		}
		return rMap;
	}

	// 스터디 이미지파일 업로드 (ajax로 구현)
	@RequestMapping(value = "FileUplod2")
	@ResponseBody
	public Map<String, String> StudyFileUpload(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@RequestParam(value = "fileUplod2") MultipartFile mf, HttpSession session) throws Exception {
		
		// ###################################################################
		// 스터디 이미지 파일 업로드 시작
		log.info("fileUplod2 start");
		int studyImg = 0;

		Map<String, String> rMap = new HashMap<String, String>();
		// 이미지 파일 저장하는 스터디이름
		String study_name = nvl(request.getParameter("study_name"));

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

			rMap.put("path", fullFileInfo);

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
		return rMap;
	}
}
