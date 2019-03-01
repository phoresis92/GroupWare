package project.groupware.commuting;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.groupware.member.Member;

@Controller
public class CommutingController {
	
	@Resource(name="commutingService")
	private Service commuting_service;
	
	@RequestMapping("/commuting/commuting")
	public ModelAndView a (@RequestParam(value="year", required=false) String yearS, @RequestParam(value="month", required=false) String monthS, @RequestParam(value="day", required=false) String dayS, @RequestParam(value="dPick", required=false) String dPick) {
		ModelAndView mav = new ModelAndView("/commuting/commuting");
		
		SimpleDateFormat sdf = new SimpleDateFormat("d");
		
		
		mav.addObject("now",sdf.format(new Date()));

		
		mav = getCalendar(mav, yearS, monthS);

		if(dayS != null) {
			mav.addObject("day",Integer.parseInt(dayS));
			mav.addObject("month",Integer.parseInt(monthS));
			mav.addObject("dPick",dPick);
		}
		
		
		
		return mav;
	}
	
	@RequestMapping("/commuting/current_time")
	public ModelAndView current_time () {
		ModelAndView mav = new ModelAndView("json/singleValueString");		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("HH : mm : ss");
		String time = sdf.format(cal.getTime());
		mav.addObject("value", time);		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/commuting/arrive", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String arrive (HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		int member_id = ((Member) session.getAttribute("member")).getMember_id();
		
		
		Commuting comm = commuting_service.checkExist(member_id+"");
		System.out.println("comm result : "+comm);
		
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		
		if(comm == null) {
			int seq = commuting_service.getSeqComm();
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("member_id", member_id);
			map.put("seq", seq);
			System.out.println("add comm result : "+commuting_service.addCommuting(map));
			
			Commuting resultComm = commuting_service.getByCommId(seq+"");
			
			JSONObject obj = new JSONObject();
			obj.put("commuting_id", resultComm.getCommuting_id());
			obj.put("commuting_member_id", resultComm.getCommuting_member_id());
			obj.put("commuting_arrive", sdf.format(resultComm.getCommuting_arrive()));
			try {
				obj.put("commuting_leave", sdf.format(resultComm.getCommuting_leave()));
			} catch (Exception e) {
				obj.put("commuting_leave", resultComm.getCommuting_leave());
			}
			obj.put("commuting_status", resultComm.getCommuting_status());
			
			return obj.toJSONString();
			
		}else if(comm.getCommuting_arrive() == null){
			System.out.println("editArrive : "+commuting_service.editArrive(comm.getCommuting_id()));
			
			Commuting resultComm = commuting_service.getByCommId(comm.getCommuting_id()+"");
			
			JSONObject obj = new JSONObject();
			obj.put("commuting_id", resultComm.getCommuting_id());
			obj.put("commuting_member_id", resultComm.getCommuting_member_id());
			obj.put("commuting_arrive", sdf.format(resultComm.getCommuting_arrive()));
			try {
				obj.put("commuting_leave", sdf.format(resultComm.getCommuting_leave()));
			} catch (Exception e) {
				obj.put("commuting_leave", resultComm.getCommuting_leave());
			}
			obj.put("commuting_status", resultComm.getCommuting_status());
			
			return obj.toJSONString();
			
		}else {
			return "이미 출근처리 되었습니다.";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/commuting/leave", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String leave (HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		int member_id = ((Member) session.getAttribute("member")).getMember_id();
		
		
		Commuting comm = commuting_service.checkExist(member_id+"");
		System.out.println("comm result : "+comm);
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		
		if(comm != null && comm.getCommuting_arrive() != null) {
			
			System.out.println("editLeave : "+commuting_service.editLeave(comm.getCommuting_id()));
			
			Commuting resultComm = commuting_service.getByCommId(comm.getCommuting_id()+"");
			
			JSONObject obj = new JSONObject();
			obj.put("commuting_id", resultComm.getCommuting_id());
			obj.put("commuting_member_id", resultComm.getCommuting_member_id());
			obj.put("commuting_arrive", sdf.format(resultComm.getCommuting_arrive()));
			obj.put("commuting_leave", sdf.format(resultComm.getCommuting_leave()));
			obj.put("commuting_status", resultComm.getCommuting_status());
			
			return obj.toJSONString();
			
		}else {
			return "출근처리 먼저 해주세요.";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/commuting/view", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String view (@RequestParam(value="year") int year, @RequestParam(value="month") int month, @RequestParam(value="member_id", required=false) String member_id,  HttpServletRequest req) {

		System.out.println("year"+year);
		System.out.println("month"+month);
		HttpSession session = req.getSession();
		Member m = (Member) session.getAttribute("member");

		String date1 = year +"-"+ month+"-01";
		String date2 = "";
		if(month < 12) {
			date2 = year +"-"+ (month+1) +"-01";
		}else if(month >= 12) {
			date2 = (year+1) + "-01-01";
		}
		
		
		System.out.println("!!!!!!!!!!!!!!!!!!!!!Member_id : "+member_id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(member_id != null) {
			map.put("member_id",member_id);
		}else {
			map.put("member_id",m.getMember_id());
		}
		map.put("date1",date1);
		map.put("date2",date2);
		
		System.out.println(map.get("member_id"));
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("ddHH:mm:ss");
		ArrayList<Commuting> list = commuting_service.getValue(map);
		System.out.println(list);
		JSONArray arr = new JSONArray();
		for(Commuting comm : list) {
			JSONObject obj = new JSONObject();
			obj.put("commuting_id", comm.getCommuting_id());
			obj.put("commuting_member_id", comm.getCommuting_member_id());
			try {
				obj.put("commuting_arrive", sdf.format(comm.getCommuting_arrive()));
			} catch (Exception e) {
				obj.put("commuting_arrive", null);
			}
			try {
				obj.put("commuting_leave", sdf.format(comm.getCommuting_leave()));
			} catch (Exception e) {
				obj.put("commuting_leave", null);
			}
			obj.put("commuting_comment", comm.getCommuting_comment());
			obj.put("commuting_status", comm.getCommuting_status());
			try {
				obj.put("commuting_status_date", sdf.format(comm.getCommuting_status_date()));
			}catch(Exception e) {
				obj.put("commuting_status_date", null);
			}
			arr.add(obj);
			System.out.println(obj);
		}
		System.out.println(arr);
		return arr.toJSONString();
	}
	
	
	public ModelAndView getCalendar(ModelAndView mav, String yearS, String monthS) {

		//=====================================
		Calendar cal = Calendar.getInstance();
		
		int year = 0;
		try {
			year = Integer.parseInt(yearS);
		}catch(Exception e) {
			year = cal.get(Calendar.YEAR);
		}
		
		int month = 0;
		try {
			
			month = Integer.parseInt(monthS);
			month = month%12;
		}catch(Exception e) {
			month = cal.get(Calendar.MONTH);
		}

		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month);
		cal.set(Calendar.DATE, 1);
		
		
		String[] calHead = {"일","월","화","수","목","금","토"};
		
		int startDay = cal.get(Calendar.DAY_OF_WEEK); // 월 시작 요일
		int lastDay = cal.getActualMaximum(Calendar.DATE); // 월 마지막 날짜
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		for(int i = 1 ; i <= lastDay ; i++, startDay++) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("days", calHead[(startDay-1) % 7]);
			map.put("day", i);
			list.add(map);
			
		}// for end
		
		//=====================================
		
		mav.addObject("calendar", list);
		mav.addObject("year", year);
		mav.addObject("month", month+1);
		
		return mav;
	}

	
	@ResponseBody
	@RequestMapping(value="/commuting/updateComment", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String updateComment (@RequestParam(value="commuting_id") int commuting_id, @RequestParam(value="commuting_comment") String commuting_comment) {

		System.out.println("commuting_id"+commuting_id);
		System.out.println("commuting_comment"+commuting_comment);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("commuting_id", commuting_id);
		map.put("commuting_comment", commuting_comment);

		int result = commuting_service.editComment(map);

		return result+"";
	}
	
}
