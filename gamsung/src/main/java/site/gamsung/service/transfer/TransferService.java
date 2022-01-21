package site.gamsung.service.transfer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Transfer;

public interface TransferService {
	
	//양도글
	
	public int addTransfer(Transfer transfer)throws Exception;
	
	public Map<String, Object> listTransfer(Map<String, Object> map)throws Exception;
	
	public Transfer getTransfer(int transferNo)throws Exception;

	public int updateTransfer(Transfer transfer)throws Exception;
	
	public int deleteTransfer(int transferNo)throws Exception;
	
	public int blindTransfer(int transferNo)throws Exception;
	
	public int updateReservationStatus(String reservationNo)throws Exception;

	
	public Map<String, Object> listTransferForReceive(Search search) throws Exception; //나의 양수! 양도엮임! 

}
