package changmin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import changmin.dto.MyMessage;
import changmin.service.face.MessageService;

@Controller
public class MessageController {

	private Logger logger = LoggerFactory.getLogger(MessageController.class); 
	
	@Autowired MessageService messageService;
	
	@RequestMapping(value="/message/view", method=RequestMethod.GET)
	public void messageView(HttpSession session,Model model) {
		logger.info("/message/view [GET]");
	
		int userno = (int) session.getAttribute("userNo");
		
		List<MyMessage> list = messageService.getMessageList(userno);
		logger.info("messsageList : {} ", list);
	
		model.addAttribute("messageList", list);
	}
	
	@ResponseBody
	@RequestMapping(value="/message/insert", method=RequestMethod.POST)
	public void messagePush(HttpSession session, MyMessage myMessage) {
		logger.info("/message/insert [POST]");
	
		messageService.pushMessage(myMessage);
	}
	
	
}
