package com.bs.payment;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.cart.CartDao;
import com.bs.models.CartVO;
import com.bs.models.PaymentVO;
import com.bs.shop.ShopDao;
 


@Service
public class PaymentService{
	
	@Autowired
	private PaymentDao paymentDao;
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private CartDao cartDao;
	
	public List<PaymentVO> getPaymentList(PaymentVO paymentVO){
		return paymentDao.getPaymentList(paymentVO);
	}
	

	
	public boolean insertPayment(PaymentVO paymentVO) throws Exception{
		//cart_id로 카트에 들어있는 물품 가져옴. 
		
		CartVO cartVO = new CartVO();
		int totalPrice = Integer.valueOf(paymentVO.getTotal_price()).intValue();
		
		// 결제 항목을 카트항목에서 가져옴
		String carts = paymentVO.getCart_id();
		String[] cartArr = carts.split(",");
		String query = "";
		for(int i = 0 ; i < i ; i++){
			if( i == 0 ){
				query += " CART_ID = " + cartArr[i] + " ";
			}else{
				query += " OR CART_ID = " + cartArr[i] + " ";
			}
		}
		cartVO.setCart_id(query);
		List<CartVO> selectedCartList = cartDao.getSelectedCartList(cartVO);
		/////
		
		Date d = new Date();
		long time = d.getTime();
		
		paymentVO.setGroup_id(paymentVO.getUser_id()+"_"+time);
		for(int i = 0 ; i < selectedCartList.size() ; i++){
			String shopId = selectedCartList.get(i).getShop_id();
			String price = selectedCartList.get(i).getPrice();
			String stock = selectedCartList.get(i).getStock();
			
			paymentVO.setShop_id(shopId);
			paymentVO.setPrice(price);
			paymentVO.setStock(stock);
			
			
			int cnt = paymentDao.insertPayment(paymentVO);
			
			
			if(cnt == 1){
				
			}else{
				throw new Exception();
			}
			
			
			
			
		}
		
		return true;
		
		
	}
	
	public boolean updatePaymentStatus(PaymentVO paymentVO){
		
		int cnt = paymentDao.updatePaymentStatus(paymentVO);
		boolean result = false;
		if(cnt == 1){
			result = true;
		}
		return result;
	}
	
	
	
	public List<PaymentVO> getPaymentListByStatus(PaymentVO paymentVO){
		return paymentDao.getPaymentListByStatus(paymentVO);
	}
	
	
	
	
//	public boolean deletePayment(PaymentVO paymentVO){
//		int cnt = paymentDao.deletePayment(paymentVO);
//		boolean result = false;
//		if(cnt == 1){
//			result = true;
//		}
//		return result;
//	}
    
}