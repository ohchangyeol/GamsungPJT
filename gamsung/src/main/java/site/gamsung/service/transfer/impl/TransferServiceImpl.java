package site.gamsung.service.transfer.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.community.CommunityDAO;
import site.gamsung.service.domain.Post;
import site.gamsung.service.domain.Transfer;
import site.gamsung.service.transfer.TransferDAO;
import site.gamsung.service.transfer.TransferService;

@Service("transferServiceImpl") 
//아래 TransferServiceImpl Class를 (TransferServiceImpl)의 이름으로 Bean 생성 
public class TransferServiceImpl implements TransferService {

	 @Autowired
	 @Qualifier("transferDAOImpl") //@Repository("transferDAOImpl")을 호출.
	 private TransferDAO transferDAO; // <-여기에 ↑ 대입 
	 
	  public void setTransferDAO(TransferDAO transferDAO) { 
	  this.transferDAO = transferDAO; 
	 }
	 
	public TransferServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public int addTransfer(Transfer transfer) throws Exception {
		return transferDAO.addTransfer(transfer);
	}

	@Override
	public List<Transfer> listTransfer(HashMap<String, Object> map) throws Exception {
			
		List<Transfer> list = transferDAO.listTransfer(map);
		
		return list;
	}

	@Override
	public Transfer getTransfer(int transferNo) throws Exception {
		return transferDAO.getTransfer(transferNo);
	}

	@Override
	public int updateTransfer(Transfer transfer) throws Exception {
		return transferDAO.updateTransfer(transfer);
	}

	@Override
	public int deleteTransfer(int transferNo) throws Exception {
		return transferDAO.deleteTransfer(transferNo);
	}

	@Override
	public int blindTransfer(int transferNo) throws Exception {
		return transferDAO.blindTransfer(transferNo);
	}

}
