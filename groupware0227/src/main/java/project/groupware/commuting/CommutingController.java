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
	public ModelAndView a (@RequestParam(value="year", required=false) String yearS, @RequestParam(value="month", required=false) String monthS) {
		ModelAndView mav = new ModelAndView("/commuting/commuting");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		
		mav.addObject("now",sdf.format(new Date()));
		
		return getCalendar(mav, yearS, monthS);
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
	
	@RequestMapping("/commuting/arrive")
	public ModelAndView arrive (Commuting commuting) {
		ModelAndView mav = new ModelAndView("json/singleValueString");
		HashMap<String, Object> map = new HashMap<String, Object>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		map.put("comm", commuting);
		map.put("date", sdf.format(cal.getTime()));
		ArrayList<Commuting> list = commuting_service.getValue(map);
		if (list.size() == 0) {
			commuting_service.addCommuting(commuting);
			mav.addObject("value", "출근완료");
		} else {
			mav.addObject("value", "이미 출근 했습니다.");
		}
		return mav;		
	}
	
	@RequestMapping("/commuting/leave")
	public ModelAndView leave (HttpServletRequest req, Commuting commuting) {
		ModelAndView mav = new ModelAndView("json/singleValueString");
		HashMap<String, Object> map = new HashMap<String, Object>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		map.put("comm", commuting);
		map.put("date", sdf.format(cal.getTime()));
		ArrayList<Commuting> list = commuting_service.getValue(map);
		if (list.size() == 0) {
			mav.addObject("value", "아직 출근하지 않았습니다.");
		} else {
			map.put("leave", true);
			list = commuting_service.getValue(map);
			if (list.size() == 0) {
				mav.addObject("value", "이미 퇴근 했습니다.");
			} else {
				commuting_service.editLeave(list.get(0));
				mav.addObject("value", "퇴근완료");				
			}
		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/commuting/view", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String view (@RequestParam(value="year") int year, @RequestParam(value="month") int month, HttpServletRequest req) {

		
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
		
		System.out.println("date1"+date1);
		System.out.println("date2"+date2);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_id",m.getMember_id());
		map.put("date1",date1);
		map.put("date2",date2);
		
		System.out.println("member_id"+m.getMember_id());
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("ddHH:mm:ss");
		ArrayList<Commuting> list = commuting_service.getValue(map);
		
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
			if(month < 0) {
				
			}
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

}
