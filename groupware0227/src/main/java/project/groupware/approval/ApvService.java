package project.groupware.approval;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import dto.Approval_Auth;
import dto.Approval_Cate;
import dto.Approval_Dto;
import dto.ApvPayment_Dto;
import dto.MemDeposit;

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

	public int delWant(HashMap<String, Object> map);
	
	public ArrayList<Approval_Dto> getAllApvForManager();
	
	public ArrayList<Approval_Dto> getDelListForManager();
	
	public double getMember_vacation(int member_id);
	
	
	//=======================지출결제
	public int createApv_pay(ApvPayment_Dto pay);
	
	public ArrayList<ApvPayment_Dto> getAllPayApv(int approval_id);
	
	public MemDeposit getDeposit(int approval_id);
	
	public int dropApv_pay(ApvPayment_Dto pay);
	
	//======================= 리스트 검색
	public ArrayList<Approval_Dto> getSearchmyApvList(HashMap<String, Object> map);
	
	public ArrayList<Approval_Dto> getSearchtempApvList(HashMap<String, Object> map);
	
	public ArrayList<Approval_Dto> getSearchnotAuthApvList(HashMap<String, Object> map);
	
	public ArrayList<Approval_Dto> getSearchyesAuthApvList(HashMap<String, Object> map);
	
	public ArrayList<Approval_Dto> getSearchallApvList(HashMap<String, Object> map);
	
	public ArrayList<Approval_Dto> getSearchapvDelList(HashMap<String, Object> map);
	
	
	
}
