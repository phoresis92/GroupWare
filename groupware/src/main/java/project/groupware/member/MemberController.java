package project.groupware.member;

import java.util.ArrayList;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.groupware.department.Department;
import project.groupware.rank.Rank;

@Controller
public class MemberController {
	
	@Resource(name="memberService")
	private MService service;

	public void setService(MService service) {
		this.service = service;
	}
	
	@Resource(name="departmentService")
	private project.groupware.department.Service departmentservice;

	public void setDepartmentService(project.groupware.department.Service departmentservice) {
		this.departmentservice = departmentservice;
	}
	
	@Resource(name="rankService")
	private project.groupware.rank.RService rankservice;

	public void setRankService(project.groupware.rank.RService rankservice) {
		this.rankservice = rankservice;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "/member/login";
	}	
	
	@RequestMapping(value="/member/login" , method=RequestMethod.POST)
	public String login(HttpServletRequest req, Member member) {
		String result = "";
		boolean flag = false;
		MemberJoin m = service.searchById(member.getMember_id());
		if (m != null && m.getMember_pw() != null && m.getMember_pw().equals(member.getMember_pw())) {		
			flag = true;
		}		
		if (flag) {
			HttpSession session = req.getSession();
			session.setAttribute("member", m);
			result = "/email/emailList";
		}
		else {
			result = "redirect:/";
		}
		return result;
	}
	
	@RequestMapping(value="/member/checkLogin", method=RequestMethod.POST)
	public ModelAndView login(Member m) {
		ModelAndView mav = new ModelAndView("member/check");
		boolean flag = service.checkLogin(m.getMember_id(), m.getMember_pw());
		mav.addObject("flag", flag);
		return mav;
	}
	
	@RequestMapping("/member/join")
	public ModelAndView memberJoin() {
		ModelAndView mav = new ModelAndView("member/join");
		ArrayList<Department> dept_list = departmentservice.getAll();
		ArrayList<Rank> rank_list = rankservice.getAll();
		mav.addObject("dept", dept_list);
		mav.addObject("rank", rank_list);
		return mav;
	}
	
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String join(Member m) {
		System.out.println(m);
		service.join(m);
		return "redirect:/";
	}
	
	@RequestMapping("/member/search")
	public void memberSearch() {}
	
	@RequestMapping(value="/member/searchId", method=RequestMethod.POST)
	public void memberSearchId(Member m) {
		System.out.println(m);
		
	}
	
	@RequestMapping(value="/member/searchPw", method=RequestMethod.POST)
	public void memberSearchPw(Member m) {
		System.out.println(m);
		
	}
	
	@RequestMapping("/member/logout")
	public String memberJoin(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		session.removeAttribute("member");
		session.invalidate();
		return "redirect:/";
	}
	
}