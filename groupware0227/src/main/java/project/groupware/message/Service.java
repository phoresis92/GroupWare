package project.groupware.message;

import java.util.ArrayList;

public interface Service {

	void addMessage(Message message);
	
	Message getMessage(int message_id);
	
	ArrayList<Message> getSend(int send_member_id);
	
	ArrayList<Message> getReceive(int receive_member_id);

	ArrayList<Message> getRecycle(int send_member_id);
	
	void EditSendDelete(int message_id);
	
	void EditSendRestore(int message_id);
	
	void EditReceiveDelete(int message_id);
	
	void EditReceiveRestore(int message_id);
	
	void EditRecycleSend(int message_id);
	
	void EditRecycleReceive(int message_id);
}
