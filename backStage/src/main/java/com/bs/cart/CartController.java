package com.bs.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bs.models.CartVO;
import com.bs.models.UserVO;




@Controller
@RequestMapping("/cart")
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);

	@Autowired
	private CartService cartService;
	
	/***
	 * 로그인된 계정의 카트 리스트 가져옴
	 * 서버세션을 통해 user_id 를 가져오므로 아무 input데이터가 필요없음
	 ***/
	@RequestMapping("/getCartList")
	public ModelAndView getCartList(CartVO cartVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		List<CartVO> result = null;		
		if(userVO != null){
			cartVO.setUser_id(userVO.getUser_id());
			result = cartService.getCartList(cartVO);
		}		
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	
	

	/***
	 *서버세션에서 user_id를 체크후, 카트 등록
	 #{stock} : 수량
	 #{shop_id} : 품목 아이디
	 ***/
	@RequestMapping("/insertCart")
	public ModelAndView insertCart(CartVO cartVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		boolean result = false;		
		if(userVO != null){
			cartVO.setUser_id(userVO.getUser_id());
			result = cartService.insertCart(cartVO);
		}		
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}	
	

		
	
	
	
	/***
	 * 서버세션에서 user_id를 체크후, 카트 수량 수정
	 * #{cart_id} : 카트
	 * #{shop_id} : 품목 아이디
	 * #{stock} : 수량
	 ***/
	@RequestMapping("/updateCart")
	public ModelAndView updateCart(CartVO cartVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		boolean result = false;		
		if(userVO != null){
			cartVO.setUser_id(userVO.getUser_id());
			result = cartService.updateCart(cartVO);
		}
		
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}	
	
	/***
	 * 서버세션에서 user_id를 체크후, 컨텐츠 삭제
	 * #{cart_id} : 삭제할 컨텐츠 아이디
	 ***/
	@RequestMapping("/deleteCart")
	public ModelAndView deleteCart(CartVO cartVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		boolean result = false;		
		if(userVO != null){
			cartVO.setUser_id(userVO.getUser_id());
			result = cartService.deleteCart(cartVO);
		}
		
		
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}	
}


 