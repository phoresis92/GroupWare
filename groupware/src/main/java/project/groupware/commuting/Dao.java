package project.groupware.commuting;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

public interface Dao {
	
	int selectSeqComm();
	
	Commuting selectExist(String member_id);
	
	int insertCommuting (HashMap<String, Object> map);
	
	Commuting selectByCommId(String commuting_id);
	
	ArrayList<Commuting> selectAll();
	
	ArrayList<Commuting> selectValue(HashMap<String, Object> map);
	
	int updateArrive(int commuting_id);
	
	int updateLeave(int commuting_id);
	
	void delete(int commuting_id);

	int updateComment(HashMap<String, Object> map);
	
	int insertVacatToComm(HashMap<String, Object> map);
	
}
