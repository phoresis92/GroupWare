package project.groupware.rank;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("rankService") // bean 이름
public class ServiceImpl implements RService {

	@Resource(name="sqlSession")
	private SqlSession sqlSession; // mybatis에서 사용
	private Dao dao;
	
	@Override
	public void addRank(Rank r) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		dao.insert(r);
	}

	@Override
	public ArrayList<Rank> getAll() {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성		
		return dao.selectAll();
	}
	
	@Override
	public String getRank_name(int rank_id) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성		
		return dao.select(rank_id);
	}

	@Override
	public void editRank_name(int rank_id) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		dao.update(rank_id);
	}

	@Override
	public void deleteRank(int rank_id) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		dao.delete(rank_id);
	}

}
