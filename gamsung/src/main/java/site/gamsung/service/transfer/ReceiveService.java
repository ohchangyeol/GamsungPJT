package site.gamsung.service.transfer;

import java.util.HashMap;
import java.util.List;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Receive;
import site.gamsung.service.domain.Transfer;

public interface ReceiveService {
	

	
	public int addReceive(Receive receive)throws Exception;
	
	public List<Receive> listReceive(Search search)throws Exception;
	
	public Receive getReceive(int receiveNo)throws Exception;

	public int updateReceive(Receive receive)throws Exception;
	
	public int deleteReceive(int receiveNo)throws Exception;
	
	public int blindReceive(int receiveNo)throws Exception;
	
	public int UpdateTransferApproval(int transferNo)throws Exception;
}
