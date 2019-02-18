package project.groupware.approval;

import java.util.ArrayList;

import dto.Approval_Auth;
import dto.Approval_Cate;
import dto.Approval_Dto;

public interface ApvDao {

	public ArrayList<Approval_Cate> selectAllCate();
	
	public int selectSeqNum();
	
	public int insertApv(Approval_Dto dto);
	
	public ArrayList<Approval_Dto> selectMyAllApv(int member_id);
	
	public ArrayList<Approval_Auth> selectAllApvAuth();
	
	public Approval_Dto selectApvDetail(int approval_id);
	
}
