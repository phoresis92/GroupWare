package project.groupware.approval;

import java.util.ArrayList;

import dto.Approval_Auth;
import dto.Approval_Cate;
import dto.Approval_Dto;

public interface ApvService {
	
	ArrayList<Approval_Cate> getAllCate();	
	
	public int getSeqNum();
	
	public int createApv(Approval_Dto dto);
	
	public ArrayList<Approval_Dto> getMyAllApv(int member_id);

	public ArrayList<Approval_Auth> getAllApvAuth();
	
	public Approval_Dto getApvDetail(int approval_id);
	
}
