package site.gamsung.service.transfer;

import java.util.HashMap;
import java.util.List;

import site.gamsung.service.domain.Transfer;

public interface TransferDAO {

	public int addTransfer(Transfer transfer)throws Exception;
	
	public List<Transfer> listTransfer(HashMap<String, Object> map)throws Exception;
	
	public Transfer getTransfer(int transferNo)throws Exception;

	public int updateTransfer(Transfer transfer)throws Exception;
	
	public int deleteTransfer(int transferNo)throws Exception;
	
	public int blindTransfer(int transferNo)throws Exception;
}
