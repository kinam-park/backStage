package com.bs.payment;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bs.models.CartVO;
import com.bs.models.PaymentVO;
import com.bs.models.UserVO;




@Controller
@RequestMapping("/payment")
public class PaymentController {
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);

	@Autowired
	private PaymentService paymentService;
	
	
	/***
	 * 로그인된 계정의 결제 리스트 가져옴
	 * 서버세션을 통해 user_id 를 가져오므로 아무 input데이터가 필요없음
	 * 반환된 리스트를 가지고 group_id로 그룹을 지어 보여주면됨.
	 ***/
	@RequestMapping("/getPaymentList")
	public ModelAndView getPaymentList(PaymentVO paymentVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		List<PaymentVO> result = null;		
		if(userVO != null){
			paymentVO.setUser_id(userVO.getUser_id());
			result = paymentService.getPaymentList(paymentVO);
		}		
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	


	/***
	 * 카드 결제 완료시 결제 등록
	 * 서버세션에서 로그인 아이디 사용함.
	 #{cart_id} : 선택한 카트품목 아이디들. 예를들어 123,234,423이런식으로
	 #{total_price} : 결제한 총금액
	 #{payment_type} : 결제 방식, '계좌이체' , '카드결제'
	 #{status} : 상태('입금대기','입금완료','배송준비중','배송중','배송완료')
	 #{recv_addr1} : 배송주소1
	 #{recv_addr2} : 배송주소2
	 #{recv_zipcode} : 배송우편번호
	 #{recv_phone} : 배송 연락처
	 #{recv_name} : 배송자 이름
	 * @throws Exception 
	 ***/
	@RequestMapping("/insertPayment")
	public ModelAndView insertPayment(PaymentVO paymentVO, HttpSession session) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		boolean result = false;		
		if(userVO != null){
			paymentVO.setUser_id(userVO.getUser_id());
			result = paymentService.insertPayment(paymentVO);
		}		
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}	
		
	
	
	
	/***
	 * 결제 상태 수정(관리자만 사용)
	 * #{group_id} : 결제 그룹 아이디
	 * #{status} : 상태	  
	 ***/
	@RequestMapping("/updatePaymentStatus")
	public ModelAndView updatePaymentStatus(PaymentVO paymentVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		boolean result = false;		
		if(userVO != null && userVO.getLevel().equals("admin")){
			paymentVO.setUser_id(userVO.getUser_id());
			result = paymentService.updatePaymentStatus(paymentVO);
		}		
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}	
	

	/***
	 * 관리자용 상태별 결제 리스트 보기
	 * #{status} : 상태('입금대기','입금완료','배송준비중','배송중','배송완료')
	 * 
	 ***/
	@RequestMapping("/getPaymentListByStatus")
	public ModelAndView getPaymentListByStatus(PaymentVO paymentVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		List<PaymentVO> result = null;		
		if(userVO != null && userVO.getLevel().equals("admin")){
			paymentVO.setUser_id(userVO.getUser_id());
			result = paymentService.getPaymentListByStatus(paymentVO);
		}		
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	
	
	
	
//	/***
//	 * 컨텐츠 삭제
//	 * #{payment_id} : 삭제할 컨텐츠 아이디
//	 ***/
//	@RequestMapping("/deletePayment")
//	public ModelAndView deletePayment(PaymentVO paymentVO,HttpSession session) {
//		ModelAndView modelAndView = new ModelAndView();
//		boolean result = paymentService.deletePayment(paymentVO);
//		modelAndView.addObject("result",  result);
//		return modelAndView;
//	
//	}	
	
	
	
	
	
}


 