package project.groupware.commuting;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

public interface Service {
	
	int getSeqComm();
	
	Commuting checkExist(String member_id);
	
	int addCommuting (HashMap<String, Object> map);
	
	Commuting getByCommId(String commuting_id);
	
	ArrayList<Commuting> getAll();
	
	ArrayList<Commuting> getValue(HashMap<String, Object> map);
	
	int editArrive(int commuting_id);
	
	int editLeave(int commuting_id);
	
	void deleteCommuting(int commuting_id);
	
	int editComment(HashMap<String, Object> map);
	
	int addVacatToComm(HashMap<String, Object> map);

}
