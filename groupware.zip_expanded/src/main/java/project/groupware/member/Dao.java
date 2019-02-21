package project.groupware.member;

public interface Dao {
	
	void insert(Member m);
	
	Member select(int id);
	
	void update(Member m);
	
	void delete(int id);


}