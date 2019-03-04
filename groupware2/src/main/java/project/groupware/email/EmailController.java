package project.groupware.email;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.groupware.member.Member;


@Controller
public class EmailController {
	
	@Resource(name="emailService")
	private Service email_service;
	
	@Resource(name="memberService")
	private project.groupware.member.Service member_service;
		
	@RequestMapping("/email/list")
	public ModelAndView emailList(HttpServletRequest req, @RequestParam("type") int type) {
		ModelAndView mav = new ModelAndView("/email/emailList");
		HttpSession session = req.getSession(false);
		Member m = (Member)session.getAttribute("member");
		Email email = email_service.getAccount(m.getMember_id()+"");
		mav.addObject("account", email);
		mav.addObject("type", type);
		return mav;
	}
	
	@RequestMapping(value="/email/list" , method=RequestMethod.POST)
	public ModelAndView getList(HttpServletRequest req, @RequestParam("type") int type,
			@RequestParam(value="option",required=false) String option, 
			@RequestParam(value="condition",required=false) String condition) {
		
		ModelAndView mav = new ModelAndView("json/emailValue");
		if (option.equals("undefined")) {option = "";}
		if (condition.equals("undefined")) {condition = "";}
		HttpSession session = req.getSession(false);
		Member m = (Member)session.getAttribute("member");
		Email email = email_service.getAccount(m.getMember_id()+"");
		HashMap<String, Object> map = new HashMap<String, Object>();
		String[] opt = option.split("/");
		map.put("account", email.getEmail_account());
		map.put("option", opt);
		map.put("condition", condition);
		ArrayList<Email> list = new ArrayList<Email>();
		if (type == 0) {
			list = email_service.getSend(map);			
		} else if (type == 1) {
			list = email_service.getReceive(map);
		} else if (type == 2) {
			list = email_service.getExReceive(map);
		} else if (type == 3) {
			list = email_service.getRecycle(map);
		} else if (type == 4) {
			list = email_service.getExRecycle(map);
		}
		mav.addObject("list", list);
		mav.addObject("type", type);
		return mav;
	}
	
	@RequestMapping("/email/status")
	public String setStatus(HttpServletRequest req, @RequestParam("email_id") int email_id) {
		HttpSession session = req.getSession(false);
		Member m = (Member)session.getAttribute("member");
		Email email = email_service.getEmail(email_id);
		if (email.getType() == 1) {
			if (email.getEmail_status() == 0) {
				email.setEmail_status((byte)1);
			} else if (email.getEmail_status() == 1) {
				email.setEmail_status((byte)0);
			}
			email_service.editEmail(email);			
		}
		return "redirect:/email/count";
	}
	
	@RequestMapping("/email/write")
	public ModelAndView emailWrite(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("/email/emailWrite");
		HttpSession session = req.getSession(false);
		Member m = (Member)session.getAttribute("member");
		String email_id = req.getParameter("email_id");
		if (email_id != null && !email_id.equals("")) {
			String type = req.getParameter("type");
			Email mail = email_service.getEmail(Integer.parseInt(email_id));
			mav.addObject("email", mail);
			mav.addObject("type", type);
		}
		Email email = email_service.getAccount(m.getMember_id()+"");
		mav.addObject("account", email);
		return mav;
	}
	
	@RequestMapping(value="/email/write", method=RequestMethod.POST)
	public String emailWrite(Email email) {
		SendEmail gmail = new SendEmail();
		Email account = email_service.getAccount(email.getMember_id());
		System.out.println(email);
		email.setEmail_pw(account.getEmail_pw());
		Email receiver_account = email_service.getAccountId(email.getReceiver_id());
		if (receiver_account != null) {
			String receiver = member_service.getName(Integer.parseInt(receiver_account.getMember_id()));
			if (receiver != null && !receiver.equals("")) {
				email.setReceiver(receiver);
			} else {
				email.setReceiver(email.getEmail_account());
			}
		}else {
			email.setReceiver(email.getEmail_account());
		}
		gmail.send(email);
		email_service.addEmail(email);
		return "redirect:/email/receive";
	}
	
	@RequestMapping("/email/send")
	public String emailSend() {
		return "redirect:/email/list?type=0";
	}
	
	@RequestMapping("/email/receive")
	public String emailReceive() {
		return "redirect:/email/list?type=1";
	}
	
	@RequestMapping("/exMail/receive")
	public String emailExReceive() {
		return "redirect:/email/list?type=1";
	}
	
	@RequestMapping("/email/recycle")
	public String emailRecycle() {		
		return "redirect:/email/list?type=3";
	}
	
	@RequestMapping("/exMail/recycle")
	public String emailExRecycle() {		
		return "redirect:/email/list?type=3";
	}
	
	@RequestMapping("/email/detail")
	public ModelAndView emailDetail(@RequestParam("email_id") int email_id, @RequestParam("type") int type) {
		ModelAndView mav = new ModelAndView("/email/emailDetail");
		Email email = email_service.getEmail(email_id);
		if (email.getEmail_status() == 0) {
			email.setEmail_status((byte)1);
			email_service.editEmail(email);
		}
		mav.addObject("email", email);
		mav.addObject("type", type);
		return mav;
	}
	
	@RequestMapping("/email/reply")
	public String emailReply(@RequestParam("email_id") int email_id, @RequestParam("type") int type) {		
		return "redirect:/email/write?email_id="+email_id+"&type="+type;
	}
	
	@RequestMapping("/email/restore")
	public String emailRestore(@RequestParam("email_id") int email_id, @RequestParam("type") int type) {
		Email email = email_service.getEmail(email_id);
		email.setEmail_status((byte)1);
		email_service.editEmail(email);		
		return "redirect:/email/list?type="+type;
	}
	
	@RequestMapping("/email/delete")
	public String emailDelete(@RequestParam("email_id") int email_id, @RequestParam("type") int type) {
		Email email = email_service.getEmail(email_id);
		if (email.getEmail_status() == 0 || email.getEmail_status() == 1) {
			email.setEmail_status((byte)2);
			email_service.editEmail(email);
		} else {
			email_service.deleteEmail(email_id);
		}
		return "redirect:/email/list?type="+type;
	}
	
	@RequestMapping("/email/checkdelete")
	public String emailDelete(HttpServletRequest req, @RequestParam("arr[]") List<Integer> arr) {
		HttpSession session = req.getSession(false);
		Member m = (Member)session.getAttribute("member");
		for(int email_id : arr) {
			Email email = email_service.getEmail(email_id);
			if (email.getEmail_status() == 0 || email.getEmail_status() == 1) {
				email.setEmail_status((byte)2);
				email_service.editEmail(email);
			} else {
				email_service.deleteEmail(email_id);
			}			
		}
		return "redirect:/email/count";
	}
	
	@RequestMapping("/email/checkstatus")
	public String setStatus(HttpServletRequest req, @RequestParam("arr[]") List<Integer> arr) {
		HttpSession session = req.getSession(false);
		Member m = (Member)session.getAttribute("member");
		for(int email_id : arr) {
			Email email = email_service.getEmail(email_id);
			if (email.getType() == 1) {
				if (email.getEmail_status() == 0) {
					email.setEmail_status((byte)1);
				} else if (email.getEmail_status() == 1) {
					email.setEmail_status((byte)0);
				}
				email_service.editEmail(email);			
			}
		}
		return "redirect:/email/count";
	}
	
	@RequestMapping("/email/checkrestore")
	public ModelAndView emailRestore(@RequestParam("arr[]") List<Integer> arr) {
		ModelAndView mav = new ModelAndView("json/singleValueString");
		for(int email_id : arr) {
			Email email = email_service.getEmail(email_id);
			email.setEmail_status((byte)1);
			email_service.editEmail(email);
		}
		mav.addObject("value", "복구완료");
		return mav;
	}
	
	// 외부 메일
	@RequestMapping("/email/pop3")
	public String setEmail(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		Member m = (Member)session.getAttribute("member");
		if (m != null) {
			Email email = email_service.getAccount(m.getMember_id()+"");
			if (email != null) {
				String id = email.getEmail_account();
				String pw = email.getEmail_pw();
				ArrayList<Email> list = new FetchingEmail().receive(id, pw);
				email_service.addEmails(list);
			}			
		}
		return "redirect:/email/count";
	}
	
	@ResponseBody
	@RequestMapping(value="/email/count", produces = "application/text; charset=utf8")
	public String getCount(HttpServletRequest req) {
		ArrayList<Email> list_count = new ArrayList<Email>();
		HttpSession session = req.getSession(false);
		Member m = (Member)session.getAttribute("member");
		if (m != null) {
			Email email = email_service.getAccount(m.getMember_id()+"");
			if (email != null) {
				String id = email.getEmail_account();
				list_count = email_service.gettReceiveCount(id);
			}
		}		
		return list_count.size()+"";
	}
}
