package project.groupware.rank;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

@Controller
public class rankController {
	
	@Resource(name="rankService")
	private RService service;

	public void setService(RService service) {
		this.service = service;
	}
	
	
}
