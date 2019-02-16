package project.groupware.department;

import java.util.ArrayList;

public interface Dao {
	
	void insert(Department d);
	
	ArrayList<Department> selectAll();
	
	String select(int department_id);
	
	void update(int department_id);
	
	void delete(int department_id);

}
