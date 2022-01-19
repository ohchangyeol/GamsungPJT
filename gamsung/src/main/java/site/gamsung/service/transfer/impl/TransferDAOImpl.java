package site.gamsung.service.transfer.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.Receive;
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
	public List<Transfer> listTransfer(Map<String, Object> map) throws Exception {
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

	@Override
	public int updateReservationStatus(String reservationNo) throws Exception {
	return sqlSession.update("TransferMapper.updateReservationStatus", reservationNo);	
	}
	
	
	@Override
	public boolean isSecessionTransferCondition(String id) throws Exception {
		
		List<Transfer> list= sqlSession.selectList("TransferMapper.getTransferStatus", id);
		
		List<Receive> list2= sqlSession.selectList("ReceiveMapper.getReceiveStatus", id);		
		//리턴 값이 있으면 회원 탈퇴 불가 : flag false. 리턴 값이 없으면 회원 탈퇴 가능 : flag true.
		
		if(list.size() != 0 && list2.size() !=0) {
			return false;
		}else {
			return true;
		}
	
	}
	
	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("TransferMapper.getTotalCount", search);
	}


	@Override
   public List<Transfer> listTransferForReceive(Search search) throws Exception {
//	      System.out.println(sqlSession.selectList("TransferMapper.listTransferForReceive", userId));
      return sqlSession.selectList("TransferMapper.listTransferForReceive", search);
   }

   @Override
   public int listMyReceiveGetTotalCount(Search search) throws Exception {
      return sqlSession.selectOne("TransferMapper.listMyReceiveGetTotalCount", search);
   }
}
