package project.groupware.email;

import java.util.ArrayList;
import java.util.HashMap;

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
			dao.insertExternal_mail(email);
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
	public ArrayList<Email> getAll (){
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectAll();
	}
	
	@Override
	public Email getAccount(String member_id) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectAccount(member_id);
	}
	
	@Override
	public Email getAccountId(String email_account) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectAccountId(email_account);
	}
	
	@Override
	public Email getEmail (int email_id) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectEmail(email_id);
	}	
	
	@Override
	public ArrayList<Email> getSend (HashMap<String, Object> map){
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectSend(map);
	}
	
	@Override
	public ArrayList<Email> getReceive (HashMap<String, Object> map){
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectReceive(map);
	}
	
	@Override
	public ArrayList<Email> getExReceive (HashMap<String, Object> map){
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectReceive(map);
	}
	
	@Override
	public ArrayList<Email> gettReceiveCount (String receive_id){
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectReceiveCount(receive_id);
	}
	
	@Override
	public ArrayList<Email> getRecycle (HashMap<String, Object> map){
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectRecycle(map);
	}
	
	@Override
	public ArrayList<Email> getExRecycle (HashMap<String, Object> map){
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectRecycle(map);
	}
	
	@Override
	public void editEmail (Email email) {
		dao = sqlSession.getMapper(Dao.class);
		dao.updateEmail(email);
	}
	
	@Override
	public void deleteEmail(int email_id) {
		dao = sqlSession.getMapper(Dao.class);
		dao.delete(email_id);
	}
	
	@Override
	public void deleteAccount (String member_id) {
		dao = sqlSession.getMapper(Dao.class);
		dao.deleteAccount(member_id);
	}
}
