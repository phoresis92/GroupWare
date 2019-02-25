package project.groupware.message;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("messageService")
public class ServiceImpl implements Service {

	@Resource(name="sqlSession")
	private SqlSession sqlSession; // mybatis에서 사용
	private Dao dao;
	
	@Override
	public void addMessage(Message message) {
		dao = sqlSession.getMapper(Dao.class);
		dao.insert(message);
	}

	@Override
	public Message getMessage(int message_id) {
		dao = sqlSession.getMapper(Dao.class);
		return null;
	}

	@Override
	public ArrayList<Message> getSend(int send_member_id) {
		dao = sqlSession.getMapper(Dao.class);
		return null;
	}

	@Override
	public ArrayList<Message> getReceive(int receive_member_id) {
		dao = sqlSession.getMapper(Dao.class);
		return null;
	}

	@Override
	public ArrayList<Message> getRecycle(int send_member_id) {
		dao = sqlSession.getMapper(Dao.class);
		return null;
	}

	@Override
	public void EditSendDelete(int message_id) {
		dao = sqlSession.getMapper(Dao.class);
	}

	@Override
	public void EditSendRestore(int message_id) {
		dao = sqlSession.getMapper(Dao.class);
	}

	@Override
	public void EditReceiveDelete(int message_id) {
		dao = sqlSession.getMapper(Dao.class);
	}

	@Override
	public void EditReceiveRestore(int message_id) {
		dao = sqlSession.getMapper(Dao.class);
	}

	@Override
	public void EditRecycleSend(int message_id) {
		dao = sqlSession.getMapper(Dao.class);
	}

	@Override
	public void EditRecycleReceive(int message_id) {
		dao = sqlSession.getMapper(Dao.class);
	}

}
