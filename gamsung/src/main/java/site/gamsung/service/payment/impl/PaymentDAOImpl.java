package site.gamsung.service.payment.impl;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.PaymentCode;
import site.gamsung.service.domain.PointTransfer;
import site.gamsung.service.domain.SiteProfit;
import site.gamsung.service.payment.PaymentDAO;

@Repository("paymentDAOImpl")
public class PaymentDAOImpl implements PaymentDAO{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public PaymentDAOImpl() {
		System.out.println(this.getClass());
	}
	
	
	/*
	 * Common
	 */	
	public int getTotalCount(Search search) throws Exception {
		
		if(search.getSearchItemType().equals("SiteProfit")) {
			return sqlSession.selectOne("PaymentMapper.getTotalCountSiteProfit", search);
		}		
		return 0;
	}
	
	
	/*
	 *  Point
	 */	
	public int pointUpdateById(PointTransfer pointTransfer) throws Exception {
		
		System.out.println("DAO pointTransferByUsers_pointTransfer: " + pointTransfer); 		
		return sqlSession.update("PaymentMapper.pointUpdateById", pointTransfer);
	}
	
	
	/*
	 *  Payment
	 */	
	@Override
	public String addPayment(Payment payment) throws Exception {
		sqlSession.insert("PaymentMapper.addMakePaymentIn", payment);	
		return sqlSession.selectOne("PaymentMapper.addMakePaymentOut", payment);	
	}
	
	@Override
	public void updateRefundPayment(Payment payment) throws Exception {
		sqlSession.update("PaymentMapper.updateRefundPayment", payment);		
	}
		
	@Override
	public List<Payment> listPayment(Search search) throws Exception {
		return sqlSession.selectList("PaymentMapper.listPayment", search);		
	}
	
	@Override
	public Payment getPaymentInfo(String paymentNo) throws Exception {
		return sqlSession.selectOne("PaymentMapper.getPaymentInfo", paymentNo);		
	}
	
	@Override
	public List<Payment> getPaymentListByRsvNo(String reservationNo) throws Exception{
		return sqlSession.selectList("PaymentMapper.getPaymentListByRsvNo", reservationNo);		
	}
	
	
	/*
	 *  PaymentCode
	 */
	@Override
	public void addPaymentCode(PaymentCode paymentCode) throws Exception{		
		sqlSession.insert("PaymentMapper.addPaymentCode", paymentCode);
	}
	
	@Override
	public void updatePaymentCode(PaymentCode paymentCode) throws Exception{		
		sqlSession.update("PaymentMapper.updatePaymentCode", paymentCode);
	}
	
	@Override
	public List<PaymentCode> listPaymentCode() throws Exception{		
		return sqlSession.selectList("PaymentMapper.listPaymentCode");
	}		

	@Override
	public PaymentCode getPaymentCodeInfo(String paymentCodeLetter) throws Exception{		
		return sqlSession.selectOne("PaymentMapper.getPaymentCodeInfo", paymentCodeLetter);
	}
	

	/*
	 *  SiteProfit
	 */
	public Payment getPaymentRecord(HashMap<String, Object> searchParameter) throws Exception{		
		return sqlSession.selectOne("PaymentMapper.getPaymentRecord", searchParameter);
	}	
	
	public int addSiteProfit(SiteProfit siteProfit)throws Exception{		
		return sqlSession.insert("PaymentMapper.addSiteProfit", siteProfit);
	}
	
	public SiteProfit listSiteProfit(String targetDay) throws Exception{		
		return sqlSession.selectOne("PaymentMapper.listSiteProfit", targetDay);
	}
	



}
