package project.groupware.manager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dto.Approval_Dto;
import dto.Calendar_Cate;
import dto.Calendar_Dto;
import dto.PageInfo;
import dto.Pagination;
import project.groupware.approval.ApvService;
import project.groupware.calendar.Calendar_Service;
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
	
	@Resource(name="emailService")
	private project.groupware.email.Service email_service;
	
	@Resource(name="ApvService")
	ApvService apvService;
	
	@Resource(name="Cal_Service")
	private Calendar_Service cal_Service;
	
	@Resource(name="departmentService")
	private project.groupware.department.Service deptService;
	
	@Resource(name="memberService")
	private project.groupware.member.Service memService;
	
	@Resource(name="rankService")
	private project.groupware.rank.Service rankService;
	
	@RequestMapping("/manager/member")
	public ModelAndView getMember(@RequestParam(value="page") int page) {
		ModelAndView mav = new ModelAndView("/manager/managerMember");
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<Integer> status_list = new ArrayList<Integer>();
		status_list.add(0);
		status_list.add(1);
		status_list.add(2);
		status_list.add(3);
		status_list.add(4);
		status_list.add(5);
		status_list.add(6);
		status_list.add(9);
		map.put("list", status_list);
		ArrayList<Member> list = member_service.getCondition(map);
		mav.addObject("page", new Pagination().paging(page, list));
		mav.addObject("list",list);
		mav.addObject("address","member");
		return mav;
	}
	
	@RequestMapping("/manager/unauthorized")
	public ModelAndView getUnauthorized(@RequestParam(value="page") int page) {
		ModelAndView mav = new ModelAndView("/manager/managerMember");
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<Integer> status_list = new ArrayList<Integer>();
		status_list.add(0);
		map.put("list", status_list);
		ArrayList<Member> list = member_service.getCondition(map);
		mav.addObject("page", new Pagination().paging(page, list));
		mav.addObject("list",list);
		mav.addObject("address","unauthorized");
		return mav;
	}
	
	@RequestMapping("/manager/memberEdit")
	public String editMember(Member m) {
		System.out.println(m);
		member_service.editManager(m);
		return "redirect:/member/memberinfo?member_id="+m.getMember_id();
	}
	
	@RequestMapping("/manager/rank")
	public String getRank() {
		return "/manager/managerRank";
	}
	
	@RequestMapping("/manager/department")
	public String getDept() {
		return "/manager/managerDept";
	}
	
	@RequestMapping("manager/authorization")
	public String aa(@RequestParam(value="member_id") int member_id) {
		Member m = member_service.getMember(member_id);
		m.setMember_status(2);
		member_service.editPw(m);
		return "redirect:/manager/unauthorized";
	}
	
	@RequestMapping("manager/refuse")
	public String d(@RequestParam(value="member_id") int member_id) {		
		member_service.delMember(member_id);
		return "redirect:/manager/unauthorized";
	}
	
	@RequestMapping("manager/memberView")
	public String dd(@RequestParam(value="member_id") int member_id) {		
		return "redirect:/member/memberinfo?member_id="+member_id;
	}
	
	@RequestMapping("manager/deleteMember")
	public void asdf(@RequestParam(value="member_id") int member_id) {
		
	}
	
	
	@RequestMapping("manager/apvDelList")
	public String apvDelList(HttpServletRequest req, Model model, @RequestParam (value="page") int page ) {
		HttpSession session = req.getSession();
		Member mj = (Member) session.getAttribute("member");
		if(mj.getMember_id() != 1) {
			return "redirect:/";
		}
		
		//ArrayList<Approval_Dto> list = apvService.getAllApvForManager();
		ArrayList<Approval_Dto> list = apvService.getDelListForManager();
		
		model.addAttribute("apvList", list);
		
		model.addAttribute("pageInfo", paging(page,list));
		
		model.addAttribute("auth" , 3); // 관리자 삭제 가능
		
		return "/approval/myApvList";
	}
	
	
	@RequestMapping("manager/allApvList")
	public String allApvList(HttpServletRequest req, Model model, @RequestParam (value="page") int page ) {
		HttpSession session = req.getSession();
		Member mj = (Member) session.getAttribute("member");
		if(mj.getMember_id() != 1) {
			return "redirect:/";
		}
		
		//ArrayList<Approval_Dto> list = apvService.getAllApvForManager();
		ArrayList<Approval_Dto> list = apvService.getAllApvForManager();
		
		model.addAttribute("apvList", list);
		
		model.addAttribute("pageInfo", paging(page,list));
		
		model.addAttribute("auth" , 0); // 관리자 삭제 가능
		
		return "/approval/myApvList";
	}
	
	public PageInfo paging(int page, ArrayList apvList) {
		//==========================================================
		
		
		
		int countList = 10; //페이지당 게시물 수
		int countPage = 10; //페이지 수
		
		
		int totalCount = apvList.size(); // 총 게시물 수
		int totalPage = totalCount / countList; // 총 페이지 수;
		if(totalCount%countList>0) { totalPage++; }
		if(totalPage < page) { page = totalPage; }
		
		int startPage = ((page-1)  / countPage ) * countPage + 1; 
		int endPage = startPage + countPage - 1;
		if (endPage > totalPage) { endPage = totalPage; }
		
		//==========================================================
		
		int startNum = (page-1) * countList +1;
		int endNum = page * countList;
		
		//ArrayList<BoardBean> boardList = boardListService.getboardlist(startNum , endNum);
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setTotalPage(totalPage);
		pageInfo.setCountList(countList);
		if(totalCount != 0) {
			startNum--;
			endNum--;
		}
		pageInfo.setStartNum(startNum);
		pageInfo.setEndNum(endNum);
		pageInfo.setTotalCount(totalCount);
		
		return pageInfo;
	}
	
	@RequestMapping(value = "manager/calendar/company",method=RequestMethod.GET)
	public ModelAndView calcomp() {
		
		ModelAndView mav = new ModelAndView("/calendar/calendar");
		
		  ArrayList<Calendar_Cate> cateList = cal_Service.getCalCate();
		  
		  //mav.addObject("cateList", cateList); 
		  

		  JSONArray arr = new JSONArray();
		  for(Calendar_Cate cate : cateList) {
			  JSONObject jobj = new JSONObject();
			  
			  jobj.put("cal_cate_id", cate.getCal_cate_id());
			  jobj.put("cal_cate_name", cate.getCal_cate_name());
			  jobj.put("cal_cate_color", cate.getCal_cate_color());
			  arr.add(jobj);
		  }
		  mav.addObject("cateList", arr);
		  
		  mav.addObject("who", 99999);
		  
//=======================================================================
		  
		  ArrayList<Calendar_Dto> calList = cal_Service.getAllCal(99999);
		  
		  JSONArray jArr = new JSONArray();
		  for(Calendar_Dto dto : calList) {
			  JSONObject jobj = new JSONObject();
			  
			  jobj.put("id", dto.getCalendar_id());
			  jobj.put("calendar_cate", dto.getCalendar_cate());
			  jobj.put("calendar_cateSelf", dto.getCalendar_cateSelf());
			  jobj.put("member_id", dto.getCalendar_member_id());
			  jobj.put("start", dto.getCalendar_start());
			  jobj.put("end", dto.getCalendar_end());
			  jobj.put("title", dto.getCalendar_title());
			  jobj.put("content", dto.getCalendar_content());
			  jobj.put("color", dto.getCalendar_color());
			  boolean ad = false;
			  if(dto.getCalendar_allDay() == 1) {
				  ad = true;
			  }else {
				  ad = false;
			  }
			  jobj.put("allDay", ad);
			  
			  jArr.add(jobj);
		  }
		
		mav.addObject("list",jArr.toJSONString());
		
		return mav;
	}
	
	@RequestMapping(value = "manager/calendar/member",method=RequestMethod.GET)
	public ModelAndView calmem(Model model) {
		
		ModelAndView mav = new ModelAndView("/calendar/calendar_manager");
		
		  ArrayList<Calendar_Cate> cateList = cal_Service.getCalCate();
		  
		  //mav.addObject("cateList", cateList); 
		  

		  JSONArray arr = new JSONArray();
		  for(Calendar_Cate cate : cateList) {
			  JSONObject jobj = new JSONObject();
			  
			  jobj.put("cal_cate_id", cate.getCal_cate_id());
			  jobj.put("cal_cate_name", cate.getCal_cate_name());
			  jobj.put("cal_cate_color", cate.getCal_cate_color());
			  arr.add(jobj);
		  }
		  mav.addObject("cateList", arr);
		  
		  mav.addObject("who", "");
		  
		  
		  ArrayList<Department> deptList = deptService.getAll(); //department
			
			model.addAttribute("deptList",deptList);
			
			ArrayList<Member> memList = memService.getAllMemJoin();
			
			model.addAttribute("memList",memList);
			
			ArrayList<Rank> rankList = rankService.getAll();
			
			model.addAttribute("rankList", rankList);

		
		return mav;
	}
}
