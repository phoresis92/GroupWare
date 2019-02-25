package project.groupware.message;

import java.util.ArrayList;

public interface Dao {

	void insert(Message message);
	
	Message select(int message_id);
	
	ArrayList<Message> selectSend(int send_member_id);
	
	ArrayList<Message> selectReceive(int receive_member_id);

	ArrayList<Message> selectRecycle(int send_member_id);
	
	void updateSendDelete(int message_id);
	
	void updateSendRestore(int message_id);
	
	void updateReceiveDelete(int message_id);
	
	void updateReceiveRestore(int message_id);
	
	void updateRecycleSend(int message_id);
	
	void updateRecycleReceive(int message_id);
}
