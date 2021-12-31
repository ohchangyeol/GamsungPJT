package site.gamsung.service.payment.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.PaymentCode;
import site.gamsung.service.domain.SubSite;
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
				
		if(search.getSearchItemType().equals("Payment")) {
			return sqlSession.selectOne("PaymentMapper.getTotalCountPayment", search);
		}
		
		if(search.getSearchItemType().equals("SiteProfit")) {
			return sqlSession.selectOne("PaymentMapper.getTotalCountSiteProfit", search);
		}		
		return 0;
	}
	
	
	/*
	 *  Point
	 */	
	public int pointCharge(Payment payment) {
		
		return 0;
	}
	
	public int pointWithdraw() {
		return 0;		
	}

	
	/*
	 *  Payment
	 */	
	@Override
	public void addMakePayment(Payment payment) throws Exception {
		sqlSession.insert("PaymentMapper.addMakePayment", payment);		
	}
	
	@Override
	public void addRefundPayment(Payment payment) throws Exception {
		sqlSession.update("PaymentMapper.addRefundPayment", payment);		
	}
	
	@Override
	public List<Payment> getPayment(Payment payment) throws Exception {
		return sqlSession.selectList("PaymentMapper.getPayment", payment);		
	}
	
	@Override
	public List<Payment> listPayment(Search search) throws Exception {
		return sqlSession.selectList("PaymentMapper.listPayment", search);		
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


}
