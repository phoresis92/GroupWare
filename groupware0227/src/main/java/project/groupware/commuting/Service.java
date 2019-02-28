package project.groupware.commuting;

import java.util.ArrayList;
import java.util.HashMap;

public interface Service {
	
	void addCommuting (Commuting commuting);
	
	ArrayList<Commuting> getAll();
	
	ArrayList<Commuting> getValue(HashMap<String, Object> map);
	
	void editArrive(Commuting commuting);
	
	void editLeave(Commuting commuting);
	
	void deleteCommuting(int commuting_id);

}
