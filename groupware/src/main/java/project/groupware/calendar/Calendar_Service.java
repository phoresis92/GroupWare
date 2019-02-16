package project.groupware.calendar;

import java.util.ArrayList;

import dto.Calendar_Cate;
import dto.Calendar_Dto;

public interface Calendar_Service {

	public Calendar_Dto addCal(Calendar_Dto calDto);
	public int removeCal(int calendar_id);
	public Calendar_Dto modifyCal(Calendar_Dto calDto);
	public ArrayList<Calendar_Dto> getAllCal(int id);
	public ArrayList<Calendar_Cate> getCalCate();
	
	
}
