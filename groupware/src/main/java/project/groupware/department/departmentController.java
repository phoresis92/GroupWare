package project.groupware.department;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

@Controller
public class departmentController {
	
	@Resource(name="departmentService")
	private Service service;

	public void setService(Service service) {
		this.service = service;
	}
	
	
	

}
