package project.groupware.commuting;

import java.util.ArrayList;
import java.util.HashMap;

public interface Dao {
	
	void insert (Commuting commuting);
	
	ArrayList<Commuting> selectAll();
	
	ArrayList<Commuting> selectValue(HashMap<String, Object> map);
	
	void updateArrive(Commuting commuting);
	
	void updateLeave(Commuting commuting);
	
	void delete(int commuting_id);

}
