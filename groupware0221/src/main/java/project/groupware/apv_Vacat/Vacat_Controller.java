package project.groupware.apv_Vacat;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.Approval_Cate;
import dto.Approval_Dto;
import project.groupware.approval.ApvService;
import project.groupware.member.Member;

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
	
	@ResponseBody
	@RequestMapping(value="/apv_Vacat/getVacation", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String notAuthApvCount(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		Member mj = (Member) session.getAttribute("member");
		
		double result =  apvService.getMember_vacation(mj.getMember_id());
		
		return result+"";
	} // myApvList end
	
}
