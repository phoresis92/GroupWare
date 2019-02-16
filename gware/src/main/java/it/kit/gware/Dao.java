package it.kit.gware;

public interface Dao {
	
	void insert(Member m);
	
	Member select(int id);
	
	void update(Member m);
	
	void delete(int id);


}
