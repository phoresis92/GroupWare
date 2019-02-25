package project.groupware.department;

import java.util.ArrayList;
import java.util.HashMap;

public interface Service {
	
	void addDept(Department d);
	
	ArrayList<Department> getAll();
	
	ArrayList<Integer> getCount(ArrayList<Department> list);
	
	ArrayList<Department> getChoice(String name);
	
	ArrayList<Integer> getCountChoice(HashMap<String, Object> map);
	
	String getDept_name(int department_id);
	
	void editDept(Department dept);
	
	void deleteDept(int department_id);

}
