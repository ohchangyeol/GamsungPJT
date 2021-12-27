package site.gamsung.service.transfer.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.domain.Transfer;
import site.gamsung.service.transfer.TransferDAO;


@Repository("transferDAOImpl")
public class TransferDAOImpl implements TransferDAO {
		
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("sqlSessions"+sqlSession);
		this.sqlSession = sqlSession;
	}	
	

	public TransferDAOImpl() {
		System.out.println(this.getClass());
	}
	
	//Method
	
	@Override
	public int addTransfer(Transfer transfer) throws Exception {
		return sqlSession.insert("TransferMapper.addTransfer", transfer);
	}

	@Override
	public List<Transfer> listTransfer(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList("TransferMapper.listTransfer", map);
	}

	@Override
	public Transfer getTransfer(int transferNo) throws Exception {
		return sqlSession.selectOne("TransferMapper.getTransfer", transferNo);
	}

	@Override
	public int updateTransfer(Transfer transfer) throws Exception {
		return sqlSession.update("TransferMapper.updateTransfer", transfer);	
	}

	@Override
	public int deleteTransfer(int transferNo) throws Exception {
		return sqlSession.update("TransferMapper.deleteTransfer", transferNo);
	}

	@Override
	public int blindTransfer(int transferNo) throws Exception {
		return sqlSession.update("TransferMapper.blindTransfer", transferNo);
	}

}
