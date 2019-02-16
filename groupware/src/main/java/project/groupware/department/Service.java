package project.groupware.department;

import java.util.ArrayList;

public interface Service {
	
	void addDepartment(Department d);
	
	ArrayList<Department> getAll();
	
	String getDepartment_name(int department_id);
	
	void editDepartment_name(int department_id);
	
	void deleteDepartment(int department_id);

}
