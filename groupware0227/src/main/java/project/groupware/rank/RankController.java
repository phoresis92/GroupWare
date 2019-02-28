package project.groupware.rank;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RankController {
	
	@Resource(name="rankService")
	private Service rank_service;
	
	@Resource(name="memberService")
	private project.groupware.member.Service member_service;
	
	@RequestMapping("/rank/list")
	public ModelAndView getRankList(@RequestParam("condition") String condition) {
		ModelAndView mav = new ModelAndView("json/rankValue");
		if (condition.equals("undefined")) {condition = "";}
		String choice = "%"+condition+"%";
		System.out.println(choice);
		ArrayList<Rank> list = rank_service.getChoice(choice);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("rank_name", choice);
		ArrayList<Integer> cnt_list = rank_service.getCountChoice(map);
		map.put("count", cnt_list);
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("/rank/add")
	public ModelAndView addRank(Rank rank) {
		ModelAndView mav = new ModelAndView("json/singleValue");
		String r = rank_service.getRank_name(rank.getRank_id());
		boolean flag = false;
		if (r == null || r.equals("")) {			
			rank_service.addRank(rank);
			flag = true;
		}
		mav.addObject("value", flag);
		return mav;
	}
	
	@RequestMapping("/rank/edit")
	public ModelAndView editRank(Rank rank, @RequestParam(value="ori_id") int ori_id) {
		ModelAndView mav = new ModelAndView("json/singleValue");
		String r = rank_service.getRank_name(rank.getRank_id());
		boolean flag = false;
		if (rank.getRank_id() == ori_id) {			
			rank_service.editRank(rank);			
			flag = true;
		} else if (r == null || r.equals("")){
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("rank", rank);
			map.put("ori_id", ori_id);
			rank_service.addRank(rank);
			member_service.editRank(map);
			rank_service.deleteRank(ori_id);
			flag = true;
		}
		mav.addObject("value", flag);
		return mav;
	}
	
	@RequestMapping("/rank/delete")
	public ModelAndView deleteRank(@RequestParam(value="rank_id") int rank_id) {
		ModelAndView mav = new ModelAndView("json/singleValueString");
		rank_service.deleteRank(rank_id);
		HashMap<String, Object> map = new HashMap<String, Object>();		
		map.put("rank", new Rank(rank_id, null));
		map.put("ori_id", 99);
		member_service.editRank(map);
		mav.addObject("value", "삭제완료");
		return mav;
	}	
}
