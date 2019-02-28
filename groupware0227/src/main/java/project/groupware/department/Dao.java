package project.groupware.department;

import java.util.ArrayList;
import java.util.HashMap;

public interface Dao {
	
	void insert(Department d);
	
	ArrayList<Department> selectAll();
	
	ArrayList<Integer> selectCount(ArrayList<Department> list);
	
	ArrayList<Department> selectChoice(String name);
	
	ArrayList<Integer> selectCountChoice(HashMap<String, Object> map);
	
	String select(int department_id);
	
	void update(Department dept);
	
	void delete(int department_id);

}
