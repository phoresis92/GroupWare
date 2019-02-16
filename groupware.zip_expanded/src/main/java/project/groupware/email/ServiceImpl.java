package project.groupware.email;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import project.groupware.member.Dao;
import project.groupware.member.Member;

@Component("emailService")
public class ServiceImpl implements Service {

	@Resource(name="sqlSession")
	private SqlSession sqlSession; // mybatis에서 사용
	private Dao dao;
	
	@Override
	public void addEmail(Member m) {
		dao = sqlSession.getMapper(Dao.class);
	}

	@Override
	public Email getEmail(int email_id) {
		dao = sqlSession.getMapper(Dao.class);
		return null;
	}

	@Override
	public ArrayList<Email> getSend(int send_member_id) {
		dao = sqlSession.getMapper(Dao.class);
		return null;
	}

	@Override
	public ArrayList<Email> getReceive(int receive_member_id) {
		dao = sqlSession.getMapper(Dao.class);
		return null;
	}

	@Override
	public ArrayList<Email> getRecycle(int send_member_id) {
		dao = sqlSession.getMapper(Dao.class);
		return null;
	}

	@Override
	public void EditSendDelete(int email_id) {
		dao = sqlSession.getMapper(Dao.class);
	}

	@Override
	public void EditSendRestore(int email_id) {
		dao = sqlSession.getMapper(Dao.class);
	}

	@Override
	public void EditReceiveDelete(int email_id) {
		dao = sqlSession.getMapper(Dao.class);
	}

	@Override
	public void EditReceiveRestore(int email_id) {
		dao = sqlSession.getMapper(Dao.class);
	}

	@Override
	public void EditRecycleSend(int email_id) {
		dao = sqlSession.getMapper(Dao.class);
	}

	@Override
	public void EditRecycleReceive(int email_id) {
		dao = sqlSession.getMapper(Dao.class);
	}

}
