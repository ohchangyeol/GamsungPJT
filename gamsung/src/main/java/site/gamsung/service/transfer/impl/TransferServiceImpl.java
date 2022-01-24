package site.gamsung.service.transfer.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.common.Search;
import site.gamsung.service.community.CommunityDAO;
import site.gamsung.service.domain.NoticeWrapper;
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

	@Override
	public int updateReservationStatus(String reservationNo) throws Exception {
		return transferDAO.updateReservationStatus(reservationNo);
	}


	@Override
	public Map<String, Object> listTransfer(Map<String, Object> map) throws Exception {		
		
		Search search = (Search) map.get("search");
		
		 List<Transfer> list = transferDAO.listTransfer(map);
		 
		 for (Transfer transfer : list) {
			 
			 if(transfer.getTransferArea() != null && !("".equals(transfer.getTransferArea())) ) {
				 
				int index = transfer.getTransferArea().indexOf(" ");
				String addr = transfer.getTransferArea().substring(0,index);
				
				transfer.setTransferArea(addr);
			}
			
		}
		 
		 int TotalCount = transferDAO.getTotalCount(search);
	
		map.put("list", list);
		map.put("TotalCount",TotalCount);
		
		return map;
	}

   @Override
   public Map<String ,Object> listTransferForReceive(Search search) throws Exception {
      Map<String, Object> map = new HashMap<String, Object>();
      List<Transfer> list = transferDAO.listTransferForReceive(search); 
      
      for (Transfer transfer : list) {
			 
		 if(transfer.getTransferArea() != null && !("".equals(transfer.getTransferArea())) ) {
			 
			int index = transfer.getTransferArea().indexOf(" ");
			String addr = transfer.getTransferArea().substring(0,index);
			
			transfer.setTransferArea(addr);
		 }
			
      }
      map.put("list", list); 
      map.put("TotalCount",transferDAO.listMyReceiveGetTotalCount(search));
      
      return map;
   }

	
	
	
}
