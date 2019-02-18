package project.groupware.approval;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import dto.Approval_Auth;
import dto.Approval_Cate;
import dto.Approval_Dto;

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
	

}
