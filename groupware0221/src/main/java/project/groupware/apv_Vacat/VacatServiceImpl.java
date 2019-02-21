package project.groupware.apv_Vacat;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import project.groupware.approval.ApvDao;

@Component("VacatService")
public class VacatServiceImpl implements VacatService{

	@Resource(name="sqlSession")
	private SqlSession sqlSession; // mybatis에서 사용
	private VacatDAO dao;
	
	
	@Override
	public double getMember_vacation(int member_id) {
		dao = sqlSession.getMapper(VacatDAO.class);
		return dao.selectMember_vacation(member_id);
	}
	
}
