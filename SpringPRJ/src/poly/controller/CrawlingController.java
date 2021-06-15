package poly.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
public class CrawlingController {

	private Logger log = Logger.getLogger(this.getClass());

	// 파이썬 셀리니움 크롤링
	/**
	 * @param session
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/crawling")
	public String chatting(HttpSession session, ModelMap model, HttpServletRequest request) throws Exception {

		log.info(this.getClass().getName() + ".chatting start!");

		UrlUtil uu = new UrlUtil();

		String url = "http://127.0.0.1:5000";
		String api = "/crawlingAPI";

		// 호출 URL
		// http://13.125.99.115/crawlingAPI?get=all
		// pText가 한글이면 인코딩 필요 + URLEncoder.encode(pText, "UTF-8")
		String res = uu.urlReadforString(url + api);
		log.info("res : " + res);
		uu = null;
		
		/* python에서 리스트 > 딕셔너리 > 리스트 > 딕셔너리 구조로 만들어야 함 ( JSON 구조로 변환 ) 
		 * [
			    {
			        "rlist" : [{"contest_name": "2021년 제9회 서울상징 관광기념품 공모전"}, {"contest_name": "제25회 LH 대학생 주택건축대전"}]
			    },
			    {
			        "rlist" : [{"contest_name": "2021년 제9회 서울상징 관광기념품 공모전"}, {"contest_name": "제56회 대한민국디자인전람회"}]
			    },
			]
		 */
		// JSON 파싱 [{ : },{ : }{ : }] list<Map<String, String>> 형태	
		// JSON JSONArray 파싱
		JSONParser jsonParse = new JSONParser();
		JSONArray jsonArray = (JSONArray)jsonParse.parse(res);    // json 파일을 읽어서 JSONArray에 저장

		for (int i = 0; i < jsonArray.size(); ++i) {
		    JSONObject jo = (JSONObject)jsonArray.get(i);                        // 첫번째 list를 꺼낸다

		    JSONArray arrays = (JSONArray)jo.get("rlist");                       // list 안의 list를 가져온다
		    for (Object obj : arrays) {
		       JSONObject childObj = (JSONObject)obj;
		       System.out.println(childObj.get("contest_name"));
		    }
		}
		
//		 
//		for (int i = 0; i < jsonArray.size(); ++i) {
//		    JSONObject jo = (JSONObject)jsonArray.get(i);                        // 첫번째 list를 꺼낸다
//		    String id = (String)jo.get("id");// list 안의 list를 가져온다 (카테고리를 가져옴)
//		    
//		    JSONArray arrays = (JSONArray)jo.get("list");
//		    for (Object obj : arrays) {
//		       JSONObject childObj = (JSONObject)obj;
//		       System.out.println(childObj.get("contest_name"));
//		       System.out.println(childObj.get("contest_img"));
//		       System.out.println(childObj.get("contest_host"));
//		       System.out.println(childObj.get("contest_area"));
//		       System.out.println(childObj.get("contest_day"));
//		       System.out.println(childObj.get("contest_prize"));
//		       System.out.println(childObj.get("contest_addr"));
//		       System.out.println(childObj.get("contest_contents"));
//		    }
//		}
		 

		return "/crawling";
	}
}
