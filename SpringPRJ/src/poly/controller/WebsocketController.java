package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

// ServerEndpoint라는 Annotation에서, 본 서버가 어떤 주소로 바인딩 되는지를 정의한다.
@Controller
@ServerEndpoint(value="/echo.do/{study_name}")
public class WebsocketController {

	private Logger log = Logger.getLogger(this.getClass());
	
	private static final List<Session> sessionList = new ArrayList<Session>();;
	


	public WebsocketController() {
		log.info("웹소켓(서버) 객체 생성");
	}
	
	// 웹소켓 연결이 구성되면, Session(Session 인스턴스는 웹소켓이 닫히기 전까지 유효)이 생성되고 
	// @OnOpen 어노테이션이 붙은 endpoint가 호출된다. 
	@OnOpen
    public void onOpen(Session session) {
        log.info("Open session id:" + session.getId());
        log.info("study_name : " + study_name);
        try {
            final Basic basic = session.getBasicRemote();
            basic.sendText("대화방에 연결 되었습니다.");
        } catch (Exception e) {
            log.info(e.getMessage());
        }
        sessionList.add(session);
    }
	
	/**
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param sender
     * @param message
     **/
	
	private void sendAllSessionToMessage(Session self, String sender, String message) {
		
		 try {
	            for (Session session : WebsocketController.sessionList) {
	                if (!self.getId().equals(session.getId())) {
	                    session.getBasicRemote().sendText(sender + " : " + message);
	                }
	            }
	        } catch (Exception e) {
	            log.info(e.getMessage());
	        }
	}
	
	/**
	 * 내가 입력하는 메세지
	 * @param message
	 * @param session
	 */
	// 웹소켓 endpoint가 메시지를 수신하면 @OnMessage 어노테이션이 붙은 매서드가 호출 된다. 
    // 해당 매서드는 다음과 같은 파라미터를 포함할 수 있다.
	@OnMessage
	public void onMessage(String message, Session session) {
		
		String sender = message.split(",")[1];
		message = message.split(",")[0];
		
		log.info("message from : "+ sender + " : " + message);
        try {
            final Basic basic = session.getBasicRemote();
            basic.sendText("<나> : " + message);
        } catch (Exception e) {
            log.info(e.getMessage());
        }
        sendAllSessionToMessage(session, sender, message);
	}
	
	@OnError
	public void onError(Throwable e, Session session, CloseReason reason) {
		log.info(reason.getReasonPhrase());
	}
	// 웹소켓 연결이 닫힐 때, @OnClose 어노테이션이 붙은 매서드가 호출된다. 
	// 해당 매서드는 다음과 같은 파라미터를 포함할 수 있다.
	@OnClose
	public void onClose(Session session) {
		log.info("Session : " + session.getId() + "outside");
	}
}
