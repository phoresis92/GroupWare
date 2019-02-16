package project.groupware.department;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("departmentService") // bean 이름
public class ServiceImpl implements Service {

	@Resource(name="sqlSession")
	private SqlSession sqlSession; // mybatis에서 사용
	private Dao dao;
	
	@Override
	public void addDepartment(Department d) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		dao.insert(d);
	}

	@Override
	public ArrayList<Department> getAll() {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		return dao.selectAll();
	}
	
	@Override
	public String getDepartment_name(int department_id) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		return dao.select(department_id);
	}

	@Override
	public void editDepartment_name(int department_id) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		dao.update(department_id);
	}

	@Override
	public void deleteDepartment(int department_id) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		dao.delete(department_id);
	}

}
