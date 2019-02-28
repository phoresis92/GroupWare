package project.groupware.message;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MessageController {

	@Resource(name="messageService")
	private Service service;

	public void setService(Service service) {
		this.service = service;
	}
	
	@RequestMapping("/message/write")
	public String messageWrite() {
		return "/message/messageWrite";
	}
	
	@RequestMapping(value="/message/write", method=RequestMethod.POST)
	public String messageWrite(HttpServletRequest req) {
		
		return "/message/messageWrite";
	}
	
}
