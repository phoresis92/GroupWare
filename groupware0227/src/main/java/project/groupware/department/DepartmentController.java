package project.groupware.department;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DepartmentController {
	
	@Resource(name="departmentService")
	private Service dept_service;

	@Resource(name="memberService")
	private project.groupware.member.Service member_service;
	
	@RequestMapping("/dept/list")
	public ModelAndView getDeptList(@RequestParam("condition") String condition) {
		ModelAndView mav = new ModelAndView("json/deptValue");
		if (condition.equals("undefined")) {condition = "";}
		String choice = "%"+condition+"%";
		ArrayList<Department> list = dept_service.getChoice(choice);	
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("department_name", choice);
		ArrayList<Integer> cnt_list = dept_service.getCountChoice(map);
		map.put("count", cnt_list);
		mav.addObject("map", map);		
		return mav;
	}
	
	@RequestMapping("/dept/add")
	public ModelAndView addDept(Department dept) {
		ModelAndView mav = new ModelAndView("json/singleValue");
		String r = dept_service.getDept_name(dept.getDepartment_id());
		boolean flag = false;
		if (r == null || r.equals("")) {			
			dept_service.addDept(dept);
			flag = true;
		}
		mav.addObject("value", flag);
		return mav;
	}
	
	@RequestMapping("/dept/edit")
	public ModelAndView editDept(Department dept, @RequestParam(value="ori_id") int ori_id) {
		ModelAndView mav = new ModelAndView("json/singleValue");
		String r = dept_service.getDept_name(dept.getDepartment_id());
		boolean flag = false;
		if (dept.getDepartment_id() == ori_id) {
			dept_service.editDept(dept);			
			flag = true;
		} else if (r == null || r.equals("")){
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("dept", dept);
			map.put("ori_id", ori_id);
			dept_service.addDept(dept);
			member_service.editDept(map);
			dept_service.deleteDept(ori_id);
			flag = true;
		}
		mav.addObject("value", flag);
		return mav;
	}
	
	@RequestMapping("/dept/delete")
	public ModelAndView deleteDept(@RequestParam(value="department_id") int dept_id) {
		ModelAndView mav = new ModelAndView("json/singleValueString");
		dept_service.deleteDept(dept_id);
		HashMap<String, Object> map = new HashMap<String, Object>();		
		map.put("dept", new Department(dept_id, null));
		map.put("ori_id", 999);
		member_service.editDept(map);
		mav.addObject("value", "삭제완료");
		return mav;
	}
}
