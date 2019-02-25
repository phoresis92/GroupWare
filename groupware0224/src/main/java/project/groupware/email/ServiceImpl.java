package project.groupware.email;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("emailService")
public class ServiceImpl implements Service {
	
	@Resource(name="sqlSession")
	private SqlSession sqlSession; // mybatis에서 사용
	private Dao dao;

	@Override
	public void addEmail(Email email) {
		dao = sqlSession.getMapper(Dao.class);
		dao.insert(email);
	}
	
	@Override
	public void addEmails(ArrayList<Email> list) {
		dao = sqlSession.getMapper(Dao.class);
		for (Email email : list) {
			dao.insert(email);
		}
	}
	@Override
	public void addAccount(Email email) {
		dao = sqlSession.getMapper(Dao.class);
		if (dao.selectId(email) == null) {
			dao.insertAccount(email);
		} else {
			dao.updateAccount(email);
		}		
	}
	
	@Override
	public Email getEmail (int email_id) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectEmail(email_id);
	}
	
	@Override
	public Email getAccount(int member_id) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectAccount(member_id);
	}
	
	@Override
	public ArrayList<Email> getAll (){
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectAll();
	}
	
	
	@Override
	public ArrayList<Email> getSend (String send_id){
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectSend(send_id);
	}
	
	@Override
	public ArrayList<Email> getReceive (String receive_id){
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectReceive(receive_id);
	}

	@Override
	public void deleteEmail(int email_id) {
		dao = sqlSession.getMapper(Dao.class);
	}

}
