package project.groupware.member;

import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	@Resource(name="memberService")
	private Service service;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "/member/login";
	}
	
	public void setService(Service service) {
		this.service = service;
	}
	
	@RequestMapping(value="/member/login" , method=RequestMethod.POST)
	public String login(HttpServletRequest req, Member m) {
		HttpSession session = req.getSession();
		String result = "";
		boolean flag = service.login(m.getMember_id(), m.getMember_pw());
		if (flag) {
			session.setAttribute("member", m);
			result = "/email/emailList";
		}
		else {
			result = "/member/login";
		}
		return result;
	}

}
