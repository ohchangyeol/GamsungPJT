package site.gamsung.service.transfer.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Receive;
import site.gamsung.service.domain.Transfer;
import site.gamsung.service.transfer.ReceiveDAO;
import site.gamsung.service.transfer.ReceiveService;
import site.gamsung.service.transfer.TransferDAO;

@Service("receiveServiceImpl") 
public class ReceiveServiceImpl implements ReceiveService {

	

	 @Autowired
	 @Qualifier("receiveDAOImpl") //@Repository("transferDAOImpl")을 호출.
	 private ReceiveDAO receiveDAO; // <-여기에 ↑ 대입 
	 
	  public void setReceiveDAO(ReceiveDAO receiveDAO) { 
	  this.receiveDAO = receiveDAO; 
	 }
	  
	public ReceiveServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public int addReceive(Receive receive) throws Exception {
		return receiveDAO.addReceive(receive);
	}

	@Override
	public List<Receive> listReceive(Search search) throws Exception {		
		return receiveDAO.listReceive(search);
	}

	@Override
	public Receive getReceive(int receiveNo) throws Exception {
		return receiveDAO.getReceive(receiveNo);
	}

	@Override
	public int updateReceive(Receive receive) throws Exception {
		return receiveDAO.updateReceive(receive);
	}

	@Override
	public int deleteReceive(int receiveNo) throws Exception {
		return receiveDAO.deleteReceive(receiveNo);
	}

	@Override
	public int blindReceive(int receiveNo) throws Exception {
		return receiveDAO.blindReceive(receiveNo);
	}

	@Override
	public int updateTransferStatus(Receive receive) throws Exception {
		return receiveDAO.updateTransferStatus(receive);
	}

	@Override
	public List<Receive> mylistReceive(Search search) throws Exception {
		return receiveDAO.mylistReceive(search);
	}

} 
