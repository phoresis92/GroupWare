package project.groupware.email;

import java.util.ArrayList;

public interface Dao {

	void insert(Email email);
	
	Email select(int email_id);
	
	ArrayList<Email> selectSend(int send_member_id);
	
	ArrayList<Email> selectReceive(int receive_member_id);

	ArrayList<Email> selectRecycle(int send_member_id);
	
	void updateSendDelete(int email_id);
	
	void updateSendRestore(int email_id);
	
	void updateReceiveDelete(int email_id);
	
	void updateReceiveRestore(int email_id);
	
	void updateRecycleSend(int email_id);
	
	void updateRecycleReceive(int email_id);
}
