package site.gamsung.service.transfer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Transfer;

public interface TransferDAO {

	public int addTransfer(Transfer transfer)throws Exception;
	
	public List<Transfer> listTransfer(Map<String, Object> map)throws Exception;
	
	public Transfer getTransfer(int transferNo)throws Exception;

	public int updateTransfer(Transfer transfer)throws Exception;
	
	public int deleteTransfer(int transferNo)throws Exception;
	
	public int blindTransfer(int transferNo)throws Exception;
	
	public int updateReservationStatus(String reservationNo)throws Exception;
	
	public int getTotalCount(Search search) throws Exception ;
	

	public int listMyReceiveGetTotalCount(Search search) throws Exception ;
	   
   public List<Transfer> listTransferForReceive(Search search) throws Exception;
	

	/* 회원탈퇴가능여부 */
	public boolean isSecessionTransferCondition(String id)throws Exception;

}
