package project.groupware.commuting;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("commutingService") // bean 이름
public class ServiceImpl implements Service {

	@Resource(name="sqlSession")
	private SqlSession sqlSession; // mybatis에서 사용
	private Dao dao;
	
	@Override
	public void addCommuting(Commuting commuting) {
		dao = sqlSession.getMapper(Dao.class);
		dao.insert(commuting);
	}

	@Override
	public ArrayList<Commuting> getAll() {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectAll();
	}

	@Override
	public ArrayList<Commuting> getValue(HashMap<String, Object> map) {
		dao = sqlSession.getMapper(Dao.class);
		System.out.println(map);
		return dao.selectValue(map);
	}

	@Override
	public void editArrive(Commuting commuting) {
		dao = sqlSession.getMapper(Dao.class);
		dao.updateArrive(commuting);
	}

	@Override
	public void editLeave(Commuting commuting) {
		dao = sqlSession.getMapper(Dao.class);
		dao.updateLeave(commuting);
	}

	@Override
	public void deleteCommuting(int commuting_id) {
		dao = sqlSession.getMapper(Dao.class);
		dao.delete(commuting_id);
	}

}
