package project.groupware.approval;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import dto.Approval_Auth;
import dto.Approval_Cate;
import dto.Approval_Dto;
import dto.ApvPayment_Dto;
import dto.MemDeposit;

@Component("ApvService")
public class ApvServiceImpl implements ApvService {
	
	@Resource(name="sqlSession")
	private SqlSession sqlSession; // mybatis에서 사용
	private ApvDao dao;
	
	@Override
	public ArrayList<Approval_Cate> getAllCate() {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.selectAllCate();
	}

	@Override
	public int getSeqNum() {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.selectSeqNum();
	}

	@Override
	public int createApv(Approval_Dto dto) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.insertApv(dto);
	}

	@Override
	public ArrayList<Approval_Dto> getMyAllApv(int member_id) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.selectMyAllApv(member_id);
	}

	@Override
	public ArrayList<Approval_Auth> getAllApvAuth() {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.selectAllApvAuth();
	}

	@Override
	public Approval_Dto getApvDetail(int approval_id) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.selectApvDetail(approval_id);
	}

	@Override
	public ArrayList<Approval_Dto> getNotAuthApv(int member_id) {
		dao = sqlSession.getMapper(ApvDao.class);
		ArrayList<Approval_Dto> list = dao.selectNotAuthApv1(member_id);
		list.addAll(dao.selectNotAuthApv2(member_id));
		list.addAll(dao.selectNotAuthApv3(member_id));
		Collections.sort(list);
		return list;
	}

	@Override
	public int authApv1(Map<String, Object> map) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.updateApv1(map);
	}

	@Override
	public int authApv2(Map<String, Object> map) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.updateApv2(map);
	}

	@Override
	public int authApv3(Map<String, Object> map) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.updateApv3(map);
	}

	@Override
	public ArrayList<Approval_Dto> getYesAuthApv(int member_id) {
		dao = sqlSession.getMapper(ApvDao.class);
		ArrayList<Approval_Dto> list = dao.selectYesAuthApv1(member_id);
		list.addAll(dao.selectYesAuthApv2(member_id));
		list.addAll(dao.selectYesAuthApv3(member_id));
		return list;
	}

	@Override
	public ArrayList<Approval_Dto> getTempApvList(int member_id) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.selectTempApvList(member_id);
	}

	@Override
	public int saveReWrite(Approval_Dto dto) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.updateReWrite(dto);
	}

	@Override
	public int deleteTemp(int approval_id) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.deleteApv(approval_id);
	}

	@Override
	public int decreVacat(HashMap<String, Object> map) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.updateDecreVacat(map);
	}

	@Override
	public int recoverVacat(HashMap<String, Object> map) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.updateRecoverVacat(map);
	}

	@Override
	public int delWant(HashMap<String, Object> map) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.updateDelWant(map);
	}

	@Override
	public ArrayList<Approval_Dto> getAllApvForManager() {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.selectAllApvForManager();
	}

	@Override
	public ArrayList<Approval_Dto> getDelListForManager() {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.selectDelListForManager();
	}

	
	
	@Override
	public double getMember_vacation(int member_id) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.selectMember_vacation(member_id);
	}

	@Override
	public int createApv_pay(ApvPayment_Dto pay) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.insertApv_pay(pay);
	}

	@Override
	public ArrayList<ApvPayment_Dto> getAllPayApv(int approval_id) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.selectAllPayApv(approval_id);
	}

	@Override
	public MemDeposit getDeposit(int approval_id) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.selectDeposit(approval_id);
	}

	@Override
	public int dropApv_pay(ApvPayment_Dto pay) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.deleteApv_pay(pay);
	}

	@Override
	public ArrayList<Approval_Dto> getSearchmyApvList(HashMap<String, Object> map) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.selectSearchmyApvList(map);
	}

	@Override
	public ArrayList<Approval_Dto> getSearchtempApvList(HashMap<String, Object> map) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.selectSearchtempApvList(map);
	}

	@Override
	public ArrayList<Approval_Dto> getSearchnotAuthApvList(HashMap<String, Object> map) {
		dao = sqlSession.getMapper(ApvDao.class);
		ArrayList<Approval_Dto> list = dao.selectSearchnotAuthApvList1(map);
		list.addAll(dao.selectSearchnotAuthApvList2(map));
		list.addAll(dao.selectSearchnotAuthApvList3(map));
		return list;
	}

	@Override
	public ArrayList<Approval_Dto> getSearchyesAuthApvList(HashMap<String, Object> map) {
		dao = sqlSession.getMapper(ApvDao.class);
		ArrayList<Approval_Dto> list = dao.selectSearchyesAuthApvList1(map);
		list.addAll(dao.selectSearchyesAuthApvList2(map));
		list.addAll(dao.selectSearchyesAuthApvList3(map));
		return list;
	}

	@Override
	public ArrayList<Approval_Dto> getSearchallApvList(HashMap<String, Object> map) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.selectSearchallApvList(map);
	}

	@Override
	public ArrayList<Approval_Dto> getSearchapvDelList(HashMap<String, Object> map) {
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.selectSearchapvDelList(map);
	}

	
	@Override
	public ArrayList<ApvPayment_Dto> getPayTitle(HashMap<String, Object> map){
		dao = sqlSession.getMapper(ApvDao.class);
		return dao.selectPayTitle(map);
	}


}
