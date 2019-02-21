package project.groupware.member;

import java.util.ArrayList;

public interface Dao {
	
	void insert(Member m);
	
	Member select(int id);
	
	void update(Member m);
	
	void delete(int id);
	
	ArrayList<Member> selectAllMem();
	
	ArrayList<MemberJoin> selectAllMemJoin();
	
	ArrayList<MemberJoin> selectByDeptId(int id);
	
	ArrayList<MemberJoin> selectByName(String searchName);
	
	MemberJoin selectById(int member_id);

}