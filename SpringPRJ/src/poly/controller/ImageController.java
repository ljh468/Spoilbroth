package poly.controller;

import static poly.util.CmmUtil.nvl;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.ImageIcon;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import poly.dto.OcrDTO;
import poly.service.IImgService;
import poly.util.DateUtil;
import poly.util.FileUtil;
import poly.util.ImageResizeUtil;
import poly.util.UploadFileUtil;

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
	public void UserFileUpload(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@RequestParam(value = "fileUplod") MultipartFile mf, HttpSession session) throws Exception {
		log.info("UserFileUpload start");

		int res = 0;
		// 이미지 파일 저장하는 사용자 ID
		String user_id = (String) session.getAttribute("user_id");

		// 파일 업로드
		log.info("uploadfile end");
		OcrDTO pDTO = UploadFileUtil.uploadfile(mf, USERFILE_UPLOAD_SAVE_PATH, user_id);
		log.info("uploadfile end");
		
		// 파일 저장할 경로를 DB에 저장
		log.info("imgService start!!");
		res = imgService.InsertImage(pDTO);
		log.info("imgService end!!");

		log.info("UserFileUpload end");
		// 유저 이미지 파일 업로드 끝
	}

	// 스터디 이미지파일 업로드 (ajax로 구현)
	@RequestMapping(value = "FileUplod2")
	@ResponseBody
	public void StudyFileUpload(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@RequestParam(value = "fileUplod2") MultipartFile mf, HttpSession session) throws Exception {

		// 스터디 이미지 파일 업로드 시작
		log.info("fileUplod2 start");
		int studyImg = 0;

		// 이미지 파일 저장하는 스터디이름
		String study_name = nvl(request.getParameter("study_name"));

		// 파일 업로드
		log.info("uploadfile end");
		OcrDTO pDTO = UploadFileUtil.uploadfile(mf, STUDYFILE_UPLOAD_SAVE_PATH, study_name);
		log.info("uploadfile end");

		// 파일 저장할 경로를 DB에 저장
		log.info("imgService start!!");
		studyImg = imgService.StudyInsertImage(pDTO);
		log.info("imgService end!!");

		log.info("StudyFileUplod end!!");
		// 스터디 이미지 파일 업로드 끝

	}

	@RequestMapping(value = "/getImage", method = RequestMethod.GET)

	public void getImage(HttpServletRequest request, HttpSession session, HttpServletResponse response,
			@RequestParam(value = "user_id") String user_id) throws Exception {

		log.info("user_id : " + user_id);

		// 가장 최근에 등록한 프로필 사진 정보가져오기
		log.info("getImgList start! ");
		Map<String, String> pMap = imgService.getImgList(user_id);
		log.info("getImgList end! ");

		if (pMap == null) {
			pMap = new HashMap<String, String>();
		}

		String realFile = nvl(pMap.get("SAVE_FILE_PATH") + "/"); // 파일이 저장된 경로 : /usr/local/images/userimg/0000/00/00/
		String fileNm = nvl(pMap.get("SAVE_FILE_NAME")); // 파일명 : 000000.jpg 000000.png
		String ext = nvl(pMap.get("EXT")); // 파일 확장자
		log.info("realFile : " + realFile);
		log.info("fileNm : " + fileNm);
		log.info("ext : " + ext);

		BufferedOutputStream out = null;
		InputStream in = null;

		try {

			if (!ext.equals("")) {
				response.setContentType("image/" + ext);
				response.setHeader("Content-Disposition", "inline;filename=" + fileNm);
				File file = new File(realFile + fileNm);
				log.info("file : " + file);

				in = new FileInputStream(file);
				out = new BufferedOutputStream(response.getOutputStream());
				int len;
				byte[] buf = new byte[1024];
				while ((len = in.read(buf)) > 0) {
					out.write(buf, 0, len);
				}
			} else {
				log.info("basicFile start");

				String basicFile = "/imgg/basicimg.png";

				File file1 = new File(basicFile);
				log.info("basicFile : " + basicFile);
				log.info("file1 : " + file1);

				in = new FileInputStream(file1);
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

	// 스터디 이미지 불러오기 ( InputStream으로 파일 불러옴 )
	@RequestMapping(value = "/getStudyImage", method = RequestMethod.GET)
	public void getStudyImage(HttpServletRequest request, HttpSession session, HttpServletResponse response,
			@RequestParam(value = "study_name") String study_name) throws Exception {

		log.info("study_name : " + study_name);

		// 가장 최근에 등록한 프로필 사진 정보가져오기
		log.info("getStudyImgList start! ");
		Map<String, String> pMap = imgService.getStudyImgList(study_name);
		log.info("getStudyImgList end! ");

		if (pMap == null) {
			pMap = new HashMap<String, String>();
		}
		String realFile = nvl(pMap.get("SAVE_FILE_PATH") + "\\"); // 파일이 저장된 경로 C:\\upload\\
		String fileNm = nvl(pMap.get("SAVE_FILE_NAME")); // 파일명
		String ext = nvl(pMap.get("EXT")); // 파일 확장자
		log.info("realFile : " + realFile);
		log.info("fileNm : " + fileNm);
		log.info("ext : " + ext);

		BufferedOutputStream out = null;
		InputStream in = null;

		try {

			if (!ext.equals("")) {
				response.setContentType("image/" + ext);
				response.setHeader("Content-Disposition", "inline;filename=" + fileNm);
				File file = new File(realFile + fileNm);
				log.info("file : " + file);

				in = new FileInputStream(file);
				out = new BufferedOutputStream(response.getOutputStream());
				int len;
				byte[] buf = new byte[1024];
				while ((len = in.read(buf)) > 0) {
					out.write(buf, 0, len);
				}
			} else {
				response.setContentType("image/" + ext);
				response.setHeader("Content-Disposition", "inline;filename=" + fileNm);
				log.info("basicFile start");
				String basicFile = "C:\\imgg\\basicimg.png";

				File file1 = new File(basicFile);
				log.info("basicFile : " + basicFile);
				log.info("file1 : " + file1);

				in = new FileInputStream(file1);
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
