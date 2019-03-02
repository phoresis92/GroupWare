package project.groupware.member;

import java.util.ArrayList;
import java.util.HashMap;

import dto.MemDeposit;

public interface Dao {
	
	int makeIdNum();
	
	void insert(Member m);
	
	ArrayList<Member> selectAll();
	
	ArrayList<Member> selectCondition(HashMap<String, Object> map);
	
	ArrayList<Member> selectStatistics(HashMap<String, Object> map);
	
	Member selectMember(int member_id);
	
	String selectName(int member_id);
	
	ArrayList<Integer> selectId(Member m);
	
	String selectPw(Member m);
	
	String selectEmail(Member m);
	
	void update(Member m);
	
	void updateManager(Member m);
	
	void updatePw(Member m);
	
	void updateRank(HashMap<String, Object> map);
	
	void updateDept(HashMap<String, Object> map);
	
	void delete(int member_id);
	
	
	ArrayList<Member> selectAllMemJoin();
	
	ArrayList<Member> selectByDeptId(int member_id);
	
	ArrayList<Member> selectByName(String searchName);
	
	Member selectById(int member_id);
	
	//deposit    
    void insertDeposit(MemDeposit deposit);
    
    MemDeposit selectDepo_Id(MemDeposit deposit);
	
	MemDeposit selectDeposit(int depo_member_id);
	
	void updateDeposit(MemDeposit deposit);
	
	void deleteDeposit(String member_id);
}
