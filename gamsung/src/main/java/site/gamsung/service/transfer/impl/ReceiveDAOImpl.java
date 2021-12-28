package site.gamsung.service.transfer.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.domain.Receive;
import site.gamsung.service.domain.Transfer;
import site.gamsung.service.transfer.ReceiveDAO;

@Repository("receiveDAOImpl")
public class ReceiveDAOImpl implements ReceiveDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("sqlSessions"+sqlSession);
		this.sqlSession = sqlSession;
	}	
	
	public ReceiveDAOImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public int addReceive(Receive receive) throws Exception {
		return sqlSession.insert("ReceiveMapper.addReceive", receive);
	}

	@Override
	public List<Transfer> listReceive(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList("ReceiveMapper.listReceive", map);
	}

	@Override
	public Transfer getReceive(int receiveNo) throws Exception {
		return sqlSession.selectOne("ReceiveMapper.getReceive", receiveNo);
	}

	@Override
	public int updateReceive(Receive receive) throws Exception {
		return sqlSession.update("ReceiveMapper.updateReceive", receive);	
	}

	@Override
	public int deleteReceive(int receiveNo) throws Exception {
		return sqlSession.update("ReceiveMapper.deleteReceive", receiveNo);
	}

	@Override
	public int blindReceive(int receiveNo) throws Exception {
		return sqlSession.update("ReceiveMapper.blindReceive", receiveNo);
	}

	
	
}
