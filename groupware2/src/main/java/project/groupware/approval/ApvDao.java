package project.groupware.approval;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import dto.Approval_Auth;
import dto.Approval_Cate;
import dto.Approval_Dto;
import dto.ApvPayment_Dto;
import dto.MemDeposit;

public interface ApvDao {

	public ArrayList<Approval_Cate> selectAllCate();
	
	public int selectSeqNum();
	
	public int insertApv(Approval_Dto dto);
	
	public ArrayList<Approval_Dto> selectMyAllApv(int member_id);
	
	public ArrayList<Approval_Auth> selectAllApvAuth();
	
	public Approval_Dto selectApvDetail(int approval_id);
	
	public ArrayList<Approval_Dto> selectNotAuthApv1(int member_id);
	public ArrayList<Approval_Dto> selectNotAuthApv2(int member_id);
	public ArrayList<Approval_Dto> selectNotAuthApv3(int member_id);
	
	public int updateApv1(Map<String, Object> map);
	public int updateApv2(Map<String, Object> map);
	public int updateApv3(Map<String, Object> map);
	
	public ArrayList<Approval_Dto> selectYesAuthApv1(int member_id);
	public ArrayList<Approval_Dto> selectYesAuthApv2(int member_id);
	public ArrayList<Approval_Dto> selectYesAuthApv3(int member_id);
	
	public ArrayList<Approval_Dto> selectTempApvList(int member_id);
	
	public int updateReWrite(Approval_Dto dto);
	
	public int deleteApv(int approval_id);
	
	public int updateDecreVacat(HashMap<String, Object> map);
	public int updateRecoverVacat(HashMap<String, Object> map);

	public int updateDelWant(HashMap<String, Object> map);
	
	public ArrayList<Approval_Dto> selectAllApvForManager();
	
	public ArrayList<Approval_Dto> selectDelListForManager();
	
	public double selectMember_vacation(int member_id);
	
	
	//=======================지출결제
	public int insertApv_pay(ApvPayment_Dto pay);
	
	public ArrayList<ApvPayment_Dto> selectAllPayApv(int approval_id);
	
	public MemDeposit selectDeposit(int approval_id);
	
	public int deleteApv_pay(ApvPayment_Dto pay);
	
	//======================= 리스트 검색
	public ArrayList<Approval_Dto> selectSearchmyApvList(HashMap<String, Object> map);
	
	public ArrayList<Approval_Dto> selectSearchtempApvList(HashMap<String, Object> map);
	
	public ArrayList<Approval_Dto> selectSearchnotAuthApvList1(HashMap<String, Object> map);
	public ArrayList<Approval_Dto> selectSearchnotAuthApvList2(HashMap<String, Object> map);
	public ArrayList<Approval_Dto> selectSearchnotAuthApvList3(HashMap<String, Object> map);
	
	public ArrayList<Approval_Dto> selectSearchyesAuthApvList1(HashMap<String, Object> map);
	public ArrayList<Approval_Dto> selectSearchyesAuthApvList2(HashMap<String, Object> map);
	public ArrayList<Approval_Dto> selectSearchyesAuthApvList3(HashMap<String, Object> map);
	
	public ArrayList<Approval_Dto> selectSearchallApvList(HashMap<String, Object> map);
	
	public ArrayList<Approval_Dto> selectSearchapvDelList(HashMap<String, Object> map);
	
	public ArrayList<ApvPayment_Dto> selectPayTitle(HashMap<String, Object> map);

	
}
