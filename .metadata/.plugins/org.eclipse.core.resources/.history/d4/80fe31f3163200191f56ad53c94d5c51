package project.groupware.member;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("memberService") // bean 이름
public class ServiceImpl implements MService{
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
	public boolean checkLogin(int id, String pwd) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		boolean flag = false;
		Member m = dao.select(id);
		if (m == null) {return flag;}
		if (m.getMember_pw() != null && m.getMember_pw().equals(pwd)) {		
			flag = true;
		}
		return flag;
	}
	
	@Override
	public void delMember(int id) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		dao.delete(id);
	}

	@Override
	public ArrayList<Member> getAllMem() {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		return dao.selectAllMem();
	}

	@Override
	public ArrayList<MemberJoin> getAllMemJoin() {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		return dao.selectAllMemJoin();
	}

	@Override
	public ArrayList<MemberJoin> searchByDeptId(int id) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		return dao.selectByDeptId(id);
	}

	@Override
	public ArrayList<MemberJoin> searchByName(String searchName) {
		dao = sqlSession.getMapper(Dao.class); // DaoImpl 객체를 생성
		return dao.selectByName("%"+searchName+"%");
	}
	
	
}
