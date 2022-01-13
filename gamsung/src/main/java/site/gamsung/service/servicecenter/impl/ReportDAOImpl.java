package site.gamsung.service.servicecenter.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Report;
import site.gamsung.service.domain.User;
import site.gamsung.service.servicecenter.ReportDAO;

@Repository("reportDAOImpl")
public class ReportDAOImpl implements ReportDAO {

	// Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	// Constructor
	public ReportDAOImpl() {
		System.out.println("@Repository :: " + this.getClass());
	}

	// Setter
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void addReport(Report report) throws Exception {
		sqlSession.insert("ReportMapper.addReport",report);
	}

	@Override
	public Report getReport(int reportNo) throws Exception {
		return sqlSession.selectOne("ReportMapper.getReport",reportNo);
	}
	
	@Override
	public List<Report> listReport(Search search) throws Exception {
		return sqlSession.selectList("ReportMapper.listReport",search);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ReportMapper.getTotalCount",search);
		
	}

	@Override
	public void deleteReport(int reportNo) throws Exception {
		sqlSession.update("ReportMapper.deleteReport",reportNo);
	}

	@Override
	public int notTotalCountReport() throws Exception {
		return sqlSession.selectOne("ReportMapper.notTotalcount");
	}

	@Override
	public void updateCodeReport(Report report) {
		sqlSession.selectOne("ReportMapper.updateCode",report);
	}

	@Override
	public User findReceiverId(Report report) {
		
		return sqlSession.selectOne("ReportMapper.findReceiverId",report);
	}
	
	
}
