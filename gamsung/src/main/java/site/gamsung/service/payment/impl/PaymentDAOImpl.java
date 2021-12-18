package site.gamsung.service.payment.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

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

	@Override
	public void addMakePayment() throws Exception {
		// TODO Auto-generated method stub
		
	}


}
