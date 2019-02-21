package project.groupware.rank;

import java.util.ArrayList;

public interface Dao {
	
	void insert(Rank r);
	
	ArrayList<Rank> selectAll();
	
	String select(int rank_id);
	
	void update(int rank_id);
	
	void delete(int rank_id);

}
