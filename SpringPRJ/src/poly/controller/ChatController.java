package poly.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import static poly.util.CmmUtil.nvl;

@Controller
public class ChatController {

	private Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/chat/chatting")
    public String chatting(HttpSession session, ModelMap model, HttpServletRequest request) throws Exception {

        log.info(this.getClass().getName() + ".chatting start!");

        String user_id = nvl((String) session.getAttribute("user_id"));
        String study_name = nvl((String)request.getParameter("study_name"));
        
        log.info("user_id : " + user_id);
        log.info("study_name : " +study_name);

        if (user_id.equals("")) {
            model.addAttribute("msg", "로그인이 필요합니다.");
            model.addAttribute("url", "/user/login.do");
            return "/redirect";
        }asdf

        log.info(this.getClass().getName() + ".chatting end!");

        return "/chat/chatting";
    }
	
}
