package poly.controller;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.awt.image.Raster;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.util.Iterator;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
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

import poly.util.FileUtil;
import poly.util.UrlUtil;

@Controller
public class FaceController {

	private Logger log = Logger.getLogger(this.getClass());
	
	final private String FACE_UPLOAD_SAVE_PATH = "C:\\faceimg"; // C:\\faceimg 폴더에 저장, 윈도우용 경로
	
	@RequestMapping(value = "face/faceregister1")
	public String faceregister1(HttpServletRequest request, ModelMap model) throws Exception {
		return "face/faceregister1";
	}
	@RequestMapping(value = "face/faceregister2")
	public String faceregister2(HttpServletRequest request, ModelMap model) throws Exception {
		return "face/faceregister2";
	}
	
	@RequestMapping(value = "face/faceupload")
	@ResponseBody
	public int faceupload2(HttpServletRequest request, HttpSession session, @RequestBody Map<String, Object> param)
			throws Exception {
		int res = 1;
		String user_id = (String)session.getAttribute("user_id");
		log.info("user_id : " + user_id);
		
		String json = param.get("imglist").toString();
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(param.get("imglist"));
		
		JSONParser jsonParse = new JSONParser();
		JSONArray jsonArray = (JSONArray)jsonParse.parse(jsonString);
		
		for (int i = 0; i < jsonArray.size(); ++i) {
			String img = String.valueOf(jsonArray.get(i));
			
		    byte[] inputFile = null;
			try {
				if (img == null || img.trim().equals("")) {
					throw new Exception();
				}
				
				inputFile = Base64.decodeBase64(img);
				
				String saveFilePath = FileUtil.mkdirForDate(FACE_UPLOAD_SAVE_PATH);
				String saveFileName = user_id+ i + "." + "jpeg";
				
				String fullFileInfo = saveFilePath + "/" + saveFileName ;
				
				InputStream inputStream = new ByteArrayInputStream(inputFile);
				BufferedImage inputImage = ImageIO.read(inputStream);
				
			    
			    
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
				ImageIO.write(inputImage, "jpeg" , new File(fullFileInfo));
				res = 1;
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
			}
		       
		 }

		return res;
	}

	@RequestMapping(value = "face/facelearning")
	public String facelearning(HttpSession session, ModelMap model, HttpServletRequest request) throws Exception {

		log.info(this.getClass().getName() + ".facelearning start!");
		int save = 0;
		UrlUtil uu = new UrlUtil();

		String url = "http://127.0.0.1:5000";
		String api = "/facedetecting";

		// 호출 URL
		// http://13.125.99.115/facedetecting?get=all
		// pText가 한글이면 인코딩 필요 + URLEncoder.encode(pText, "UTF-8")
		String res = uu.urlReadforString(url + api);
		uu = null;

//		JSONParser jsonParse = new JSONParser();
//		JSONArray jsonArray = (JSONArray)jsonParse.parse(res);    // json 파일을 읽어서 JSONArray에 저장
//		
//		for (Object obj : jsonArray) {
//		       JSONObject childObj = (JSONObject)obj;
//		       System.out.println("result : " + childObj);
//		}
//		model.addAttribute("save", save);
		System.out.println("res : " + res);
		return "face/faceregister";
	}
}
