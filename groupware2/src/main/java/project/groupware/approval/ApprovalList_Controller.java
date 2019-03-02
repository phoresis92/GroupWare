package project.groupware.approval;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.groupware.department.Department;
import project.groupware.department.Service;
import project.groupware.member.Member;
import project.groupware.rank.Rank;

@Controller
public class ApprovalList_Controller {
	
	@Resource(name="departmentService")
	private Service deptService;
	
	@Resource(name="memberService")
	private project.groupware.member.Service memService;
	
	@Resource(name="rankService")
	private project.groupware.rank.Service rankService;

	@RequestMapping(value="/approval/pikAuthMem")
	public String approval(Model model) {
		
		ArrayList<Department> deptList = deptService.getAll(); //department
		
		model.addAttribute("deptList",deptList);
		
		ArrayList<Member> memList = memService.getAllMemJoin();
		
		model.addAttribute("memList",memList);
		
		ArrayList<Rank> rankList = rankService.getAll();
		
		model.addAttribute("rankList", rankList);
		
		
		return "approval/approvalList";
	}
	
	@ResponseBody
	@RequestMapping(value="/approval/searchDept", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String searchDept(@RequestParam("deptId") String id, Model model) {
		
		ArrayList<Member> memDeptList;
		try {
			memDeptList = memService.searchByDeptId(Integer.parseInt(id));
		}catch(Exception e) {
			return id;
		}
		JSONArray arr = new JSONArray();
		
		for(Member memj : memDeptList) {
			JSONObject jobj = new JSONObject();
			jobj.put("member_id", memj.getMember_id());
			jobj.put("department_name", memj.getDepartment_name());
			jobj.put("member_name", memj.getMember_name());
			jobj.put("rank_name", memj.getRank_name());
			arr.add(jobj);
		}
		
		return arr.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="/approval/getMemList", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String getMemList() {
		
		ArrayList<Member> memJoinList = memService.getAllMemJoin();
		
		JSONArray arr = new JSONArray();
		for(Member memj : memJoinList) {
			JSONObject jobj = new JSONObject();
			jobj.put("member_id", memj.getMember_id());
			jobj.put("department_name", memj.getDepartment_name());
			jobj.put("member_name", memj.getMember_name());
			jobj.put("rank_name", memj.getRank_name());
			arr.add(jobj);
		}
		
		return arr.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="/approval/searchName", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String searchName(@RequestParam("searchN") String name) {
		
		System.out.println(name);
		
		ArrayList<Member> memJoinList = memService.searchByName(name);
		JSONArray arr = new JSONArray();
		for(Member memj : memJoinList) {
			System.out.println(memj);
			JSONObject jobj = new JSONObject();
			jobj.put("member_id", memj.getMember_id());
			jobj.put("department_name", memj.getDepartment_name());
			jobj.put("member_name", memj.getMember_name());
			jobj.put("rank_name", memj.getRank_name());
			arr.add(jobj);
		}
		
		return arr.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="/approval/searchById", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String searchById(@RequestParam("member_id") String id) {
		
		Member memj = null;
		//System.out.println(id);
		try {
		memj = memService.searchById(Integer.parseInt(id));
		}catch(Exception e) {
			return "error";
		}
			JSONObject jobj = new JSONObject();
			jobj.put("department_name", memj.getDepartment_name());
			jobj.put("member_name", memj.getMember_name());
			jobj.put("rank_name", memj.getRank_name());
		
		return jobj.toJSONString();
	}
	
}
