package project.groupware.member;

import java.util.ArrayList;
import java.util.HashMap;

public interface Service {
	
	int getIdNum();
	
	void joinMember(Member m);
	
	ArrayList<Member> getAll();
	
	ArrayList<Member> getCondition(HashMap<String, Object> map);
	
	Member getMember(int id);
	
	String[] getName(String member_email);
	
	ArrayList<Integer> getId(Member m);
	
	String getPw(Member m);
	
	String getEmail(Member m);
	
	void editMember(Member m);
	
	void editManager(Member m);
	
	void editPw(Member m);
	
	void editRank(HashMap<String, Object> map);
	
	void editDept(HashMap<String, Object> map);
	
	boolean checkLogin(int member_id, String member_pw);
	
	void delMember(int member_id);
		
		
	ArrayList<Member> getAllMemJoin();
	
	ArrayList<Member> searchByDeptId(int member_id);
	
	ArrayList<Member> searchByName(String searchName);
	
	Member searchById(int member_id);

}
