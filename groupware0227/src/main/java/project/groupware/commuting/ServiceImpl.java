package project.groupware.commuting;

import java.util.ArrayList;
import java.util.Date;
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
	public Commuting checkExist(String member_id) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectExist(member_id);
	}
	
	@Override
	public int addCommuting(HashMap<String, Object> map) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.insertCommuting(map);
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
	public int editArrive(int commuting_id) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.updateArrive(commuting_id);
	}

	@Override
	public int editLeave(int commuting_id) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.updateLeave(commuting_id);
	}

	@Override
	public void deleteCommuting(int commuting_id) {
		dao = sqlSession.getMapper(Dao.class);
		dao.delete(commuting_id);
	}

	@Override
	public int getSeqComm() {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectSeqComm();
	}

	@Override
	public Commuting getByCommId(String Commuting_id) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectByCommId(Commuting_id);
	}

	@Override
	public int editComment(HashMap<String, Object> map) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.updateComment(map);
	}

	@Override
	public int addVacatToComm(HashMap<String, Object> map) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.insertVacatToComm(map);
	}





}
