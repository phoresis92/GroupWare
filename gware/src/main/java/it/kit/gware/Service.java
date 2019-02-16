package it.kit.gware;

public interface Service {
	
	Member getMyInfo(int id);
	
	void join(Member m);
	
	void editMyInfo(Member m);
	
	boolean checkId(int id);
	
	boolean login(int id, String pw);
	
	void delMember(int id);

}
