package project.groupware.rank;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

@Controller
public class rankController {
	
	@Resource(name="rankService")
	private Service service;

	public void setService(Service service) {
		this.service = service;
	}
	
	
}
