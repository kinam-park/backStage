package com.bs.payment;
 
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bs.models.PaymentVO;



@Repository
public class PaymentDao {
	@Autowired
	private SqlSession sqlSession;
	
	
	
	public List<PaymentVO> getPaymentList(PaymentVO paymentVO) {
        return (List<PaymentVO>)sqlSession.selectList("com.bs.sql.payment.getPaymentList",paymentVO);
    }
	
	public int insertPayment(PaymentVO paymentVO) {
        return sqlSession.insert("com.bs.sql.payment.insertPayment",paymentVO);
    }
	
	public int updatePaymentStatus(PaymentVO paymentVO) {
        return sqlSession.update("com.bs.sql.payment.updatePaymentStatus",paymentVO);
    }
	
	public List<PaymentVO> getPaymentListByStatus(PaymentVO paymentVO) {
        return (List<PaymentVO>)sqlSession.selectList("com.bs.sql.payment.getPaymentListByStatus",paymentVO);
    }
	
	
	
//	public int deletePayment(PaymentVO paymentVO) {
//        return sqlSession.delete("com.bs.sql.payment.deletePayment",paymentVO);
//    }
	
	
}