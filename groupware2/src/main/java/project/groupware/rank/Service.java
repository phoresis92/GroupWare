package project.groupware.rank;

import java.util.ArrayList;
import java.util.HashMap;

public interface Service {
	
	void addRank(Rank r);
	
	ArrayList<Rank> getAll();
	
	ArrayList<Integer> getCount(ArrayList<Rank> list);
	
	ArrayList<Rank> getChoice(String name);
	
	ArrayList<Integer> getCountChoice(HashMap<String, Object> map);
	
	String getRank_name(int rank_id);
	
	void editRank(Rank rank);
	
	void deleteRank(int rank_id);

}
