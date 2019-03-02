package project.groupware.department;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("departmentService") // bean 이름
public class ServiceImpl implements Service {

	@Resource(name="sqlSession")
	private SqlSession sqlSession; // mybatis에서 사용
	private Dao dao;
	
	@Override
	public void addDept(Department d) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		dao.insert(d);
	}

	@Override
	public ArrayList<Department> getAll() {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		return dao.selectAll();
	}
	
	@Override
	public ArrayList<Integer> getCount(ArrayList<Department> list){
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성		
		return dao.selectCount(list);
	}
	
	@Override
	public ArrayList<Department> getChoice(String name){
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성		
		return dao.selectChoice(name);
	}
	
	@Override
	public ArrayList<Integer> getCountChoice(HashMap<String, Object> map){
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성		
		return dao.selectCountChoice(map);
	}
	
	@Override
	public String getDept_name(int department_id) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		return dao.select(department_id);
	}

	@Override
	public void editDept(Department dept) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		dao.update(dept);
	}

	@Override
	public void deleteDept(int department_id) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		dao.delete(department_id);
	}

}
