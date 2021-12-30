package site.gamsung.service.transfer.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.common.Search;
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
	public List<Receive> listReceive(Search search) throws Exception {
	
		String Id = search.getId();  /* search안에 있는 ID는 접속자 ID */
		String Role = search.getRole();
		int TransferNo = search.getTransferNo(); /* search안에 있는 TransferNo는 클릭한 양도글NO */
					
		/*양도글번호를 넘겨서 양도글에 엮긴 양도자의 id랑 닉네임을 가져온다. */	
		Map <String,Object> map = sqlSession.selectOne("ReceiveMapper.getTransferUser", TransferNo);		
		String transferWriter = String.valueOf(map.get("id"));
		
		if (Role.equals("admin") || Id.equals(transferWriter)) { /* 관리자거나 작성자이면 */		 
		return sqlSession.selectList("ReceiveMapper.listReceive",search); 		
		}else{
		return sqlSession.selectList("ReceiveMapper.listMyReceive",search); }
	}

	@Override
	public Receive getReceive(int receiveNo) throws Exception {
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

	public int UpdateTransferApproval(int transferNo) throws Exception{
		return sqlSession.update("ReceiveMapper.updateApprovalStatus", transferNo);
	}
	
	public int UpdateTransferComplete(int transferNo) throws Exception{
		return sqlSession.update("ReceiveMapper.updateCompleteStatus", transferNo);
	}

}
