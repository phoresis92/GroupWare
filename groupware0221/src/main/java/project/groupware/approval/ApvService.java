package project.groupware.approval;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	
	public ArrayList<Approval_Dto> getNotAuthApv(int member_id);
	
	public int authApv1(Map<String, Object> map);
	public int authApv2(Map<String, Object> map);
	public int authApv3(Map<String, Object> map);
	
	public ArrayList<Approval_Dto> getYesAuthApv(int member_id);
	
	public ArrayList<Approval_Dto> getTempApvList(int member_id);
	
	public int saveReWrite(Approval_Dto dto);
	
	public int deleteTemp(int approval_id);
	
	public int decreVacat(HashMap<String, Object> map);
	public int recoverVacat(HashMap<String, Object> map);
	
	
}
