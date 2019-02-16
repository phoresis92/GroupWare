package project.groupware.email;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import project.groupware.member.Service;

@Controller
public class EmailController {

	@Resource(name="emailService")
	private Service service;
	
	
}
