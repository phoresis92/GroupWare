package project.groupware.manager;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.groupware.department.Department;
import project.groupware.member.Member;
import project.groupware.rank.Rank;

@Controller
public class ManagerController {
	
	@Resource(name="memberService")
	private project.groupware.member.Service member_service;
	
	@Resource(name="departmentService")
	private project.groupware.department.Service dept_service;
	
	@Resource(name="rankService")
	private project.groupware.rank.Service rank_service;
	
	@RequestMapping("/manager/member")
	public ModelAndView getMember() {
		ModelAndView mav = new ModelAndView("/manager/managerMember");
		ArrayList<Member> list = member_service.getAllMemJoin();
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping("/manager/Unauthorized")
	public ModelAndView getUnauthorized() {
		ModelAndView mav = new ModelAndView("/manager/managerMember");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_status", 0);
		ArrayList<Member> list = member_service.getCondition(map);
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping("/manager/rank")
	public ModelAndView getRank() {
		ModelAndView mav = new ModelAndView("/manager/managerRank");
		ArrayList<Rank> list = rank_service.getAll();
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/manager/department")
	public ModelAndView getDept() {
		ModelAndView mav = new ModelAndView("/manager/managerDept");
		ArrayList<Department> list = dept_service.getAll();
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("manager/authorization")
	public void aa(@RequestParam(value="member_id") int member_id) {
		
	}
	
	@RequestMapping("manager/refuse")
	public void d(@RequestParam(value="member_id") int member_id) {
		
	}
	
	@RequestMapping("manager/editMember")
	public void dd(@RequestParam(value="member_id") int member_id) {
		
	}
	
	@RequestMapping("manager/deleteMember")
	public void asdf(@RequestParam(value="member_id") int member_id) {
		
	}
}
