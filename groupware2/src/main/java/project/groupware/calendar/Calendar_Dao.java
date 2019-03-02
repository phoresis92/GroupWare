package project.groupware.calendar;

import java.util.ArrayList;
import java.util.HashMap;

import dto.Calendar_Cate;
import dto.Calendar_Dto;

public interface Calendar_Dao {

	public int insertCal(Calendar_Dto calDto);
	public int deleteCal(int calendar_id);
	public int updateCal(Calendar_Dto calDto);
	public ArrayList<Calendar_Dto> selectAllCal(int id);
	public ArrayList<Calendar_Cate> selectAllCate();
	public Calendar_Dto selectById(int  calendar_idd);
	public Calendar_Dto selectLatestCal();
	
	public Calendar_Cate selectVacatNum(HashMap<String, Object> map);
	
	public int selectCalCount(int member_id);

	
}
