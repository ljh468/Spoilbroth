package poly.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.tomcat.util.codec.binary.Base64;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import poly.dto.FaceDTO;
import poly.service.IFaceService;
import poly.util.DateUtil;
import poly.util.FileUtil;
import poly.util.UrlUtil;

@Controller
public class FaceController {
	
	@Resource(name = "FaceService")
	IFaceService faceSerivice;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	final private String FACE_UPLOAD_SAVE_PATH = "C:\\faceimg"; // C:\\faceimg 폴더에 저장, 윈도우용 경로
	final private String FACE_MODEL_PATH = "C:\\opencv_login\\model"; // C:\\faceimg 폴더에 저장, 윈도우용 경로

	@RequestMapping(value = "face/faceregister")
	public String faceregister(HttpServletRequest request, ModelMap model) throws Exception {
		return "face/faceregister";
	}

	@RequestMapping(value = "face/faceupload")
	@ResponseBody
	public int faceupload(HttpServletRequest request, HttpSession session, @RequestBody Map<String, Object> param)
			throws Exception {
		int res = 1;
		String user_id = (String) session.getAttribute("user_id");
		log.info("user_id : " + user_id);

		// String json = param.get("imglist").toString();

		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(param.get("imglist"));

		JSONParser jsonParse = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParse.parse(jsonString);
			
		String saveFilePath = FileUtil.mkdirface(FACE_UPLOAD_SAVE_PATH , user_id);
		
		for (int i = 0; i < jsonArray.size(); ++i) {
			String img = String.valueOf(jsonArray.get(i));

			byte[] inputFile = null;
			try {
				if (img == null || img.trim().equals("")) {
					throw new Exception();
				}

				inputFile = Base64.decodeBase64(img);

				String saveFileName = i + 1 + "." + "jpeg";

				String fullFileInfo = saveFilePath + "/" + saveFileName;

				InputStream inputStream = new ByteArrayInputStream(inputFile);
				BufferedImage inputImage = ImageIO.read(inputStream);

// 이미지 흑백 처리			    
//				for(int y = 0; y < inputImage.getHeight(); y++) {
//					   for(int x = 0; x < inputImage.getWidth(); x++) {
//					       Color colour = new Color(inputImage.getRGB(x, y));
//					       Choose one from below
//					       int Y = (int) (0.299 * colour.getRed() + 0.587 * colour.getGreen() + 0.114 * colour.getBlue());
//					       int Y = (int) (0.2126 * colour.getRed() + 0.7152 * colour.getGreen() + 0.0722 * colour.getBlue());
//					       inputImage.setRGB(x, y, new Color(Y, Y, Y).getRGB());
//					   }
//					}
//				
				ImageIO.write(inputImage, "jpeg", new File(fullFileInfo));
				res = 1;

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
			}

		}
		
		// 파일 저장할 경로를 DB에 저장
		String save_file_path = FACE_UPLOAD_SAVE_PATH + "\\" + user_id;
		String save_model_path = FACE_MODEL_PATH + "\\" +user_id + "_trainner.yml";
				
		FaceDTO pDTO = new FaceDTO();
		pDTO.setUser_id(user_id);
		pDTO.setSave_file_path(save_file_path);
		pDTO.setSave_model_path(save_model_path);
		pDTO.setReg_dt(DateUtil.getDateTime("yyyy-MM-dd-hh:mm:ss"));
		
		int res2 = faceSerivice.FaceInsertImage(pDTO);
		
		// 얼굴 학습을 위해 python-server로 보냄
		log.info(this.getClass().getName() + ".face_Learning start!");
		int save = 0;
		UrlUtil uu = new UrlUtil();

		String url = "http://127.0.0.1:8000";
		String api = "/faceloginAPI";
		String pName = "?user_id=";

		// 호출 URL
		// http://13.125.99.115/faceloginAPI?user_id=
		// pText가 한글이면 인코딩 필요 + URLEncoder.encode(pText, "UTF-8")
		String res3 = uu.urlReadforString(url + api + pName + user_id);
		uu = null;
		log.info("res3 : " + res3);
		log.info(this.getClass().getName() + ".face_Learning end!");
		
		
		if(res==1 && res2 == 1 && res3.equals("success")) {
			res = 1;
		}else {
			res = 0;
		}
		return res;
	}

}
