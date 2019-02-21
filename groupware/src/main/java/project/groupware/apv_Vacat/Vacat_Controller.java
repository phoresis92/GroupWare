package project.groupware.apv_Vacat;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.Approval_Cate;
import project.groupware.approval.ApvService;

@Controller
public class Vacat_Controller {
	
	@Resource(name="VacatService")
	VacatService apvService;

	@RequestMapping(value="/apv_Vacat", method=RequestMethod.GET)
	public String approval(Model model) {
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 d일");
		
		model.addAttribute("now",sdf.format(new Date()));
		
		return "/approval/writeForm2";
		
	}
	
}
