package project.groupware.email;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.groupware.member.Member;


@Controller
public class EmailController {
	
	@Resource(name="emailService")
	private Service service;
	
	public void setService(Service service) {
		this.service = service;
	}
	
	@Resource(name="memberService")
	private project.groupware.member.Service member_service;
	
	public void setService(project.groupware.member.Service service) {
		this.member_service = service;
	}
	
	@RequestMapping("/email/emailList")
	public String emailList() {
		return "/email/emailList";
	}
	
	@RequestMapping("/email/write")
	public ModelAndView emailWrite(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("/email/emailWrite");
		HttpSession session = req.getSession();
		Member m = (Member)session.getAttribute("member");
		Email email = service.getAccount(m.getMember_id());
		mav.addObject("account", email);
		return mav;
	}
	
	@RequestMapping(value="/email/write", method=RequestMethod.POST)
	public String emailWrite(Email email) {
		SendEmail gmail = new SendEmail();
		Email e = service.getAccount(email.getMember_id());
		email.setEmail_pw(e.getEmail_pw());
		String receiver = member_service.getName(email.getReceiver_id())[0];
		if (receiver != null && !receiver.equals("")) {
			email.setReceiver(receiver);
		} else {
			email.setReceiver(email.getReceiver_id());
		}
		gmail.send(email);
		return "/email/emailList";
	}
	
	@RequestMapping("/email/receive")
	public ModelAndView emailReceive(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("/email/emailList");
		HttpSession session = req.getSession();
		Member m = (Member)session.getAttribute("member");
		ArrayList<Email> list = service.getReceive(m.getMember_email());
		mav.addObject("list", list);
		return mav;
	}	
	
	@RequestMapping("/email/send")
	public ModelAndView emailSend(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("/email/emailList");
		HttpSession session = req.getSession();
		Member m = (Member)session.getAttribute("member");
		ArrayList<Email> list = service.getSend(m.getMember_email());
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/email/detail")
	public ModelAndView emailDetail(@RequestParam(value="email_id") int email_id) {
		ModelAndView mav = new ModelAndView("/email/emailDetail");
		Email email = service.getEmail(email_id);
		if(email.getContent_html() != null && !email.getContent_html().equals("")) {
			email.setContent_html(email.getContent_html().replaceAll("cid:", email.getEmail_path()));
		}		
		mav.addObject("email", email);
		return mav;
	}
	
	@RequestMapping("/email/recycle")
	public String setEmail(@RequestParam(value="member_id") int member_id) {
		Email email = service.getAccount(member_id);
		String id = email.getEmail_account();//"limgj12341234@gmail.com";
		String pw = email.getEmail_pw();//"lim1234$";
			
//		String id = "hongkd12341234@gmail.com";
//		String pw = "hong1234$";
		
		//ArrayList<Email> list = new CheckingEmail().receive(id, pw);
		ArrayList<Email> list = new FetchingEmail().receive(id, pw);
		
		service.addEmails(list);
		return "redirect:/email/receive";
	}
}
