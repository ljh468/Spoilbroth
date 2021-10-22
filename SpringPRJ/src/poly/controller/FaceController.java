package poly.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.ContestDTO;
import poly.util.UrlUtil;

@Controller
public class FaceController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="face/faceregister")
	public String faceregister(HttpServletRequest request, ModelMap model)throws Exception{
		return "face/faceregister";
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
