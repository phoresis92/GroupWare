package project.groupware.email;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmailController {

	@Resource(name="emailService")
	private Service service;

	public void setService(Service service) {
		this.service = service;
	}
	
	@RequestMapping("/email/write")
	public String emailWrite() {
		return "/email/emailWrite";
	}
	
}
