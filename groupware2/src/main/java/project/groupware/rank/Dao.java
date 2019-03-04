package project.groupware.rank;

import java.util.ArrayList;
import java.util.HashMap;

public interface Dao {
	
	void insert(Rank r);
	
	ArrayList<Rank> selectAll();
	
	ArrayList<Integer> selectCount(ArrayList<Rank> list);
	
	ArrayList<Rank> selectChoice(String name);
	
	ArrayList<Integer> selectCountChoice(HashMap<String, Object> map);
		
	String select(int rank_id);
	
	void update(Rank rank);
	
	void delete(int rank_id);

}
