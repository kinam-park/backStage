package com.bs.shop;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bs.models.ShopVO;




@Controller
@RequestMapping("/shop")
public class ShopController {
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);

	@Autowired
	private ShopService shopService;
	
	/***
	 * 해당 카테고리에 대한 물품 리스트를 가져옴
	 * #{category_code} : 쇼핑물품 카테고리 코드(자전거)
	 * 	 
	 ***/
	@RequestMapping("/getShopList")
	public ModelAndView getShopList(ShopVO shopVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		List<ShopVO> result = shopService.getShopList(shopVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	
	/***
	 * 쇼핑아이템 디테일 정보 가져옴.쇼핑아이템 리스트에서 하나를 선택했을때 해당하는 쇼핑 아이디로 아이템 정보 가져옴 
	 * #{shop_id} : 쇼핑아이템 아이디
	 * 	 
	 ***/
	@RequestMapping("/getShop")
	public ModelAndView getShop(ShopVO shopVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		ShopVO result = shopService.getShop(shopVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
//	@RequestMapping("/getCategoryList")
//	public ModelAndView getCategoryList(ShopVO shopVO,HttpSession session) {
//		ModelAndView modelAndView = new ModelAndView();
//		List<ShopVO> result = shopService.getCategoryList(shopVO);
//		modelAndView.addObject("result",  result);
//		return modelAndView;
//	
//	}
	
	
	
	/***
	 * 컨텐츠 생성
	 * #{title} : 제목
	 * #{contents} : 컨텐츠
	 * #{price} : 가격
	 * #{is_enable} : 활성화 유무  Y / N
	 * #{category_code} : 카테고리 코드 (자전거 BIKE이런)
	 * #{point} : 구매시 받을수 있는 포인트
	 * #{user_id} : 작성자 아이디
	 * #{size} : 사이즈
	 * #{stock} : 수량
	 * #{brand} : 브랜드명 
	 ***/
	@RequestMapping("/insertShop")
	public ModelAndView insertShop(ShopVO shopVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		boolean result = shopService.insertShop(shopVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}	
		
	
	/***
	 * 컨텐츠 수정
	 * #{title} : 제목
	 * #{contents} : 컨텐츠
	 * #{price} : 가격
	 * #{is_enable} : 활성화 유무  Y / N
	 * #{category_code} : 카테고리 코드 (자전거 BIKE이런)
	 * #{point} : 구매시 받을수 있는 포인트
	 * #{user_id} : 작성자 아이디
	 * #{size} : 사이즈
	 * #{stock} : 수량
	 * #{brand} : 브랜드명 
	 ***/
	@RequestMapping("/updateShop")
	public ModelAndView updateShop(ShopVO shopVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		boolean result = shopService.updateShop(shopVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}	
	
	/***
	 * 컨텐츠 삭제
	 * #{shop_id} : 삭제할 컨텐츠 아이디
	 ***/
	@RequestMapping("/deleteShop")
	public ModelAndView deleteShop(ShopVO shopVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		boolean result = shopService.deleteShop(shopVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}	
}


 