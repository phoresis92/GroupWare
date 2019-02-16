package project.groupware.member;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("memberService") // bean 이름
public class ServiceImpl implements Service{
	@Resource(name="sqlSession")
	private SqlSession sqlSession; // mybatis에서 사용
	private Dao dao;
	
	@Override
	public Member getMyInfo(int id) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		return dao.select(id);
	}
	
	@Override
	public void join(Member m) {
		dao = sqlSession.getMapper(Dao.class);
		dao.insert(m);
	}

	@Override
	public void editMyInfo(Member m) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		dao.update(m);
	}

	@Override
	public boolean checkId(int id) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		boolean flag = false;
		Member m = dao.select(id);
		if (m == null) {
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean login(int id, String pw) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		boolean flag = false;
		Member m = dao.select(id);
		if (m == null) {return flag;}
		if (m.getMember_pw() != null && m.getMember_pw().equals(pw)) {		
			flag = true;
		}
		return flag;
	}

	@Override
	public void delMember(int id) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		dao.delete(id);
	}
}
