package poly.controller;

import java.io.File;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/common")
public class CommonController {
	


	@RequestMapping("/download")
	public ModelAndView download(@RequestParam HashMap<Object, Object> params, ModelAndView mv) {
		String filesrc = (String) params.get("src");
		
		final String FILE_SERVER_PATH = filesrc;
		
		String fileName = (String) params.get("fileName");
		String fullPath = FILE_SERVER_PATH + "/" + fileName;
		File file = new File(fullPath);
		
		mv.setViewName("downloadView");
		mv.addObject("downloadFile", file);
		return mv;
	}

}