package site.gamsung.service.payment.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.PaymentCode;
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
	 *  Point
	 */	
	
	
	
	/*
	 *  Payment
	 */	
	@Override
	public void addMakePayment() throws Exception {
		// TODO Auto-generated method stub
		
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
	public int getFeeByPaymentCode(String paymentCodeLetter) throws Exception{		
		return sqlSession.selectOne("PaymentMapper.getFeeByPaymentCode", paymentCodeLetter);
	}
	

	/*
	 *  SiteProfit
	 */


}
